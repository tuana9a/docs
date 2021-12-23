# xem ip address của máy
ip a        
ip addr     

# show tên máy trong host hoặc network
hostname    
        
# show địa chỉ IP của máy trong network
hostname -I 

# config interface card mạng cho nó chạy nè
ifconfig eth0 172.16.25.125 netmask 255.255.255.224 broadcast 172.16.25.63

# VD:
sudo ifconfig enp0s8 192.168.200.3 netmask 255.255.255.0 up
#			card mạng enp0s8
#			địa chỉ cho card này 192.168.200.3
#			netmask là 255.255.255.0
#			up là bật card này lên