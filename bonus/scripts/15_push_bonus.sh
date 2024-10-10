#!/bin/bash
gitlab_host="gitlab.localhost:8888"
gitlab_http="http://api.$gitlab_host"
gitlab_api="$gitlab_http/api/v4"

repo_clone="../../$5"

sudo git -C ${repo_clone} config user.email "$4"

sudo git -C ${repo_clone} config user.name "$3"

sudo git -C ${repo_clone} add .

sudo git -C ${repo_clone} commit -m "$4"

sudo git -C ${repo_clone} push http://$1:$2@$gitlab_host/$1/$5.git main
