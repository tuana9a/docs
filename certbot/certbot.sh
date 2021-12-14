# generate new cert
sudo certbot certonly \
--dns-cloudflare \
--dns-cloudflare-credentials ~/.cloudflare.ini \
-d tuana9a.tech,*.tuana9a.tech

# remove exist domain
sudo certbot delete
