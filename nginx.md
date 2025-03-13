# nginx

root conf location

`/etc/nginx/nginx.conf`

```conf
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;
events {
  worker_connections 2048;
}
http {
  sendfile on;
  tcp_nopush on;
  tcp_nodelay on;
  keepalive_timeout 65;
  types_hash_max_size 2048;
  server_names_hash_bucket_size 128;
  include /etc/nginx/mime.types;
  default_type application/octet-stream;
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  ssl_prefer_server_ciphers on;
  access_log /var/log/nginx/access.log;
  error_log /var/log/nginx/error.log;
  gzip on;
  include /etc/nginx/conf.d/*.conf;
  include /etc/nginx/sites-enabled/*;
}
# @tuana9a custom
stream {
  include /etc/nginx/stream.conf.d/*.conf;
}
```

custom http conf location:

`/etc/nginx/conf.d/` with file pattern `*.conf`

`/etc/nginx/sites-available/`

## serve static files

```conf
server {
  listen 80;
  server_name hi.tuana9a.com;
  root /var/www/hi/;
}
```

```conf
server {
  listen 80;
  server_name hi.tuana9a.com;
  root /var/www/hi/;
  location /hello {
    # http://hi.tuana9a.com/hello will serve from /var/www/hello instead of /var/www/hi/hello
    alias /var/www/hello;
  }
}
```

what about single page application (SPA)

```conf
server {
  listen 80;
  server_name hi.tuana9a.com;
  root /var/www/hi/;
  location / {
    # try the url of the request first, if it's not exist return root page
    try_files $uri /index.html =404;
  }
}
```

## http reverse proxy

nginx can act as middle man to forward client request to specific backend.

with `server_name` (domain name, url) nginx can decide which backend that request will be sent to.

```conf
server {
  listen 80;
  server_name hi.tuana9a.com;
  location / {
    proxy_pass http://192.168.30.133:8080;
  }
}
```

without `server_name` nginx just forward every requests on port 8080 to target backend whatever the domain is.

```conf
server {
  listen 8080;
  location / {
    proxy_pass http://192.168.30.133:8080;
  }
}
```

full configuration

```conf
# list of available backends
upstream backend {
  keepalive 32; # keepalive connections
  server 10.103.107.6:8080;
  server 10.103.107.7:8080;
  server 10.103.107.8:8080;
}
# websocket
map $http_upgrade $connection_upgrade {
  default upgrade;
  '' close;
}
server {
  listen 80;
  server_name hi.tuana9a.com;
  location / {
    proxy_pass http://backend;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
  }
  # websocket
  location /ws {
    proxy_pass http://backend;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection $connection_upgrade;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
  }
}
```

## https reverse proxy

http with ssl certificate

just like with http but with ssl.

```conf
server {
  listen 443 ssl;
  server_name hello.tuana9a.com;
  ssl_certificate /etc/letsencrypt/live/tuana9a.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/tuana9a.com/privkey.pem;
  location / {
    proxy_pass http://10.103.107.6:8080;
  }
}
```

## tcp reverse proxy

or stream reverse proxy, nginx just proxy tcp packets to `ip:port` you described.

should live under `stream` directive

`/etc/nginx/stream.conf.d/test.conf`

```conf
server {
  listen 443;
  proxy_pass 10.24.30.11:443;
}
```

## stub_status

expose server metrics for [nginx-prometheus-exporter](https://github.com/nginxinc/nginx-prometheus-exporter)

```conf
server {
  listen 8080;
  location /stub_status {
    stub_status;
  }
}
```

test

```bash
curl http://localhost:8080/stub_status
```

## regex path matching

```conf
server {
  listen 8080;
  location ~* /count/[0-9] {
    root /var/www/hi;
    try_files /index.html =404;
  }
}
```

## redirect

```conf
server {
  listen 8080;
  location /whoknow {
    return 307 /know;
  }
}
```

bonus: redirect http to https

```conf
server {
  listen 443 ssl;
  server_name parkngo.vn;
  ssl_certificate /etc/letsencrypt/live/parkngo.vn/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/parkngo.vn/privkey.pem;
  location / {
    root /home/techpro/parkingx-landing-page/;
    try_files $uri /index.html;
  }
}
server {
  listen 80;
  server_name parkngo.vn;
  return 301 https://$host$request_uri;
}
```

## rewrite

```conf
rewrite ^/number/(\w+) /count/$1

server {
  listen 8080;
  location ~* /count/[0-9] {
    root /var/www/hi;
    try_files /index.html =404;
  }
}
```

## Refs

[Laith Academy](https://www.youtube.com/@laithacademy) - [The NGINX Crash Course](https://youtu.be/7VAI73roXaY)
