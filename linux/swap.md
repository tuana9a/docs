# swap

Create swap

```bash
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

(optional) Make swap pernament after reboot

```bash
sudo nano /etc/fstab
# add this line
/swapfile swap swap defaults 0 0
```

Change swap size

```bash
sudo dd if=/dev/zero of=/swapfile bs=1M count=2048
```

Remove swap

```bash
sudo swapoff -v /swapfile
sudo rm /swapfile
```

(Remember) delete it in `/etc/fstab` if you added it

```bash
sudo nano /etc/fstab
# remove this line
/swapfile swap swap defaults 0 0
```
