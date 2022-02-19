# some example obtain
sudo certbot certonly -d tuana9a.tech
sudo certbot certonly -d docs.tuana9a.tech
sudo certbot certonly -d assistant.tuana9a.tech
sudo certbot certonly -d captcha2text.tuana9a.tech
sudo certbot certonly -d calendar.tuana9a.tech

# using wildcards with cloudflare
sudo certbot certonly \
--dns-cloudflare \
--dns-cloudflare-credentials ~/.cloudflare.ini \
-d tuana9a.tech,*.tuana9a.tech

# vị trí của cert
# VD: /etc/letsencrypt/live/tuana9a.tech/

# remove exist domain
sudo certbot delete
