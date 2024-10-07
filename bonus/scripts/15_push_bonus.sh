#!/bin/bash
gitlab_host="gitlab.localhost:8888"
gitlab_api="http://api.$gitlab_host"
gitlab_gui="http://$gitlab_host"
gitlab_ssh="ssh://git@$gitlab_host"

repo_clone="../../$repo_name"

sudo git -C ${repo_clone} add .

sudo git -C ${repo_clone} commit -m "$4"

sudo git -C ${repo_clone} push http://$1:$2@$gitlab_host/$1/$3.git main
