# swap on linux

## create new swap

```bash
sudo fallocate -l 1G /swapfile
```

```bash
sudo chmod 600 /swapfile
```

```bash
sudo mkswap /swapfile
```

```bash
sudo swapon /swapfile
```

## **(optional)** make new swap pernament when reboot

```bash
sudo nano /etc/fstab
```

then add these new content

```text
/swapfile swap swap defaults 0 0
```

## remove a swap

```bash
sudo swapoff -v /swapfile
```

```bash
sudo rm /swapfile
```

delete entry in /etc/fstab if you added it

```bash
sudo nano /etc/fstab
```

## change swap size

```bash
sudo dd if=/dev/zero of=/swapfile bs=1M count=2048
```
