# nginx

`/etc/nginx/conf.d/default.conf`

```conf
server {
    listen          443 ssl;
    server_name     tuana9a.tech;
    ssl_certificate        /etc/letsencrypt/live/tuana9a.tech/fullchain.pem;
    ssl_certificate_key    /etc/letsencrypt/live/tuana9a.tech/privkey.pem;
    location / {
        proxy_pass  http://172.77.0.29:8080;
    }
}

server {
    listen          443 ssl;
    server_name     captcha2text.tuana9a.tech;
    ssl_certificate        /etc/letsencrypt/live/captcha2text.tuana9a.tech/fullchain.pem;
    ssl_certificate_key    /etc/letsencrypt/live/captcha2text.tuana9a.tech/privkey.pem;
    location / {
        proxy_pass  http://172.77.0.45:8080;
    }
}

server {
    listen          443 ssl;
    server_name     bot.tuana9a.tech;
    ssl_certificate        /etc/letsencrypt/live/bot.tuana9a.tech/fullchain.pem;
    ssl_certificate_key    /etc/letsencrypt/live/bot.tuana9a.tech/privkey.pem;
    location / {
        proxy_pass  http://172.77.0.16:8080;
    }
}
```