#!/bin/bash
echo "supression de l'application"
sudo kubectl delete -n argocd -f ./manifests/argocd-wil-app.yaml
echo "application supprimé"