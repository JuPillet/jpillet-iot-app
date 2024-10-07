#!/bin/bash
gitlab_host="gitlab.localhost:8888"
gitlab_api="http://api.$gitlab_host/api/v4"

api_token=$(cat "api_token.txt")
echo "api_token : $api_token"

token_id=$(echo $api_token | cut -d ":" -f2 | cut -d "," -f1)
echo "token_id : $token_id"

token=$(echo $api_token | cut -d "\"" -f30)
echo "token : $token"

user_id=$(curl -s --header "Authorization: Bearer $token" "$gitlab_api/user" | cut -d ":" -f2 | cut -d "," -f1)
echo "id_user : $id_user"

ssh_pub=$(sudo find ~/ -type f -wholename */.ssh/*.pub)

ssh_public_key="$(cat $ssh_pub)"
echo $ssh_public_key

curl -s --request POST "$gitlab_api/user/keys" \
  --header "PRIVATE-TOKEN: $token" \
  --form "title=MY-SSH-KEY" \
  --form "key=$ssh_public_key"