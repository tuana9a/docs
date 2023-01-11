# Refs

[NetworkChuck - 60 Linux Commands you NEED to know (in 10 minutes)](https://www.youtube.com/watch?v=gd7BXuUQ91w)

# CAUTIONS

Trong terminal dấu or ký tự "\*" trong câu lệnh Ubuntu cần thêm "\" trước nó tức "\*" nếu không muốn bị hiểu thành tất cả file trong cái thư mục đó

# apt

tự động xóa các apt không cần thiết

```bash
sudo apt-get autoremove
```

```bash
sudo apt autoremove
```

xem location của của một package

```bash
whereis pkg_name
```

# cat

show nội dung của FILEPATH

```bash
cat FILEPATH
```

VD: xem nội dung của file gemdino.txt

```bash
cat gemdino.txt
```

# cd

chuyển thư mục trong thư mục hiện tại
  - nếu tên có khoảng trống phải có hai nháy đơn
  - hoặc giữa 2 từ cần thêm "\ " với mỗi một dấu cách tương ứng

VD: " 'tuan thich  gemdino' " hay "tuan\ thich\ \ gemdino"

```bash
cd dirname
```

đưa về thư mục home của người dùng hiện tại# ~ /home/tuana9a

```bash
cd
```

trở về thư mục cha thư mục hiện tại

```bash
cd ..
```

return to previous directory NOT parent directory

```bash
cd -
```

# pushd

push current directory to stack

```bash
pushd dir_name
```

# popd

pop directory from stack

```bash
popd
```

# chmod

change permissions of a file

```bash
chmod
```

make file executable

```bash
chmod +x filename
```

# copy

copy file từ chỗ này qua chỗ khác

```bash
cp OLDPATH NEWPATH
```

```bash
cp gemdino.txt /home/tuana9a/test
```

# df

phân tích bộ nhớ của các partitions (phân vùng) đơn vị KB

```bash
df
```

đơn vị MB

```bash
df -m
```

# du

xem thong tin kich thuoc file

```bash
du -h
```

VD: xem kích thước của thư mục người dùng

```bash
du -sh ~
```

# ln

**how to create a shortcut or symbol link sym link in linux**

example

```bash
ln -s /etc/letsencrypt/live/tuana9a.com/fullchain.pem /opt/ssl/cert.pem
```

```bash
ln -s /etc/letsencrypt/live/tuana9a.com/privkey.pem /opt/ssl/key.pem
```

# locate

sẽ locate đường dẫn file mà bạn muốn tìm ko kể viết hoa hay viết thường

```bash
locate FILENAME
```

VD: sẽ tìm file mà tên chứa "gemdino"

```bash
locate -i gemdino
```

VD: tìm file chứa "gem" và "dino"

```bash
locate -i *gem*dino
```

# ls

show file ở thự mục hiện tại (ko hiện file ẩn)

```bash
ls
```

show cả file ẩn

```bash
ls -a
```

show dạng list

```bash
ls -l
```

# mkdir

tạo thư mục ở thư mục hiện tại

```bash
mkdir FOLDERNAME
```

# mv

di chuyển file từ chỗ này qua chỗ khác **có ghi đè** neu ton tai

```bash
mv OLDPATH NEWPATH
```

có thể dùng để đổi tên file luôn

```bash
mv OLDNAME NEWNAME
```

# netplan

sửa config network lúc startup

thêm file yaml trong netplan
có thể đặt tên bất kì

```bash
sudo vi /etc/netplan/install.yaml
```

```bash
sudo netplan apply
```

# nohup

không log pid

```bash
nohup COMMAND >> run.log 2>&1 &
```

pattern log cả pid

```bash
nohup COMMAND >> run.log 2>&1 & echo $! > run.pid
```

**python**

```bash
nohup python main.py >> run.log 2>&1 &
```

```bash
nohup python main.py >> run.log 2>&1 & echo $! > run.pid
```

**nodejs**

```bash
nohup node dist/main.js >> run.log 2>&1 &
```

```bash
nohup node dist/main.js >> run.log 2>&1 & echo $! > run.pid
```

**java**

```bash
nohup java -jar docs-1.0.0.jar >> run.log 2>&1 &
```

```bash
nohup java -jar docs-1.0.0.jar >> run.log 2>&1 & echo $! > run.pid
```

```bash
PORT=4000 ADDRESS=127.0.0.1 nohup java -jar docs-1.0.0.jar >> run.log 2>&1 & echo $! > run.pid
```

# passwd

đổi password cho user hiện tại

```bash
passwd
```

đổi pass cho root

```bash
sudo passwd
```

# pwd

print name of current working directory

```bash
pwd
```

# rm

xóa file

```bash
rm NAME
```

xóa thư mục giống "rmdir"

```bash
rm -r NAME
```

# rmdir

xóa thư mục bạn muốn, -r để xóa đệ quy (các thư mục con)

```bash
rmdir -r NAME
```

# su

Switch User
change user ID or become another user

```bash
su
```

chuyển sang user mớI

```bash
su USERNAME
```

# mặc định sẽ chọn root

```bash
su
```

# sudo

làm một lệnh gì đó với quyền root

```bash
sudo COMMAND
```

vào root mode

```bash
sudo bash
```

```bash
sudo su
```

# touch

tạo một file text trắng

```bash
touch FILE_NAME
```

VD: tạo file text gemdino.txt trắng

```bash
touch gemdino.txt
```

# users

print the user names of users currently logged in

```bash
users
```

# id

print real and effective user and group IDs

```bash
id
```

# sudo visudo

chỉnh sửa các thứ liên quan tới quền

```bash
sudo visudo
```

content

```conf
%sudo ALL=(ALL:ALL) ALL   # mặc định của ubuntu
%sudo ALL=(ALL:ALL) ALL   # không cần nhập password

# sau đó thêm dòng sau cho user tuana9a bố đời không cần nhập pass khi sudo
tuana9a ALL=(ALL) NOPASSWD:ALL
```

# adduser

quản lý người dùng

```bash
sudo adduser USERNAME
```

# useradd

```bash
useradd -m -s /bin/bash tuana9a
```

# userdel

```bash
sudo userdel USERNAME
```

# gpasswd

xoá người dùng khỏi group

```bash
gpasswd -d USERNAME GROUPNAME
```

# groupadd

tao group moi

```bash
sudo groupadd GROUPNAME
```

# groupdel

xoa group

```bash
sudo groupdel GROUPNAME
```

# usermod

them user vao group

```bash
sudo usermod -aG GROUPNAME USERNAME
```

# ifconfig

config interface card mạng cho nó chạy nè

```bash
ifconfig eth0 172.16.25.125 netmask 255.255.255.224 broadcast 172.16.25.63
```

VD:

```bash
sudo ifconfig enp0s8 \ #  card mạng enp0s8
192.168.200.3 \ #  địa chỉ cho card này 192.168.200.3
netmask 255.255.255.0 \ #  netmask là 255.255.255.0
up # up là bật card này lên
```

get current ip address

```bash
ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
```

```bash
ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
```

```bash
ifconfig wlan0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
```

# head

show head portion of the file

```bash
head text.txt
```

# tail

show tail portion of the file with 100 lines

```bash
tail /var/log/mongo/mongod.log -n 100
```

watch the change with -f flag this will update the terminal in realtime

```bash
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

delay

```bash
sudo tc qdisc add dev ens38 root netem delay 100ms
```

```bash
sudo tc qdisc change dev ens38 root netem delay 100ms
```

```bash
sudo tc qdisc change dev ens38 root netem delay 100ms 10ms
```

```bash
sudo tc qdisc change dev ens38 root netem delay 100ms 10ms 25%
```

## packet loss

```bash
sudo tc qdisc change dev ens38 root netem loss 0.1%
```

```bash
sudo tc qdisc change dev ens38 root netem loss 0.3% 25%
```

```bash
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

khi xong rồi để hủy các giả lập trước đó chỉ cần remove chúng khỏi emulator

```bash
sudo tc qdisc del dev ens38 root
```

# cronjob

mở editor để edit file này :V

```bash
crontab -e
```

sau đó sửa theo format sau ref: <https://crontab.guru/>

```conf
# m h dom mon dow command
*/15 * * * * /bin/bash /home/tuana9a/somebashscript.sh
```

save file lại và restart cronjob

```bash
systemctl restart cron
```

or in other linux

```bash
systemctl restart crond
```

# set timezone

```bash
sudo timedatectl set-timezone Asia/Ho_Chi_Minh
```

# journalctl

xem thông tin một service

```bash
journalctl -u service-name.service
```

# apt

tự động xóa các apt không cần thiết

```bash
sudo apt-get autoremove
```

```bash
sudo apt autoremovebbv
```

xem location của của một package

```bash
whereis pkg_name
```

# tar

zip toàn bộ thư mục, files từ thư mục .

```bash
tar czf resource.tar.gz *
```

unzip toàn bộ file vào thư mục hiện tại

```bash
tar -xvf archive.tar.gz
```

# grep

[https://linuxhandbook.com/grep-command-examples/](https://linuxhandbook.com/grep-command-examples/)

# dpkg

locate installed package

```bash
dpkg -L package-name
```

install .deb package

```bash
dpkg -i docker-ce-cli_20.10.14~3-0~ubuntu-bionic_amd64.deb
```
