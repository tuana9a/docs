# (experiment) begin installation

edit `install-kube.vars.yaml`, `inventory.ini` remember to edit these files to match your setup.\
edit `files/kube-flannel.yaml` to match your setup.\
for example with vagrant, the network for nodes communicate should be `eth1` we need to add `--iface=eth1`.

See [https://github.com/flannel-io/flannel](https://github.com/flannel-io/flannel)

```bash
ansible-playbook -i inventory.ini install-kube.playbook.yaml
```

wait (up to 10 minutes)

```bash
kubectl get nodes -o wide
```
