# create new swap

```bash
SWAP_NAME=/swapfile

sudo fallocate -l 1G $SWAP_NAME
sudo chmod 600 $SWAP_NAME
sudo mkswap $SWAP_NAME
sudo swapon $SWAP_NAME
```

**make new swap pernament**

```bash
sudo nano /etc/fstab

# add these new content
/swap.img swap swap defaults 0 0
# change to /swapfile if you use /swapfile above
/swapfile swap swap defaults 0 0
```

# remove a swap

```bash
SWAP_NAME=/swapfile

sudo swapoff -v $SWAP_NAME
sudo rm $SWAP_NAME

# delete entry in /etc/fstab if you added it
sudo nano /etc/fstab
```