# nginx

root conf location `/etc/nginx/nginx.conf`

```conf
http {
    # must have this line
    include /etc/nginx/conf.d/*.conf;
}
```

conf location `/etc/nginx/conf.d/default.conf`

the name `default.conf` can be any `.conf`

## reverse proxy

```conf
server {
    listen          80;
    server_name     captcha2text.tuana9a.com;
    location / {
        proxy_pass  http://172.77.0.60:8080;
        # optional
        proxy_set_header Host $host;
    }
}
```

## reverse proxy with ssl

```conf
server {
    listen          443 ssl;
    server_name     tuana9a.com;
    ssl_certificate        /etc/letsencrypt/live/tuana9a.com/fullchain.pem;
    ssl_certificate_key    /etc/letsencrypt/live/tuana9a.com/privkey.pem;
    location / {
        proxy_pass  http://172.77.0.29:8080;
        # optional
        proxy_set_header Host $host;
    }
}
```
