# CAUTIONS

Trong terminal dấu or ký tự "\*" trong câu lệnh Ubuntu cần thêm "\" trước nó tức "\*" nếu không muốn bị hiểu thành tất cả file trong cái thư mục đó

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

# return to previous directory NOT parent directory
cd -
```

# pushd

```bash
# push current directory to stack
pushd dir_name
```

# popd

```bash
# pop directory from stack
popd
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

**how to create a shortcut or symbol link sym link in linux**

```bash
# example
ln -s /etc/letsencrypt/live/tuana9a.tech/fullchain.pem /home/ubuntu/ssl/cert.pem
ln -s /etc/letsencrypt/live/tuana9a.tech/privkey.pem /home/ubuntu/ssl/key.pem
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
```

**python**

```bash
# example with python
nohup python main.py >> run.log 2>&1 &
nohup python main.py >> run.log 2>&1 & echo $! > run.pid
```

**nodejs**

```bash
# example nodejs
nohup node dist/main.js >> run.log 2>&1 &
nohup node dist/main.js >> run.log 2>&1 & echo $! > run.pid
```

**java**

```bash
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

# adduser

```bash
# quản lý người dùng
sudo adduser USERNAME
```

# userdel

```bash
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

# netplan

```bash
# sửa config network lúc startup

# thêm file yaml trong netplan
# có thể đặt tên bất kì
sudo vi /etc/netplan/install.yaml

# sau đó apply các config như trên
sudo netplan apply
```

# ifconfig

```bash
# config interface card mạng cho nó chạy nè
ifconfig eth0 172.16.25.125 netmask 255.255.255.224 broadcast 172.16.25.63

# VD:
sudo ifconfig enp0s8 \ #  card mạng enp0s8
192.168.200.3 \ #  địa chỉ cho card này 192.168.200.3
netmask 255.255.255.0 \ #  netmask là 255.255.255.0
up # up là bật card này lên
```

# head

```bash
# show head portion of the file
head text.txt
```

# tail

```bash
# show tail portion of the file with 100 lines
tail /var/log/mongo/mongod.log -n 100

# watch the change with -f flag
# this will update the terminal in realtime
tail -f /var/log/mongo/mongod.log
```

# less

```bash
less LICENSE
```

| type      | action            |
| --------- | ----------------- |
| g         | go to head file   |
| Shift + g | go to end of file |
| q         | quit              |
| / + word  | search            |
| n         | next              |
| Shift + n | previous          |

# net emulator

**chú ý**: lệnh đầu cần add dev (card mạng) các lệnh sau chỉ cần update lại đống này

## delay

```bash
sudo tc qdisc add dev ens38 root netem delay 100ms

sudo tc qdisc change dev ens38 root netem delay 100ms

sudo tc qdisc change dev ens38 root netem delay 100ms 10ms

sudo tc qdisc change dev ens38 root netem delay 100ms 10ms 25%
```

## packet loss

```bash
sudo tc qdisc change dev ens38 root netem loss 0.1%

sudo tc qdisc change dev ens38 root netem loss 0.3% 25%

sudo tc qdisc change dev ens38 root netem loss 20% 25%
```

## duplicate

```bash
sudo tc qdisc change dev ens38 root netem duplicate 40%
```

## corrupt

```bash
sudo tc qdisc change dev ens38 root netem corrupt 40%
```

## reorder

```bash
sudo tc qdisc change dev ens38 root netem reorder 5% gap 5 delay 10ms
```

## reset

```bash
# khi xong rồi để hủy các giả lập trước đó chỉ cần remove chúng khỏi emulator
sudo tc qdisc del dev ens38 root
```

# cronjob

```bash
# mở editor để edit file này :V
crontab -e

# sau đó sửa theo format sau ref: https://crontab.guru/
# m h dom mon dow command
# VD:
*/15 * * * * /bin/bash /home/tuana9a/somebashscript.sh

# save file lại và restart cronjob

# ubuntu
systemctl restart cron

# fedora
systemctl restart crond
```

# how to generate password

```bash
# $1 is param for length of password
date +%s | sha256sum | base64 | head -c $1 ; echo

# === or ===

# $1 is param for length of password
date +%s | sha256sum | base64 | head -c $1 ; echo
```

# set timezone

```bash
sudo timedatectl set-timezone Asia/Ho_Chi_Minh
```



# journalctl

```bash
# xem thông tin một service
journalctl -u service-name.service
```

# apt

```bash
# tự động xóa các apt không cần thiết
sudo apt-get autoremove
sudo apt autoremove

# xem địa của của một package
whereis pkg_name
```

# tar

```bash
# zip toàn bộ thư mục, files từ thư mục .
tar czf resource.tar.gz *

# unzip toàn bộ file vào thư mục hiện tại
tar -xvf archive.tar.gz
```

# grep

[https://linuxhandbook.com/grep-command-examples/](https://linuxhandbook.com/grep-command-examples/)

## 1. Find all occurrences of a string (basic usage)

```bash
# Ex: Search package.json for any nashorn word
grep nashorn package.json
```

## 2. Case insensitive search in a file set

```bash
# Ex: Search for any file in npm/test that ends with .js
# that has nashorn with case insensitive
grep -i nashorn npm/test/*.js

# so "Nashorn" still match
```

## 3. Find all the non-matching files

**note**: cái này **KHÔNG** recursive tìm trong folder con

```bash
# Ex: Search for all files that don't have the word "nashorn"
# in npm/test/
grep -iL nashorn npm/test/*
```

**note**: cái này **CÓ** recursive tìm trong folder con<br>
nhưng **KHÔNG** tìm được các hidden files VD: `.env`, `.git`<br>
do vậy xem [phần 4](#4-finding-patterns-into-hidden-files-and-recursively-into-sub-directories)

```bash
# Ex: Search for all files that don't have the word "nashorn"
# in npm/ and It sub directories
grep -iL nashorn npm/**/*

# will search in "npm/" and "npm/test/" and "npm/module"
```

## 4. Finding patterns into hidden files and recursively into sub-directories

```bash
# This is not efficient as it will spawn a new grep process for each file
find npm/test/ -type f -exec grep -iL nashorn \{} \;

# This may have issues with filenames containing space-like characters
grep -iL nashorn $(find npm/test/ -type f)

# -r for recursive include hidden ones
grep -irL nashorn npm/test/

#
grep -irL nashorn npm/
```

## 5. Filtering files by their name (using regular expressions)

```bash
# The first one is to use grep to find all files containing the pattern “nashorn”,
# then pipe the output of that first command to a second grep instance
# filtering out non-java source files:
grep -ir nashorn ./ | grep "^[^:]*\.java"
```

**note**: Unless you specify the -F option, grep assumes the search pattern is a regular expression.

- `^` the start of the line
- `[^:]*` followed by a sequence of any characters except a colon
- `\.` followed by a dot (the dot has a special meaning in regex,<br>
  so I had to protect it with a backslash to express I want a literal match)
- java and followed by the four letters “java.”

In practice, since grep will use a colon to separate the filename from the context,<br>
I keep only lines having `.java` in the filename section.<br>
Worth mention it would match also `.javascript` filenames.<br>
This is something I let try solving by yourself if you want.

## 6. Filtering files by their name using grep

```bash
grep -ir nashorn ./ --include='*.java'
```

# Navigation

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

# Getting Help

```bash
# display the on-line manual descriptions
whatis

# search the manual page names and descriptions
apropos

# an interface to the on-line reference manuals
man
```

# Text Files

```bash
# concatenate files and print on the standard output
cat file1 file2 file3 ...

# file perusal filter for crt viewing
more
less

# command line text editor
nano
```

# Kill Programs and Log out

```bash
# kill a running command
Ctrl + C

# kill processes by name
killall

# log out of bash
exit
```
