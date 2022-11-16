_add **sudo** if needed_

# Create certs

```bash
certbot certonly -d tuana9a.com -d calendar.tuana9a.com
```

wildcard

```bash
certbot certonly --dns-cloudflare --dns-cloudflare-credentials cloudflare.ini -d tuana9a.com -d *.tuana9a.com
```

# Display certs

```bash
certbot certificates
```

# Revoke and delete certs

```bash
certbot revoke --cert-name tuana9a.com
```

## Install certs

vị trí của cert `/etc/letsencrypt/live/tuana9a.com/`

```bash
# install certificate
sudo certbot certonly -d tuana9a.com
sudo certbot certonly -d docs.tuana9a.com
sudo certbot certonly -d assistant.tuana9a.com
sudo certbot certonly -d captcha2text.tuana9a.com
sudo certbot certonly -d calendar.tuana9a.com
```

wildcard

`.cloudflare.ini`

```ini
# Cloudflare API credentials used by Certbot
dns_cloudflare_email = example@example.com
# using global token key is oke if you don't need serious security
dns_cloudflare_api_key = GLOBAL_TOKEN_API_KEY
```

# Using wildcards with cloudflare

```bash
sudo certbot certonly \
--dns-cloudflare \
--dns-cloudflare-credentials ~/.cloudflare.ini \
-d tuana9a.com,*.tuana9a.com
```

## Remove cert

```bash
sudo certbot delete
```