# add ssl mongodb

cert key file khi cấu hình ssl tls của mongodb có cấu trúc là

- phần đầu là cert
- phần cuối là key

tất cả cert và key phải trong cùng một file chứ không tách riêng

```txt
-----BEGIN CERTIFICATE-----
(content)
-----END CERTIFICATE-----
-----BEGIN PRIVATE KEY-----
(content)
-----END PRIVATE KEY-----
```

sau khi có key như trên thì add file đó vào trong config

```yaml
net:
  port: 27017
  bindIp: 0.0.0.0
  tls:
    mode: requireTLS
    certificateKeyFile: /opt/ssl/tuana9a.com/fullchain-privkey.pem
```

như vậy đã thành công add ssl cho mongodb
