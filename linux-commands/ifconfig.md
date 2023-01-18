# ifconfig

config interface card mạng cho nó chạy nè

```bash
ifconfig eth0 172.16.25.125 netmask 255.255.255.224 broadcast 172.16.25.63
```

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
