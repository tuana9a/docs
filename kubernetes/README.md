# kubernetes

## Prerequisites

Some virtual machines

## Install

See [install-kube.sh](install-kube.sh), this script is to setup k8s cluster with 4 nodes

- 1 master: 192.168.56.21
- 3 workers: 192.168.56.22, 192.168.56.23, 192.168.56.24

From 1.24 dockerd is not supported, See [https://kubernetes.io/docs/tasks/administer-cluster/migrating-from-dockershim/change-runtime-containerd/](https://kubernetes.io/docs/tasks/administer-cluster/migrating-from-dockershim/change-runtime-containerd/)

See [TROUBLESHOOT.md#containerd-runtime](TROUBLESHOOT.md#containerd-runtime) if you face containerd runtime error

## flannel cni

```bash
kubectl apply -f kube-flannel.yaml
```

## dynamic nfs persistence volume

setup nfs server [How To Set Up an NFS Mount on Ubuntu 20.04 | Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nfs-mount-on-ubuntu-20-04)

```bash
sudo apt install nfs-kernel-server
sudo mkdir -p /exports/dynamic-pv/ # or what ever you want, but if you change remember to edit that later in the dynamic-nfs-pv.yaml deployment section
sudo chown nobody:nogroup /exports/dynamic-pv/
sudo vim /etc/exports
# add this line
/exports/dynamic-pv/ 192.168.56.0/24(rw,sync,no_subtree_check) # again, change the ip if you want
sudo systemctl restart nfs-kernel-server
```

edit [dynamic-nfs-pv.yaml](dynamic-nfs-pv.yaml) if neccessary

```bash
kubectl apply -k dynamic-nfs-pv.yaml
```

example usage `test-pv.yaml`

```yaml
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: test-claim
spec:
  storageClassName: nfs-client
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Mi
---
kind: Pod
apiVersion: v1
metadata:
  name: test-pod
spec:
  containers:
  - name: test-pod
    image: busybox:stable
    command:
      - "/bin/sh"
    args:
      - "-c"
      - "touch /mnt/SUCCESS && exit 0 || exit 1"
    volumeMounts:
      - name: nfs-pvc
        mountPath: "/mnt"
  restartPolicy: "Never"
  volumes:
    - name: nfs-pvc
      persistentVolumeClaim:
        claimName: test-claim
```

## ingress-nginx

[https://kubernetes.github.io/ingress-nginx/deploy/](https://kubernetes.github.io/ingress-nginx/deploy/)

the `ingress-nginx.yaml` file is downloaded from [https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.2/deploy/static/provider/cloud/deploy.yaml](https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.2/deploy/static/provider/cloud/deploy.yaml)

```bash
kubectl apply -f ingress-nginx.yaml
```

some error with ingress-nginx: ingress-nginx-admission not found, failed to call webhook: Post "ingress-nginx-controller-admission" connection refused, just delete the webhook

```bash
kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
```

## metrics-server

(for auto scaling)

Thanks [https://viblo.asia/p/k8s-phan-5-metrics-server-cho-k8s-va-demo-hpa-oOVlYRwz58W](https://viblo.asia/p/k8s-phan-5-metrics-server-cho-k8s-va-demo-hpa-oOVlYRwz58W)

[https://github.com/kubernetes-sigs/metrics-server](https://github.com/kubernetes-sigs/metrics-server)

`metrics-server.yaml` is got from [https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/high-availability-1.21+.yaml](https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/high-availability-1.21+.yaml)

```bash
kubectl apply -f metrics-server.yaml
```

You'll want to checkout [TROUBLESHOOT.md#metrics-server](TROUBLESHOOT.md#metrics-server) to see if you face any errors.

### cert-manager

```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.0/cert-manager.yaml
```

## argo-cd

[https://argo-cd.readthedocs.io/en/stable/](https://argo-cd.readthedocs.io/en/stable/)

`argo-cd.yaml` is got from [https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml](https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml)

```bash
kubectl create namespace argocd
kubectl -n argocd apply -f argo-cd.yaml
```

Also checkout [TROUBLESHOOT.md#argocd](TROUBLESHOOT.md#argocd) to see if you face any errors.
