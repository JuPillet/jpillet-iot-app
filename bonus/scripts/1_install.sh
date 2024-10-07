#!/bin/bash

curl -fsSL -o ./scripts/get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 ./scripts/get_helm.sh
./scripts/get_helm.sh
