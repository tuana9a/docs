## how to add NAT network to proxmox

ssh into proxmox server and edit /etc/network/interfaces

```bash
vim /etc/network/interfaces
```

Add new network, ex: `vmbr2`, **IMPORTANT**: interface name must start with `vmbr`, ex: `vmbr1`, `vmbr2`

```bash
auto vmbr2
iface vmbr2 inet static
    address  192.168.1.1
    netmask  255.255.255.0
    bridge_ports none
    bridge_stp off
    bridge_fd 0
    post-up   echo 1 > /proc/sys/net/ipv4/ip_forward
    post-up   iptables -t nat -A POSTROUTING -s '192.168.1.0/24' -o vmbr0 -j MASQUERADE
    post-down iptables -t nat -D POSTROUTING -s '192.168.1.0/24' -o vmbr0 -j MASQUERADE
    post-up   echo 0 > /proc/sys/net/ipv4/ip_forward
```

Whereas vmbr0 is the destination network to forward to, which has public internet access.

Then to enable new network interface, do

```bash
ifup vmbr2
```

or reload all interfaces.

```bash
ifreload -a # just to make sure
```
