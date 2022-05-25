# how to add ssl to mongodb

Tags: mongodb

cert key file khi cấu hình ssl tls của mongodb có cấu trúc là phần đầu là cert phần cuối là key
tất cả cert và key phải trong cùng một file chứ không tách riêng

ví dụ `mongodb.pem`

```
-----BEGIN CERTIFICATE-----
cert content
-----END CERTIFICATE-----
-----BEGIN PRIVATE KEY-----
key content
-----END PRIVATE KEY-----
```

sau khi có key như trên thì add file đó vào trong config

```
# network interfaces
net:
  port: 27017
  bindIp: 0.0.0.0
  tls:
    mode: requireTLS
    certificateKeyFile: /home/ubuntu/ssl/mongodb.pem
```

như vậy đã thành công add ssl cho mongodb