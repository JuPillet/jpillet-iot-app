#!/bin/bash
gitlab_host="gitlab.localhost:8888"
gitlab_http="http://api.$gitlab_host"
gitlab_api="$gitlab_http/api/v4"

gitlab_user="$1"
gitlab_pass="$2"

if [ -f "pa_token.txt" ]; then
    make delusertoken
fi

echo 'grant_type=password&username='$gitlab_user'&password='$gitlab_pass > auth.txt

oauth_token=$(curl -s --request POST "$gitlab_host/oauth/token" --data "@auth.txt")
echo "oauth-token : $oauth_token"

access_token=$(echo $oauth_token | cut -d "\"" -f4)
echo "access token : $access_token"

user_id=$(curl -s "$gitlab_host/oauth/token/info" \
	--header "Authorization: Bearer $access_token" \
	| cut -d ":" -f2 \
	| cut -d "," -f1 \
)
echo "user_id : $user_id"

gitlab_user="root"
gitlab_pass=$(bash ./scripts/6_get_rootpass.sh FORTOKEN=1)

echo 'grant_type=password&username='$gitlab_user'&password='$gitlab_pass > auth.txt

oauth_token=$(curl -s --request POST "$gitlab_host/oauth/token" --data "@auth.txt")
echo "oauth-token : $oauth_token"

access_token=$(echo $oauth_token | cut -d "\"" -f4)
echo "access token : $access_token"

expires_at=$(sudo date -d "+2 days" +"%Y-%m-%d %H:%M:%S")

response=$(sudo curl -s --request POST --url "$gitlab_api/users/$user_id/personal_access_tokens" \
    --header "Authorization: Bearer $access_token" \
	--data "name=pa_token" \
    --data "scopes[]=$(echo "$3" | sed 's/ /,/g' | sed 's/, /,/g' | sed 's/,,/,/g')" \
	--data "expires_at=$expires_at" \
)

echo "response : $response"

echo $response > pa_token.txt

pa_token=$(cat "pa_token.txt")
echo "pa_token : $pa_token"

token=$(echo $pa_token | rev | cut -d "\"" -f2 | rev)
echo "token : $token"

response=$(sudo curl -s --request GET "$gitlab_api/personal_access_tokens" \
    --header "Authorization: Bearer $token" \
)
echo "response : $response"

