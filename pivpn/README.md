# pivpn

[https://pivpn.io/](https://pivpn.io/)

```bash
curl -L https://install.pivpn.io | bash
```

or Non-interactive installation

```bash
curl -L https://install.pivpn.io > install.sh
chmod +x install.sh
./install.sh --unattended options.conf
```

example file [https://github.com/pivpn/pivpn/blob/master/examples/unattended_openvpn_example.conf](https://github.com/pivpn/pivpn/blob/master/examples/unattended_openvpn_example.conf)

## how to edit pivpn config

`/etc/pivpn/openvpn/setupVars.conf`

## how to change setup from static ip to dns

[https://github.com/pivpn/pivpn/issues/193#issuecomment-275700304](https://github.com/pivpn/pivpn/issues/193#issuecomment-275700304)

edit

`/etc/pivpn/openvpn/setupVars.conf`

and

`/etc/openvpn/easy-rsa/pki/Default.txt`
