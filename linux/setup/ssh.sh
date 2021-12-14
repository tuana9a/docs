# cài ssh server
sudo apt install openssh-server

# inject ssh keys
# sau đó add public key của bạn vào server
cd ~
mkdir .ssh
chmod 700 .ssh
echo ssh-rsa PUBLICKEY > .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
