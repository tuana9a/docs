# quản lý người dùng
sudo add user USERNAME
sudo userdel USERNAME		

# quản lý các group
groups
sudo usermod -aG GROUPNAME USERNAME
sudo groupadd GROUPNAME	
sudo groupdel GROUPNAME

# xoá người dùng khỏi group
gpasswd -d USERNAME GROUPNAME

# đổi password của root user
sudo passwd