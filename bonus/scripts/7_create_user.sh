#!/bin/bash
gitlab_host="gitlab.localhost:8888"
gitlab_api="http://api.$gitlab_host/api/v4"
gitlab_admin="root"
gitlab_password=$(bash ./scripts/6_get_rootpass.sh FORTOKEN=1)

new_user=$0
new_pass=$1

echo 'grant_type=password&username='$gitlab_admin'&password='$gitlab_pass > auth.txt

oauth_token=$(curl -s --request POST "$gitlab_host/oauth/token" --data "@auth.txt")
echo "oauth-token : $oauth_token"

access_token=$(echo $oauth_token | cut -d "\"" -f4)
echo "access token : $access_token"

curl --request POST "$gitlab_api/users" \
  --form "access_token=$access_token" \
  --form "username=$2" \
  --form "password=$3" \
  --form "name=$1" \
  --form "email=$4" \
  --form "skip_confirmation=true"
