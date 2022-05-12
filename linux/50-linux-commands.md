# CAUTIONS

Trong terminal dấu or ký tự "*" trong câu lệnh Ubuntu cần thêm "\" trước nó tức "\*" nếu không muốn bị hiểu thành tất cả file trong cái thư mục đó

# apt

```bash
# tự động xóa các apt không cần thiết
sudo apt-get autoremove
sudo apt autoremove

# xem địa của của một package
whereis pkg_name
```

# cat

```bash
# show nội dung của FILEPATH
cat FILEPATH

# VD: xem nội dung của file gemdino.txt
cat gemdino.txt
```

# cd

```bash
# chuyển thư mục trong thư mục hiện tại
#   - nếu tên có khoảng trống phải có hai nháy đơn 
#   - hoặc giữa 2 từ cần thêm "\ " với mỗi một dấu cách tương ứng
#   VD: " 'tuan thich  gemdino' " hay "tuan\ thich\ \ gemdino"
cd name	

# đưa về thư mục home của người dùng hiện tại
cd  # ~ cd /home/tuana9a

# trở về thư mục cha thư mục hiện tại
cd ..
```

# chmod

![](./img/chmod.png)

```bash
# change permissions of a file
chmod

# lam cho file co the execute duoc
chmod +x filename
```

# copy

```bash
# copy file từ chỗ này qua chỗ khác
cp OLDPATH NEWPATH

# VD:
cp gemdino.txt /home/tuana9a/test
```

# df

```bash
# phân tích bộ nhớ của các partitions (phân vùng) đơn vị KB
df

# đơn vị MB
df -m
```

# du

```bash
# xem thong tin kich thuoc file
du -h

# VD: xem kích thước của thư mục người dùng
du -sh ~ 
```

# ln

```bash
# how to create a shortcut or symbol link sym link in linux

# example
ln -s /etc/letsencrypt/live/tuana9a.tech/fullchain.pem /home/ubuntu/ssl/cert.pem
ln -s /etc/letsencrypt/live/tuana9a.tech/privkey.pem /home/ubuntu/ssl/key.pem

# how to create a shortcut
ln -s /etc/letsencrypt/live/tuana9a.tech/fullchain.pem /home/ubuntu/ssl/cert.pem
```

# locate

```bash
# sẽ locate đường dẫn file mà bạn muốn tìm ko kể viết hoa hay viết thường
# giống như search trên window
locate FILENAME
    
# VD: sẽ tìm file mà tên chứa "gemdino"
locate -i gemdino

# VD: tìm file chứa "gem" và "dino"
locate -i *gem*dino
```

# ls

```bash
# show file ở thự mục hiện tại (ko hiện file ẩn)
ls	

# show cả file ẩn
ls -a	

# show dạng list
ls -l
```

# mkdir

```bash
# tạo thư mục ở thư mục hiện tại
mkdir FOLDERNAME
```

# mv

```bash
# di chuyển file từ chỗ này qua chỗ khác
# có ghi đè
mv OLDPATH NEWPATH

# có thể dùng để đổi tên file luôn
mv OLDNAME NEWNAME
```

# netplan

```bash
# sửa config network lúc startup
        
# thêm file yaml trong netplan
# có thể đặt tên bất kì 
sudo vi /etc/netplan/install.yaml 

# sau đó apply các config như trên        
sudo netplan apply
```

# nohup

```bash
# pattern không log pid
nohup COMMAND >> run.log 2>&1 &

# pattern log cả pid
nohup COMMAND >> run.log 2>&1 & echo $! > run.pid

# example with python
nohup python main.py >> run.log 2>&1 &
nohup python main.py >> run.log 2>&1 & echo $! > run.pid

# example nodejs
nohup node dist/main.js >> run.log 2>&1 &
nohup node dist/main.js >> run.log 2>&1 & echo $! > run.pid

# example with java
nohup java -jar docs-1.0.0.jar >> run.log 2>&1 &
nohup java -jar docs-1.0.0.jar >> run.log 2>&1 & echo $! > run.pid
PORT=4000 ADDRESS=127.0.0.1 nohup java -jar docs-1.0.0.jar >> run.log 2>&1 & echo $! > run.pid
```

# passwd

```bash
# đổi password cho user hiện tại
passwd

# đổi pass cho root
sudo passwd
```

# pwd

```bash
# print name of current/working directory
pwd
# VD: you are in /home/ubuntu
pwd
# output will be /home/tuana9a/
```

# rm

```bash
# xóa file
rm NAME

# xóa thư mục giống "rmdir"
rm -r NAME
```

# rmdir

```bash
# xóa thư mục bạn muốn, -r để xóa đệ quy (các thư mục con)
rmdir -r NAME
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

# touch

```bash
# tạo một file text trắng
touch FILE_NAME

# VD:
# tạo file text gemdino.txt trắng
touch gemdino.txt
```

# users

```bash
# print the user names of users currently logged in
users
```

# NAVIGATION

```bash
# put working directory on a stack
pushd
popd

# determine file type
file

# update database for locate
updatedb

# locate a command
which

# display bash command history
history
```

# GETTING HELP 

```bash
# display the on-line manual descriptions
whatis

# search the manual page names and descriptions
apropos

# an interface to the on-line reference manuals
man
```

# TEXT FILES 

```bash
# concatenate files and print on the standard output
cat file1 file2 file3 ...

# file perusal filter for crt viewing
more
less

# command line text editor
nano
```

# KILLING PROGRAMS AND LOGGING OUT

```bash
# kill a running command
Ctrl + C

# kill processes by name
killall

# log out of bash
exit
```
