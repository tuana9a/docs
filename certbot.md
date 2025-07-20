# certbot

## Install

```bash
sudo apt install snapd -y
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo snap set certbot trust-plugin-with-root=ok
```

## Create certs

one cert one domain (recommended)

```bash
sudo certbot certonly -d dkhptd.tuana9a.com
```

if you installed nginx then use nginx plugin

```bash
sudo certbot certonly --nginx -d dkhptd.tuana9a.com
```

one cert multiple domains

```bash
sudo certbot certonly -d tuana9a.com -d calendar.tuana9a.com
```

Certs location: `/etc/letsencrypt/live/`

wildcard domain cert

this require dns provider plugin, for example with `cloudflare`

```bash
sudo snap install certbot-dns-cloudflare
```

file `/opt/certbot/cloudflare.ini`

using api token

```ini
dns_cloudflare_api_token = yourapitoken
```

then

```bash
sudo certbot certonly --dns-cloudflare --dns-cloudflare-credentials /opt/certbot/cloudflare.ini -d tuana9a.com -d *.tuana9a.com
```

Certs location: `/etc/letsencrypt/live/`

## Display certs

```bash
sudo certbot certificates
```

## Revoke and delete certs

```bash
sudo certbot revoke --cert-name tuana9a.com
```

## Delete certs

```bash
sudo certbot delete
```

## Automatic Renewal Hooks

place your scripts in these folder

```bash
/etc/letsencrypt/renewal-hooks/{pre,post}
```

examples

`/etc/letsencrypt/renewal-hooks/post/reload_nginx.sh`

```bash
#!/bin/bash

nginx -s reload
```

ubuntu `>=` 18.04

```bash
#!/bin/bash

systemctl reload nginx
```

(optional) if using dns-plugin

```bash
vim /etc/letsencrypt/renewal/dkhptd.tuana9a.com.conf
```

```conf
# renew_before_expiry = 30 days
version = 2.10.0
archive_dir = /etc/letsencrypt/archive/tuana9a.com
cert = /etc/letsencrypt/live/tuana9a.com/cert.pem
privkey = /etc/letsencrypt/live/tuana9a.com/privkey.pem
chain = /etc/letsencrypt/live/tuana9a.com/chain.pem
fullchain = /etc/letsencrypt/live/tuana9a.com/fullchain.pem

# Options used in the renewal process
[renewalparams]
account =
authenticator = dns-cloudflare
dns_cloudflare_credentials = /opt/certbot/cloudflare.ini # path to the dns config
server = https://acme-v02.api.letsencrypt.org/directory
key_type = rsa
```

Test Renewal

```bash
sudo certbot renew --dry-run
```

```bash
journalctl -xeu nginx # example with reload-nginx.sh
```
