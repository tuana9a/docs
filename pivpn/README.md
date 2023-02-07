# pivpn

[https://pivpn.io/](https://pivpn.io/)

```bash
curl -L https://install.pivpn.io | bash
```

how to edit pivpn config

`/etc/pivpn/openvpn/setupVars.conf`

## how to change setup from static ip to dns

[https://github.com/pivpn/pivpn/issues/193#issuecomment-275700304](https://github.com/pivpn/pivpn/issues/193#issuecomment-275700304)

edit

`/etc/pivpn/openvpn/setupVars.conf`

and

`/etc/openvpn/easy-rsa/pki/Default.txt`
