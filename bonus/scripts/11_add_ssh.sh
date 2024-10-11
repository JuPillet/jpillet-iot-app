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

user=$(curl -s "$gitlab_api/user" \
	--header "Authorization: Bearer $token" \
)
echo $user

user_id=$(echo $user | cut -d ":" -f2 | cut -d "," -f1)
echo "user_id : $user_id"

ssh_pub=$(sudo find ~/ -type f -wholename */.ssh/*.pub)

ssh_public_key="$(cat $ssh_pub)"
echo $ssh_public_key

curl -s --request POST "$gitlab_api/user/keys" \
  --header "PRIVATE-TOKEN: $token" \
  --form "title=IOT-SSH-KEY" \
  --form "key=$ssh_public_key"