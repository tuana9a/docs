# 2021-07-17 issue python venv in linux

**venv trong linux bị ảo khi chạy .sh file**

mặc dù đang trong `(venv)` nhưng

```bash
bash install.sh
```

`install.sh` chứa một loạt pip install nhưng pip vẫn install ở ngoài `(venv)`

```bash
pip install -r requirements.txt
```

để chạy được như ý muốn thì cần đặt luôn source venv ở trong `install.sh`

```bash
source .venv/bin/activate
```

```bash
pip install -r requirements.txt
```

the reason is: bash `<something>` will create new process (shell, ...) that not live in current `(.venv)` so current venv will be ignore

# 2021-07-27 java error because of old version

tải openjdk-1.8.0_41 và bị lỗi ssl exception

có vẻ runtime của nó quá cùi và không đáp ứng điều kiện của hiện tại

chính xác hơn là ssl bị lỗi thời (liên quan tới bảo mật)

mất mịa 30p để tìm lỗi logic trong code

tải lại openjdk-1.8.0_292 và vấn đề được giải quyết

# 2021-07-29 stupid windows cmd

**cmd của window như đầu bòi**

cái đệt mợ windows, tưởng lỏng lẻo giờ lại chặt chẽ dẫu cách trong cmd
khi dùng set thì phải là

```powershell
set name=value # viết liền còn
```

```powershell
set name = value # là toang
```

# 2022-02-17 mongodb cyclic dependency detected

một bản ghi của mình có thuộc tính con lại chứa chính nó

khi insert vào mongodb bị bson loop, không thể serialize nên toang

# 2022-03-20 .env file

env thì đừng có cho dấu nháy đơn hay nháy kép vào nó có thể break logic

cái này thì chạy ngon

```bash
PORT=80 ADDRESS=0.0.0.0 ROOT_DIR='./cloud' java -jar docs-1.0.0.jar
```

với file `.env`

```bash
PORT=80
ADDRESS=0.0.0.0
ROOT_DIR="./cloud" # cái này khi vào chương trình nó đọc thành ""./cloud""
```

nói chung là env thì cứ chơi "trần" đừng cho chỗi string vào có khi toang

# 2022-04-23 rabbitmq + nodejs = wtf

driver amqp của nodejs có lỗi ảo vl

# 2022-06-23

Refs: [https://forum.endeavouros.com/t/how-to-setup-an-appimage-as-a-startup-application/9077](https://forum.endeavouros.com/t/how-to-setup-an-appimage-as-a-startup-application/9077)

check it in this `~/.config/autostart` folder

# 2022-08-01 kubernetes problems with CNI (container network interface)

[How to setup kubernetes cluster with 3 nodes](https://github.com/tuana9a/infrastructure-as-code/tree/main/local/kubernetes)

Solution see [https://github.com/tuana9a/infrastructure-as-code/blob/main/local/kubernetes/ansible/files/kube-flannel.yaml](https://github.com/tuana9a/infrastructure-as-code/blob/main/local/kubernetes/ansible/files/kube-flannel.yaml)

Refs: [https://stackoverflow.com/questions/47845739/configuring-flannel-to-use-a-non-default-interface-in-kubernetes](https://stackoverflow.com/questions/47845739/configuring-flannel-to-use-a-non-default-interface-in-kubernetes)

# 2022-08-12 SEVER_ADDRESS env variable

`SERVER_ADDRESS` env variable override `server.address` of `application.properties`

I'm trying to change `server.address` value in `application.properties` but when server run

It's always bind to that `SERVER_ADDRESS` = `192.168.30.143`

so when you go to http://localhost:8080 or http://0.0.0.0:8080 then **This site can’t be reached**

# 2022-09-22 ubuntu server connect to openvpn server then can't connect to internet

Refs: [https://askubuntu.com/questions/788803/how-to-change-the-metric-of-an-openvpn-client-default-route](https://askubuntu.com/questions/788803/how-to-change-the-metric-of-an-openvpn-client-default-route)

add `route-nopull` to the end of `.ovpn` config file

# Fn key rows not work in ubuntu (linux in general)

Thanks

[https://github.com/Kurgol/keychron/blob/master/k2.md#f-keys-on-ubuntu](https://github.com/Kurgol/keychron/blob/master/k2.md#f-keys-on-ubuntu)
[https://www.reddit.com/r/Keychron/comments/lgotvh/keychron_k3_ubuntu_fn_keys/](https://www.reddit.com/r/Keychron/comments/lgotvh/keychron_k3_ubuntu_fn_keys/)

```bash
vim /etc/modprobe.d/hid_apple.conf
```

add

```conf
options hid_apple fnmode=2
```

```bash
sudo update-initramfs -u
```

```bash
reboot
```
