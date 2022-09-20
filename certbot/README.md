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
certbot revoke --cert-name tuana9a.tech
```
