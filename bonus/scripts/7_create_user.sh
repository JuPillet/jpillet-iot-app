#!/bin/bash
gitlab_host="gitlab.localhost:8888"
gitlab_http="http://api.$gitlab_host"
gitlab_api="$gitlab_http/api/v4"

gitlab_admin="root"
gitlab_password=$(bash ./scripts/6_get_rootpass.sh FORTOKEN=1)

echo 'grant_type=password&username='$gitlab_admin'&password='$gitlab_password > ../../auth.txt

oauth_token=$(curl -s --request POST "$gitlab_host/oauth/token" --data "@../../auth.txt")
echo "oauth-token : $oauth_token"

access_token=$(echo $oauth_token | cut -d "\"" -f4)
echo "access token : $access_token"

curl --request POST "$gitlab_api/users" \
  --form "access_token=$access_token" \
  --form "username=$1" \
  --form "password=$2" \
  --form "name=$3" \
  --form "email=$4" \
  --form "skip_confirmation=true"
