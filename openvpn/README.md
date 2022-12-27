# openvpn client + systemd

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

# vpn only

Refs: [https://askubuntu.com/questions/788803/how-to-change-the-metric-of-an-openvpn-client-default-route](https://askubuntu.com/questions/788803/how-to-change-the-metric-of-an-openvpn-client-default-route)

add `route-nopull` to the end of `.ovpn` config file

like this

```ini
...
route-nopull
```