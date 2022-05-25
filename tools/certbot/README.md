# cerbot

## install cert

vị trí của cert `/etc/letsencrypt/live/tuana9a.tech/`

```bash
# install certificate
sudo certbot certonly -d tuana9a.tech
sudo certbot certonly -d docs.tuana9a.tech
sudo certbot certonly -d assistant.tuana9a.tech
sudo certbot certonly -d captcha2text.tuana9a.tech
sudo certbot certonly -d calendar.tuana9a.tech
```

wildcard

`.cloudflare.ini`

```ini
# Cloudflare API credentials used by Certbot
dns_cloudflare_email = example@example.com
# using global token key is oke if you don't need serious security
dns_cloudflare_api_key = GLOBAL_TOKEN_API_KEY
```

```bash
# using wildcards with cloudflare
sudo certbot certonly \
--dns-cloudflare \
--dns-cloudflare-credentials ~/.cloudflare.ini \
-d tuana9a.tech,*.tuana9a.tech
```

## remove cert

```bash
# remove exist domain
# this will open an interactive console
sudo certbot delete
```