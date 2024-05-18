# certbot

## Install

```bash
sudo apt install snapd -y
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo snap set certbot trust-plugin-with-root=ok
```

## Create certs

```bash
# one cert multiple domains
sudo certbot certonly -d tuana9a.com -d calendar.tuana9a.com
# one cert one domain
sudo certbot certonly -d dkhptd.tuana9a.com
```

## Create wildcard certs

required dns provider plugin

```bash
sudo snap install certbot-dns-cloudflare
```

file `/opt/certbot/cloudflare.ini`

using global api key

```ini
dns_cloudflare_email = example@example.com
dns_cloudflare_api_key = yourglobalapikey
```

using api token

```ini
dns_cloudflare_api_token = yourapitoken
```

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

```text
/etc/letsencrypt/renewal-hooks/{pre,post}
```

```text
/etc/letsencrypt/renewal/
```

Test Renewal

```bash
sudo certbot renew --dry-run
```
