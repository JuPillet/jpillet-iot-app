#!/bin/bash
gitlab_host="gitlab.localhost:8888"
gitlab_http="http://api.$gitlab_host"
gitlab_api="$gitlab_http/api/v4"

pa_token=$(cat "../../pa_token.txt")
echo "pa_token : $pa_token"

token_id=$(echo $pa_token | cut -d ":" -f2 | cut -d "," -f1)
echo "token_id : $token_id"

token=$(echo $pa_token | rev | cut -d "\"" -f2 | rev)
echo "token : $token"

response=$(sudo curl -s --request POST "$gitlab_api/personal_access_tokens/$token_id/rotate" \
   --header "Authorization: Bearer $token" \
)
echo "response : $response"
echo $response > pa_token.txt
