#!/bin/bash
#CERTMAIL="exemple@exemple.exemple"
sudo kubectl create namespace gitlab

sudo helm repo add gitlab https://charts.gitlab.io/
sudo helm repo update

sudo helm upgrade --install gitlab gitlab/gitlab \
  -n gitlab \
  -f https://gitlab.com/gitlab-org/charts/gitlab/raw/master/examples/values-minikube-minimum.yaml \
  --set global.hosts.domain=localhost \
  --set global.hosts.externalIP=0.0.0.0 \
  --set global.hosts.https=false \
  --set global.ingress.enabled=true \
  --set global.initialRootPassword.secretName=gitlab-initial-root-password \
  --set gitlab.webservice.ingress.pathType=Prefix \
  --set gitlab.webservice.ingress.path=/ \
  --set gitlab.webservice.ingress.hosts[0].name=gitlab.localhost \
  --set gitlab.webservice.ingress.hosts[0].path=/ \
  --set gitlab.webservice.ingress.port=8181 \
  --timeout 600s \
#  --set certmanager-issuer.email=$CERTMAIL \