# create new swap
SWAP_NAME=/swap.img
SWAP_NAME=/swapfile

sudo fallocate -l 1G $SWAP_NAME
sudo chmod 600 $SWAP_NAME
sudo mkswap $SWAP_NAME
sudo swapon $SWAP_NAME

# make new swap pernament
sudo nano /etc/fstab
# add these new content
/swap.img swap swap defaults 0 0
# change to /swapfile if you use /swapfile above
/swapfile swap swap defaults 0 0

# remove a swap
# if add to /etc/fstab so delete it also
sudo swapoff -v $SWAP_NAME
sudo rm $SWAP_NAME
