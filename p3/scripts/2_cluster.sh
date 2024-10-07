#!/bin/bash
echo "création du cluster"
sudo k3d cluster create jpillet --api-port 6550 -p "8888:80@loadbalancer"
sleep 3
echo "installation de kubernetes"
export KUBECONFIG=$(sudo k3d kubeconfig write jpillet)
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl
echo "kubernetes installé"

echo "création des namespaces"
sudo kubectl create namespace argocd
sudo kubectl create namespace dev
echo "namespaces créé"

echo "installation d'argocd"
export KUBECONFIG=$(sudo k3d kubeconfig write jpillet)
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sudo kubectl wait --for=condition=ready --timeout=-1s pods -n argocd -l app.kubernetes.io/name=argocd-server
sudo kubectl apply -f ./argocd/manifests/argocd-ingress.yaml
sudo kubectl wait --for=condition=ready --timeout=-1s pod -n argocd -l app.kubernetes.io/name=argocd-server
sudo kubectl patch -n argocd deploy argocd-server --patch-file ./argocd/manifests/argocd-insecure.yaml
sudo kubectl wait --for=condition=ready --timeout=-1s pod -n argocd -l app.kubernetes.io/name=argocd-server
echo "argocd installé"
echo "cluster créé"