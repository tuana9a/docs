# TROUBESHOOT

## containerd runtime

### Unimplemented desc unknown service runtime

```shell
error execution phase preflight: [preflight] Some fatal errors occurred:
[ERROR CRI]: container runtime is not running: output: time="2023-09-27T11:39:41Z" level=fatal msg="validate service connection: validate CRI v1 runtime API for endpoint \"unix:///var/run/containerd/containerd.sock\": rpc error: code = Unimplemented desc = unknown service runtime.v1.RuntimeService", error: exit status 1
```

Solution: [https://github.com/containerd/containerd/issues/8139#issuecomment-1491536705](https://github.com/containerd/containerd/issues/8139#issuecomment-1491536705)

```bash
vi /etc/containerd/config.toml
```

Add these lines

```vim
enabled_plugins = ["cri"]
[plugins."io.containerd.grpc.v1.cri".containerd]
  endpoint = "unix:///var/run/containerd/containerd.sock"
```

## metrics-server

### failed to validate certificate

because of self-signed certificate then to make metrics-server work we need to pass `--kubelet-insecure-tls` to its configuration, See
[https://stackoverflow.com/questions/68648198/metrics-service-in-kubernetes-not-working](https://stackoverflow.com/questions/68648198/metrics-service-in-kubernetes-not-working)

```bash
kubectl -n kube-system edit deploy metrics-server
```

```yaml
spec:
  template:
    spec:
      containers:
        - args:
          - --cert-dir=/tmp
          - --secure-port=4443
          - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
          - --kubelet-use-node-status-port
          - --metric-resolution=15s
          - --kubelet-insecure-tls=true # @tuana9a add this line
          image: k8s.gcr.io/metrics-server/metrics-server:v0.6.1
          imagePullPolicy: IfNotPresent
```

### apiservice failed

run `kubectl describe apiservice v1beta1.metrics.k8s.io` show below error

```bash
v1beta1.metrics.k8s.io failed with: failing or missing response from https://10.233.237.162:443/apis/metrics.k8s.io/v1beta1: Get "https://10.233.237.162:443/apis/metrics.k8s.io/v1beta1": net/http: request canceled while waiting for connection (Client.Timeout exceeded while awaiting headers)
```

on master node add `--enable-aggregator-routing=true` to `/etc/kubernetes/manifests/kube-apiserver.yaml`

```yaml
spec:
  containers:
  - command:
    - ...
    - --enable-aggregator-routing=true # add this line
```

then delete the `api-server` pod on the `kube-system` namespace or restart the `kubelet` on the master node

Thanks [https://github.com/kubernetes-sigs/metrics-server/issues/448#issuecomment-590715541](https://github.com/kubernetes-sigs/metrics-server/issues/448#issuecomment-590715541) for helping me solve this error, but when reading README requirements you'll see it [https://github.com/kubernetes-sigs/metrics-server#requirements](https://github.com/kubernetes-sigs/metrics-server#requirements)

## argocd

### status Processing because of load balancer

(optional) if you setup k8s locally, then the ingress load balancer external ip will be `"Pending"`, which make the app health will be always `"Processing"`. \
edit argocd configmap will fix this issue. Thanks [https://github.com/argoproj/argo-cd/issues/1704#issuecomment-621739570](https://github.com/argoproj/argo-cd/issues/1704#issuecomment-621739570)

```bash
kubectl -n argocd edit configmap/argocd-cm
```

old version the resource name for ingress is `extensions/Ingress`

```yaml
# @tuana9a add this
data:
  resource.customizations: |
    extensions/Ingress:
      health.lua: |
        hs = {}
        hs.status = "Healthy"
        return hs
```

newer resource name for ingress is `networking.k8s.io/Ingress` instead of `extensions/Ingress`

```yaml
# @tuana9a add this
data:
  resource.customizations: |
    networking.k8s.io/Ingress:
      health.lua: |
        hs = {}
        hs.status = "Healthy"
        return hs
```
