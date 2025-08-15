#!/bin/sh

# Install kubernetes, minikube and helm
cd /tmp

## Install Kubectl
# Official site https://kubernetes.io/
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin

## Install Minikube
# Official site https://minikube.sigs.k8s.io/
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64/
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start

# Install Helm
# Official site https://helm.sh/
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
sh ./get_helm.sh
# Make sure we get the latest list of chart
helm repo update
# * Happy Helming *
helm ls
