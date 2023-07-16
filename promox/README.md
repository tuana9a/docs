# proxmox

## increase default root storage for storing virtual machines

first remove `local-lvm` that doesn't need anymore.

open the proxmox server shell.

```bash
lvremove /dev/pve/data
```

this will make the root fs take 100% space of the disk.

```bash
lvresize -l +100%FREE /dev/pve/root
```

```bash
resize2fs /dev/mappper/pve-root
```

## proxmox resize disk for ubuntu server 18.04

on proxmox

```bash
# qm resize <vmid> <disk> <size>
qm resize 102 scsi0 +80G
```

on ubuntu virtual machines

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

```bash
auto vmbr2
iface vmbr2 inet static
        address  192.168.1.1
        netmask  255.255.255.0
        bridge_ports none
        bridge_stp off
        bridge_fd 0
 
post-up echo 1 > /proc/sys/net/ipv4/ip_forward
post-up   iptables -t nat -A POSTROUTING -s '192.168.1.0/24' -o vmbr1 -j MASQUERADE
post-down iptables -t nat -D POSTROUTING -s '192.168.1.0/24' -o vmbr1 -j MASQUERADE
```

```bash
ifup vmbr2
```

```bash
ifreload -a # just to make sure
```
