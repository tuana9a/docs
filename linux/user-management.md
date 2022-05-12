# id

```bash
# print real and effective user and group IDs
id
```

# passwd

```bash
# đổi password cho user hiện tại
passwd

# đổi pass cho root
sudo passwd
```

# su

```bash
# Switch User
# change user ID or become another user
su

# chuyển sang user mớI
su USERNAME

# mặc định sẽ chọn root
su
```

# sudo

```bash
# làm một lệnh gì đó với quyền root
sudo COMMAND

# vào root mode
sudo bash
```
# sudo visudo

```bash
# chỉnh sửa các thứ liên quan tới quền
sudo visudo

# cấu hình
%sudo ALL=(ALL:ALL) ALL   # mặc định của ubuntu 
%sudo ALL=(ALL:ALL) ALL   # không cần nhập password

# sau đó thêm dòng sau cho user tuana9a bố đời không cần nhập pass khi sudo
tuana9a ALL=(ALL) NOPASSWD:ALL
```

# add user

```bash
# quản lý người dùng
sudo adduser USERNAME
sudo userdel USERNAME
```

# gpasswd

```bash
# xoá người dùng khỏi group
gpasswd -d USERNAME GROUPNAME
```

# groupadd

```bash
# tao group moi
sudo groupadd GROUPNAME
```

# groupdel

```bash
# xoa group
sudo groupdel GROUPNAME
```

# usermod

```bash
# them user vao group
sudo usermod -aG GROUPNAME USERNAME
```
