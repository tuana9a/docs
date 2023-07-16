# nginx

root conf location `/etc/nginx/nginx.conf`

```conf
http {
  include /etc/nginx/conf.d/*.conf;
}
stream {
  include /etc/nginx/stream.conf.d/*.conf;
}
```

custom conf location `/etc/nginx/conf.d/*.conf`

## static files

bonus: with single page application (SPA)

```conf
server {
  listen 80;
  server_name hi.tuana9a.com;
  location / {
    root /var/www/hi/;
    try_files $uri /index.html;
  }
}
```

## http reverse proxy

with `server_name`

```conf
server {
  listen 80;
  server_name hcr.tuana9a.com;
  location / {
    proxy_pass http://172.77.0.60:8080;
    proxy_set_header Host $host; # optional
  }
}
```

without `server_name`

```conf
server {
  listen 8080;
  location / {
    proxy_pass http://172.77.0.60:8080;
    proxy_set_header Host $host; # optional
  }
}
```

## http reverse proxy with ssl

```conf
server {
  listen 443 ssl;
  server_name tuana9a.com;
  ssl_certificate /etc/letsencrypt/live/tuana9a.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/tuana9a.com/privkey.pem;
  location / {
    proxy_pass http://172.77.0.29:8080;
    proxy_set_header Host $host; # optional
  }
}
```

## stream - tcp reverse proxy

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

test with `curl http://localhost:8080/stub_status`
