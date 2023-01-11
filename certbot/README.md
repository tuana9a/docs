# certbot

_add **sudo** if needed_

## Create certs

```bash
certbot certonly -d tuana9a.com -d calendar.tuana9a.com
```

wildcard

```bash
certbot certonly --dns-cloudflare --dns-cloudflare-credentials cloudflare.ini -d tuana9a.com -d *.tuana9a.com
```

## Display certs

```bash
certbot certificates
```

## Revoke and delete certs

```bash
certbot revoke --cert-name tuana9a.com
```

## Install individual certs

```bash
sudo certbot certonly -d tuana9a.com
```

vị trí của cert `/etc/letsencrypt/live/`

```bash
sudo certbot certonly -d docs.tuana9a.com
```

```bash
sudo certbot certonly -d calendar.tuana9a.com
```

```bash
sudo certbot certonly -d captcha2text.tuana9a.com
```

```bash
sudo certbot certonly -d assistant.tuana9a.com
```

## Install with wildcard

file `cloudflare.ini`

global api

using global token key is oke if you don't need serious security

```ini
dns_cloudflare_email = example@example.com
dns_cloudflare_api_key = GLOBAL_TOKEN_API_KEY
```

or api token (api token don't need email)

```ini
dns_cloudflare_api_token = yourapitoken
```

## Using wildcards with cloudflare

```bash
sudo certbot certonly --dns-cloudflare --dns-cloudflare-credentials cloudflare.ini -d tuana9a.com,*.tuana9a.com
```

## Remove cert

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
