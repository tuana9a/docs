#!/bin/bash

sudo -i
WORKDIR=/tmp

export ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
export ETCDCTL_CERT=/etc/kubernetes/pki/apiserver-etcd-client.crt
export ETCDCTL_KEY=/etc/kubernetes/pki/apiserver-etcd-client.key
export ETCDCTL_API=3
export ETCD_SNAPSHOT=$WORKDIR/snapshot.db

# BACKUP
etcdctl member list
etcdctl snapshot save $ETCD_SNAPSHOT
etcdctl --write-out=table snapshot status $ETCD_SNAPSHOT
cp -r /etc/kubernetes/pki/ $WORKDIR

# RESTORE
etcdctl snapshot restore $ETCD_SNAPSHOT
cp -r $WORKDIR/pki /etc/kubernetes
cp -r $WORKDIR/default.etcd/member /var/lib/etcd/

IFNAME=eth0
NODE_IP=$(ifconfig $IFNAME 2> /dev/null | awk '/inet / {print $2}'|sed 's/addr://')
POD_NETWORK_CIDR=10.244.0.0/16  # (fixed) See https://github.com/flannel-io/flannel 
SERVICE_CIDR=10.233.0.0/16      # (optional) k8s service
APISERVER_ADVERTISE_ADDRESS=$NODE_IP # (optional) Your master/control-plane ip address
CONTROL_PLANE_ENDPOINT=$NODE_IP      # (optional) Your master/control-plane ip address

kubeadm init --pod-network-cidr="$POD_NETWORK_CIDR" \
  --service-cidr="$SERVICE_CIDR" \
  --apiserver-advertise-address="$APISERVER_ADVERTISE_ADDRESS" \
  --control-plane-endpoint="$CONTROL_PLANE_ENDPOINT" \
  --ignore-preflight-errors=DirAvailable--var-lib-etcd
