# OpenVPN

## openvpn + systemd

```bash
sudo apt install openvpn
```

get your conf file `your-config.ovpn`

write below content to `/lib/systemd/system/openvpn.service`

```conf
# This service is actually a systemd target,
# but we are using a service since targets cannot be reloaded.

[Unit]
Description=OpenVPN service
After=network.target

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/sbin/openvpn --daemon --cd /etc/openvpn/ --config your-config.ovpn
WorkingDirectory=/etc/openvpn/

[Install]
WantedBy=multi-user.target
```

## vpn only

Refs: [https://askubuntu.com/questions/788803/how-to-change-the-metric-of-an-openvpn-client-default-route](https://askubuntu.com/questions/788803/how-to-change-the-metric-of-an-openvpn-client-default-route)

add `route-nopull` to the end of `.ovpn` config file

like this

```ini
...
route-nopull
```

## how to change private ip for vpn

ip example 10.0.0.0/24

edit server config

`/etc/openvpn/server.conf`

edit this line

```conf
server 10.0.0.0 255.255.255.0
```

edit client config (if has)

`/etc/openvpn/ccd/ra`

```conf
ifconfig-push 10.0.0.2 255.255.255.0
```

edit iptables (create new then save to edit saved files)

ubuntu

`/etc/iptables/rules.v4`

edit these line to match ip

```conf
-A FORWARD -d 10.0.0.0/24 -i eth0 -o tun0 -m conntrack --ctstate RELATED,ESTABLISHED -m comment --comment openvpn-forward-rule -j ACCEPT
```

```conf
-A FORWARD -s 10.0.0.0/24 -i tun0 -o eth0 -m comment --comment openvpn-forward-rule -j ACCEPT
```

```conf
-A POSTROUTING -s 10.0.0.0/24 -o eth0 -m comment --comment openvpn-nat-rule -j MASQUERADE
```

restart server

```bash
systemctl restart openvpn@server.service
```

## iptables tips

```bash
iptables -t nat -C POSTROUTING -s '10.0.0.0/24' -o 'eth0' -j MASQUERADE 2> '/dev/null'
```

```bash
iptables -t nat -A POSTROUTING -s '10.0.0.0/24' -o 'eth0' -j MASQUERADE
```
