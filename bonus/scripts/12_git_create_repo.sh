#!/bin/bash
gitlab_host="gitlab.localhost:8888"
gitlab_api="http://api.$gitlab_host/api/v4"

repo_name="$1"
repo_clone="../../$repo_name"

pa_token=$(cat "pa_token.txt")
echo "pa_token : $pa_token"

user_id=$(echo $pa_token | cut -d ":" -f9 | cut -d "," -f1)
echo "user : $user_id"

token=$(echo $pa_token | cut -d "\"" -f30)
echo "token : $token"

response=$(sudo curl -s --request POST "$gitlab_api/projects" \
    --header "Authorization: Bearer $token" \
	--header "Content-Type: application/json" \
    --data '{
        "name": "'$repo_name'",
        "description": "'$repo_name'",
        "path": "'$repo_name'",
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
