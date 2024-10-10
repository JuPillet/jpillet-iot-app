#!/bin/bash
gitlab_host="gitlab.localhost:8888"
gitlab_http="http://api.$gitlab_host"
gitlab_api="$gitlab_http/api/v4"

repo_clone="../../$3"

sudo git clone http://$1:$2@$gitlab_host/$1/$3.git $repo_clone