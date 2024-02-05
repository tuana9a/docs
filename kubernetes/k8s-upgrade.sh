#!/bin/bash

# https://medium.com/@felipedutratine/when-you-try-to-drain-a-kubernetes-node-but-it-blocks-5aba9592d7c9

K8S_MINOR_VERSION=1.27
K8S_VERSION=v1.27.6
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v$K8S_MINOR_VERSION/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
curl -fsSL https://pkgs.k8s.io/core:/stable:/v$K8S_MINOR_VERSION/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

### UPGRADE MASTER
apt-mark unhold kubeadm
apt-get update
apt-get install -y kubeadm
apt-mark hold kubeadm

kubeadm upgrade plan --ignore-preflight-errors=ControlPlaneNodesReady
kubeadm upgrade apply $K8S_VERSION --ignore-preflight-errors=ControlPlaneNodesReady

kubectl drain k8s-instance-1 --ignore-daemonsets

apt-mark unhold kubelet kubectl
apt-get update
apt-get install -y kubelet kubectl
apt-mark hold kubelet kubectl

sudo systemctl daemon-reload
sudo systemctl restart kubelet

kubectl uncordon k8s-instance-1

kubectl get pods -o wide --all-namespaces | grep k8s-instance-1
kubectl delete pod -n=default --grace-period=0 --force

### UPGRADE WORKER
apt-mark unhold kubeadm
apt-get update
apt-get install -y kubeadm
apt-mark hold kubeadm

sudo kubeadm upgrade node

kubectl drain k8s-instance-2 --ignore-daemonsets

apt-mark unhold kubelet kubectl
apt-get update
apt-get install -y kubelet kubectl
apt-mark hold kubelet kubectl

sudo systemctl daemon-reload
sudo systemctl restart kubelet

kubectl uncordon k8s-instance-2

kubectl get pods -o wide --all-namespaces | grep k8s-instance-2
kubectl delete pod -n=default --grace-period=0 --force