# config interface card mạng cho nó chạy nè
ifconfig eth0 172.16.25.125 netmask 255.255.255.224 broadcast 172.16.25.63

# VD:
sudo ifconfig enp0s8 192.168.200.3 netmask 255.255.255.0 up
#			card mạng enp0s8
#			địa chỉ cho card này 192.168.200.3
#			netmask là 255.255.255.0
#			up là bật card này lên