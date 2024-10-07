#!/bin/bash

echo "déploiement de l'application"
sudo kubectl apply -n argocd -f ./argocd/manifests/argocd-wil-app.yaml
echo "application déployé"