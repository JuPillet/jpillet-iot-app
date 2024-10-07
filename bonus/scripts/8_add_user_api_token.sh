#!/bin/bash
gitlab_host="gitlab.localhost:8888"
gitlab_api="http://api.$gitlab_host/api/v4"

gitlab_user="$1"
gitlab_pass="$2"

echo 'grant_type=password&username='$gitlab_user'&password='$gitlab_pass > auth.txt

oauth_token=$(curl -s --request POST "$gitlab_host/oauth/token" --data "@auth.txt")
echo "oauth-token : $oauth_token"

access_token=$(echo $oauth_token | cut -d "\"" -f4)
echo "access token : $access_token"

id_user=$(curl --header "Authorization: Bearer $access_token" "$gitlab_host/oauth/token/info" -s | cut -d ":" -f2 | cut -d "," -f1)
echo "id_user : $id_user"

gitlab_user="root"
gitlab_pass=$(bash ./scripts/6_get_rootpass.sh FORTOKEN=1)

echo 'grant_type=password&username='$gitlab_user'&password='$gitlab_pass > auth.txt

oauth_token=$(curl -s --request POST "$gitlab_host/oauth/token" --data "@auth.txt")
echo "oauth-token : $oauth_token"

access_token=$(echo $oauth_token | cut -d "\"" -f4)
echo "access token : $access_token"

expires_at=$(sudo date -d "+2 days" +"%Y-%m-%d %H:%M:%S")

response=$(sudo curl -s --request POST --url "$gitlab_api/users/$id_user/personal_access_tokens" \
    --header "Authorization: Bearer $access_token" \
	--data "name=api_token" \
    --data "scopes[]=api" \
	--data "expires_at=$expires_at" \
)

echo "response : $response"

echo $response > api_token.txt

api_token=$(cat "api_token.txt")
echo "api_token : $api_token"

token=$(echo $api_token | cut -d "\"" -f30)
echo "token : $token"

response=$(sudo curl -s --request GET "$gitlab_api/personal_access_tokens" \
    --header "Authorization: Bearer $token" \
)
echo "response : $response"

