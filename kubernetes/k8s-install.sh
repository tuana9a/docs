#!/bin/bash

# This script is to setup k8s cluster with 4 nodes
# 1 master: 192.168.56.21
# 3 workers: 192.168.56.22, 192.168.56.23, 192.168.56.24
# Remember to edit the ip for your setup

##### DO THE FOLLOWING SCRIPTS IN EVERY NODES

# Switch to root user
sudo -i

# Disable swap
swapoff -a -v

# Enable ip forward
echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf

# To avoid [ERROR FileContent--proc-sys-net-bridge-bridge-nf-call-iptables]: /proc/sys/net/bridge/bridge-nf-call-iptables does not exist
# Solution https://stackoverflow.com/questions/44125020/cant-install-kubernetes-on-vagrant
echo br_netfilter > /etc/modules-load.d/br_netfilter.conf
systemctl restart systemd-modules-load.service
echo 1 > /proc/sys/net/bridge/bridge-nf-call-iptables
echo 1 > /proc/sys/net/bridge/bridge-nf-call-ip6tables
echo net.bridge.bridge-nf-call-iptables=1 >> /etc/sysctl.conf
sysctl -p

# Start installing Docker
apt install ca-certificates gnupg apt-transport-https

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo "deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \"$(. /etc/os-release && echo $VERSION_CODENAME)\" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# **IMPORTANT**: cri: dockerd is not supported from 1.24
# so no need to install `docker-ce` and `docker-ce-cli`
# only need to install `containerd.io`
apt install containerd.io

# Add the repository for K8S
K8S_MINOR_VERSION=1.27
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v$K8S_MINOR_VERSION/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v$K8S_MINOR_VERSION/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# Install K8S dependencies
apt-mark unhold kubelet kubeadm kubectl
apt install kubelet kubeadm kubectl

# (Optional) Manually specify the node ip, default is the "eth0" ip
IFNAME=eth0
NODE_IP=$(ifconfig $IFNAME 2> /dev/null | awk '/inet / {print $2}'|sed 's/addr://')
echo adding "KUBELET_EXTRA_ARGS=\"--node-ip=$NODE_IP\"" to /etc/default/kubelet
echo "KUBELET_EXTRA_ARGS=\"--node-ip=$NODE_IP\"" | sudo tee -a /etc/default/kubelet
systemctl restart kubelet
cat /etc/default/kubelet

# error execution phase preflight: [preflight] Some fatal errors occurred:
#	[ERROR CRI]: container runtime is not running: output: time="2023-09-27T11:39:41Z" level=fatal msg="validate service connection: validate CRI v1 runtime API for endpoint \"unix:///var/run/containerd/containerd.sock\": rpc error: code = Unimplemented desc = unknown service runtime.v1.RuntimeService", error: exit status 1
# See README.md for fixing this error

# Hold apt package to avoid unintended upgrade
apt-mark hold kubelet kubeadm kubectl

##### DO THE FOLLOWING IN MASTER NODE ONLY

# init the cluster
IFNAME=eth0
NODE_IP=$(ifconfig $IFNAME 2> /dev/null | awk '/inet / {print $2}'|sed 's/addr://')
POD_NETWORK_CIDR=10.244.0.0/16  # (fixed) See https://github.com/flannel-io/flannel
SERVICE_CIDR=10.233.0.0/16      # (optional) k8s service
APISERVER_ADVERTISE_ADDRESS=$NODE_IP # (optional) Your master/control-plane ip address
CONTROL_PLANE_ENDPOINT=$NODE_IP      # (optional) Your master/control-plane ip address

kubeadm init --pod-network-cidr="$POD_NETWORK_CIDR" \
  --service-cidr="$SERVICE_CIDR" \
  --apiserver-advertise-address="$APISERVER_ADVERTISE_ADDRESS" \
  --control-plane-endpoint="$CONTROL_PLANE_ENDPOINT"

##### DO THE FOLLOWING IN WORKER NODES

# After run `kubeadm init` command successfully on master node(s) you'll see an output with something like

# You can now join any number of control-plane nodes by copying certificate authorities
# and service account keys on each node and then running the following as root:
#
#   kubeadm join 192.168.56.21:6443 --token xxx.yyy \
#	    --discovery-token-ca-cert-hash sha256:zzz \
#	    --control-plane
#
# Then you can join any number of worker nodes by running the following on each as root:
#
#   kubeadm join 192.168.56.21:6443 --token xxx.yyy \
# 	  --discovery-token-ca-cert-hash sha256:zzz

# You can the output command to join any workers
# But token has a life time so if you plan to join later, run
kubeadm token create --print-join-command
