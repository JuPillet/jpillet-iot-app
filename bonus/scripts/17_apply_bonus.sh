#!/bin/bash
internal_cluster_gitlab_ip=$(sudo kubectl get svc -n gitlab \
	| grep "gitlab-webservice-default" \
	| cut -d " " -f 7 \
)

internal_cluster_gitlab_http="http://$internal_cluster_gitlab_ip:8181"

echo "apiVersion: argoproj.io/v1alpha1" > ./argocd/manifests/argocd-wil-app.yaml
echo "kind: Application" >> ./argocd/manifests/argocd-wil-app.yaml
echo "metadata:" >> ./argocd/manifests/argocd-wil-app.yaml
echo "  name: $2" >> ./argocd/manifests/argocd-wil-app.yaml
echo "spec:" >> ./argocd/manifests/argocd-wil-app.yaml
echo "  destination:" >> ./argocd/manifests/argocd-wil-app.yaml
echo "    name: ''" >> ./argocd/manifests/argocd-wil-app.yaml
echo "    namespace: dev" >> ./argocd/manifests/argocd-wil-app.yaml
echo "    server: https://kubernetes.default.svc" >> ./argocd/manifests/argocd-wil-app.yaml
echo "  source:" >> ./argocd/manifests/argocd-wil-app.yaml
echo "    path: $3" >> ./argocd/manifests/argocd-wil-app.yaml
echo "    repoURL: $internal_cluster_gitlab_http/$1/$2.git" >> ./argocd/manifests/argocd-wil-app.yaml
echo "    targetRevision: HEAD" >> ./argocd/manifests/argocd-wil-app.yaml
echo "    directory:" >> ./argocd/manifests/argocd-wil-app.yaml
echo "      recurse: true" >> ./argocd/manifests/argocd-wil-app.yaml
echo "  sources: []" >> ./argocd/manifests/argocd-wil-app.yaml
echo "  project: default" >> ./argocd/manifests/argocd-wil-app.yaml
echo "  syncPolicy:" >> ./argocd/manifests/argocd-wil-app.yaml
echo "    automated:" >> ./argocd/manifests/argocd-wil-app.yaml
echo "      prune: true" >> ./argocd/manifests/argocd-wil-app.yaml
echo "      selfHeal: true" >> ./argocd/manifests/argocd-wil-app.yaml
echo "    syncOptions:" >> ./argocd/manifests/argocd-wil-app.yaml
echo "      - ApplyOutOfSyncOnly=true" >> ./argocd/manifests/argocd-wil-app.yaml

echo "déploiement de l'application"
sudo kubectl apply -n argocd -f ./argocd/manifests/argocd-wil-app.yaml
echo "application déployé"
