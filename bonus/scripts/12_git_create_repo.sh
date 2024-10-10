#!/bin/bash
gitlab_host="gitlab.localhost:8888"
gitlab_http="http://api.$gitlab_host"
gitlab_api="$gitlab_http/api/v4"

repo_clone="../../$1"

pa_token=$(cat "pa_token.txt")
echo "pa_token : $pa_token"

token=$(echo $pa_token | rev | cut -d "\"" -f2 | rev)
echo "token : $token"

user=$(curl -s "$gitlab_api/user" \
	--header "Authorization: Bearer $token" \
)
echo $user

user_id=$(echo $user | cut -d ":" -f2 | cut -d "," -f1)
echo "user_id : $user_id"

user_name=$(echo $user | cut -d "\"" -f6 | cut -d "," -f1)
echo "user_id : $user_name"

response=$(sudo curl -s --request POST "$gitlab_api/projects" \
    --header "Authorization: Bearer $token" \
	--header "Content-Type: application/json" \
    --data '{
        "name": "'$1'",
        "description": "'$1'",
        "path": "'$1'",
        "namespace_id": "'$user_id'",
        "initialize_with_readme": true,
        "visibility": "public"
    }'
)
echo "depo created: $response"

response=$(sudo curl -s --request GET "$gitlab_api/users/$user_id/projects" \
    --header "Authorization: Bearer $token" \
)
echo "user depo lists: $response"
