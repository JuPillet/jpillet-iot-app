#!/bin/bash
repo_name="jpillet-iot-app-bonus"
repo_clone="../../$repo_name"
repo_dir="$repo_clone/bonus"
mkdir repo_dir

cp -rf argocd gitlab iot-wil-app $repo_dir/.