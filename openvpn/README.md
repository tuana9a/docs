# OpenVPN

```bash
sudo apt install openvpn
```

## multiple openvpn client with systemd

Thanks [https://askubuntu.com/a/1086407](https://askubuntu.com/a/1086407)

lastest openvpn support multiple configs in same machine

and it can be load automatically to systemd

copy your .ovpn files to this directory `/etc/openvpn/client/` and replace `.ovpn` with `.conf`

start each client config with

```bash
systemctl start openvpn-client@client-name
```

example

```bash
sudo cp client-name.ovpn /etc/openvpn/client/client-name.conf
sudo systemctl start openvpn-client@client-name
sudo systemctl enable openvpn-client@client-name
```

## vpn only

Refs: [https://askubuntu.com/questions/788803/how-to-change-the-metric-of-an-openvpn-client-default-route](https://askubuntu.com/questions/788803/how-to-change-the-metric-of-an-openvpn-client-default-route)

add `route-nopull` to the end of `.ovpn` config file

## how to change private ip for vpn

ip example 10.8.0.0/24

edit server config

`/etc/openvpn/server.conf`

edit this line

```conf
server 10.8.0.0 255.255.255.0
```

edit client config (if has)

`/etc/openvpn/ccd/ra`

```conf
ifconfig-push 10.0.0.2 255.255.255.0
```

## custom openvpn + systemd

Setup openvpn-client with systemd service.

Create new file `/lib/systemd/system/openvpn.service`

```conf
# This service is actually a systemd target,
# but we are using a service since targets cannot be reloaded.

[Unit]
Description=OpenVPN service
After=network.target

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/sbin/openvpn --daemon --cd /etc/openvpn/ --config /path/to/config.ovpn
WorkingDirectory=/etc/openvpn/

[Install]
WantedBy=multi-user.target
```

```bash
sudo systemctl start openvpn
```

autostart on boot

```bash
sudo systemctl enable openvpn
```

## edit iptables

(create new then save to edit saved files)

ubuntu

`/etc/iptables/rules.v4`

edit these line to match ip

```conf
-A FORWARD -d 10.8.0.0/24 -i eth0 -o tun0 -m conntrack --ctstate RELATED,ESTABLISHED -m comment --comment openvpn-forward-rule -j ACCEPT
```

```conf
-A FORWARD -s 10.8.0.0/24 -i tun0 -o eth0 -m comment --comment openvpn-forward-rule -j ACCEPT
```

```conf
-A POSTROUTING -s 10.8.0.0/24 -o eth0 -m comment --comment openvpn-nat-rule -j MASQUERADE
```

restart server

```bash
systemctl restart openvpn@server.service
```

## iptables tips

```bash
iptables -t nat -C POSTROUTING -s '10.8.0.0/24' -o 'eth0' -j MASQUERADE 2> '/dev/null'
```

```bash
iptables -t nat -A POSTROUTING -s '10.8.0.0/24' -o 'eth0' -j MASQUERADE
```

## troubleshooting

OpenVPN GUI for Windows (opensource program) require `data-ciphers` when `using cipher`

```conf
cipher AES-256-CBC
data-ciphers AES-256-CBC # this line is required if `cipher` is used
```
