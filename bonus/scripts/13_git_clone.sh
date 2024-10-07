#!/bin/bash
gitlab_host="gitlab.localhost:8888"
gitlab_api="http://api.$gitlab_host"
gitlab_gui="http://$gitlab_host"
gitlab_ssh="ssh://git@$gitlab_host"

repo_clone="../../$5"

sudo git clone http://$1:$2@$gitlab_api/$1/$5.git $repo_clone

echo $response

sudo git ${repo_clone} config user.email "$4"

sudo git ${repo_clone} config user.name "$3"

sudo git -C ${repo_clone} commit -m "add info on the repo"

sudo git -C ${repo_clone} push http://$1:$2@$gitlab_host/$1/$5.git main