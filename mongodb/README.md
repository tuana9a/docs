# MongoDB

## add ssl mongodb

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
    certificateKeyFile: /opt/fullchain-privkey.pem
    allowConnectionsWithoutCertificates: true # mongo 7.0 ? are 5.0, 6.0 required
```

start server with those flag

```bash
# mongo 7.0 ? are 5.0, 6.0 required
mongod --setParameter tlsUseSystemCA=true --config /etc/mongod.conf
```

```bash
mongo "mongodb://xxx:yyy@host/?tls=true"
```

như vậy đã thành công add ssl cho mongodb

## add user

root user

```js
use admin
db.createUser(
  {
    user: "admin",
    pwd: "password",
    roles: [ { role: "root", db: "admin" } ]
  }
)
```

common user for backend

```js
use tuana9a
db.createUser(
  {
    user: "tuana9a",
    pwd:  "password",
    roles: [ { role: "readWrite", db: "tuana9a" } ]
  }
)
```
