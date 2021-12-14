# create new swap
sudo fallocate -l 1G /swap.img
sudo chmod 600 /swap.img
sudo mkswap /swap.img
sudo swapon /swap.img

# make new swap pernament
sudo nano /etc/fstab
# add these new content
/swap.img swap swap defaults 0 0

# remove a swap
# if add to /etc/fstab so delete it also
sudo swapoff -v /swap.img sudo rm /swap.img
