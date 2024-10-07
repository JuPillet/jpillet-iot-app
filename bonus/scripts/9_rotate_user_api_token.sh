#!/bin/bash
gitlab_host="gitlab.localhost:8888"
gitlab_api="http://api.$gitlab_host/api/v4"

api_token=$(cat "api_token.txt")
echo "api_token : $api_token"

token_id=$(echo $api_token | cut -d ":" -f2 | cut -d "," -f1)
echo "token_id : $token_id"

token=$(echo $api_token | cut -d "\"" -f30)
echo "token : $token"

response=$(sudo curl -s --request POST "$gitlab_api/personal_access_tokens/$token_id/rotate" \
   --header "Authorization: Bearer $token" \
)
echo "response : $response"
echo $response > api_token.txt
