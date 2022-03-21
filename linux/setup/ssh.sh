# copy existing ssh keys to ssh directory
cd ~
mkdir .ssh
chmod 700 .ssh
cp KEYFILE .ssh/id_rsa
cp PUBKEYFILE .ssh/id_rsa.pub
chmod 600 .ssh/id_rsa
chmod 644 .ssh/id_rsa.pub

# cài ssh server
sudo apt install openssh-server

# inject ssh keys
# sau đó add public key của bạn vào server
cd ~
mkdir .ssh
chmod 700 .ssh
echo ssh-rsa PUBLICKEY > .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
