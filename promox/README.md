# proxmox resize disk for ubuntu server 18.04

Thanks

[https://pve.proxmox.com/wiki/Resize_disks](https://pve.proxmox.com/wiki/Resize_disks)

[https://packetpushers.net/ubuntu-extend-your-default-lvm-space/](https://packetpushers.net/ubuntu-extend-your-default-lvm-space/)

[https://askubuntu.com/questions/1106795/ubuntu-server-18-04-lvm-out-of-space-with-improper-default-partitioning](https://askubuntu.com/questions/1106795/ubuntu-server-18-04-lvm-out-of-space-with-improper-default-partitioning)

on proxmox

`qm resize <vmid> <disk> <size>`

```bash
qm resize 102 scsi0 +80G
```

on ubuntu server

```bash
lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
```

```bash
resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
```
