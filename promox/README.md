# proxmox

## increase default root storage for storing virtual machines

first remove `local-lvm` via the web-ui.

![./imgs/remove-local-lvm-via-web-ui.png](./imgs/remove-local-lvm-via-web-ui.png)

open the proxmox server shell then type these commands to take 100% disk size.

```bash
lvremove /dev/pve/data
```

```bash
lvresize -l +100%FREE /dev/pve/root
```

```bash
resize2fs /dev/mapper/pve-root
```

then allow disk image for storage

![./imgs/allow-disk-image-for-storage.png](./imgs/allow-disk-image-for-storage.png)

## proxmox resize disk for ubuntu server 18.04

on proxmox host

```bash
qm resize <vmid> <disk> <size>
```

```bash
qm resize 102 scsi0 +80G
```

on virtual machines

```bash
lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
```

```bash
resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
```

### Refs

[https://pve.proxmox.com/wiki/Resize_disks](https://pve.proxmox.com/wiki/Resize_disks)

[https://packetpushers.net/ubuntu-extend-your-default-lvm-space/](https://packetpushers.net/ubuntu-extend-your-default-lvm-space/)

[https://askubuntu.com/questions/1106795/ubuntu-server-18-04-lvm-out-of-space-with-improper-default-partitioning](https://askubuntu.com/questions/1106795/ubuntu-server-18-04-lvm-out-of-space-with-improper-default-partitioning)

## how to add NAT network to proxmox

open the proxmox server shell.

edit /etc/network/interfaces

```bash
vim /etc/network/interfaces
```

add these line, edit if necessary 😊.

**IMPORTANT**: interface name must start with `vmbr`, ex: `vmbr1`, `vmbr2`

```bash
auto vmbr2
iface vmbr2 inet static
        address  192.168.1.1
        netmask  255.255.255.0
        bridge_ports none
        bridge_stp off
        bridge_fd 0
 
post-up echo 1 > /proc/sys/net/ipv4/ip_forward

post-up   iptables -t nat -A POSTROUTING -s '192.168.1.0/24' -o vmbr0 -j MASQUERADE
post-down iptables -t nat -D POSTROUTING -s '192.168.1.0/24' -o vmbr0 -j MASQUERADE
```

vmbr0 is another interface that will be used to access outside network (NAT)

```bash
ifup vmbr2
```

```bash
ifreload -a # just to make sure
```
