#!/bin/bash
echo "déploiement de l'application"
sudo kubectl apply -n argocd -f ./manifests/argocd-wil-app.yaml
echo "application déployé"