# Spring Boot

xem tại github [tuana9a/learn-java-spring-boot](https://github.com/tuana9a/learn-java-spring-boot)

# `application.properties`

```properties
# Server use env port
server.port=${PORT}
server.address=${BIND}
# SSL
server.ssl.enabled=true
server.ssl.key-store-type==PKCS12
server.ssl.key-store=classpath:ssl/keystore.p12
server.ssl.key-store-password=password
server.ssl.key-alias=tomcat
server.ssl.trust-store=classpath:ssl/keystore.p12
server.ssl.trust-store-password=password
# Mail
spring.mail.host=smtp.gmail.com
spring.mail.username=
spring.mail.password=
spring.mail.port=587
spring.mail.protocol=smtp
spring.mail.properties.mail.smtp.auth=true
spring.mail.properties.mail.smtp.starttls.enable=true
# JPA
spring.jpa.show-sql=true
# create update validate
spring.jpa.hibernate.ddl-auto=validate
# org.hibernate.dialect.MySQL5Dialect
# org.hibernate.dialect.MySQL5InnoDBDialect
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL5InnoDBDialect
# Datasource
spring.datasource.driverClassName=com.mysql.cj.jdbc.Driver
spring.datasource.url=${DB_URL}
spring.datasource.username=${DB_USERNAME}
spring.datasource.password=${DB_PASSWORD}
spring.datasource.tomcat.max-wait=30000
spring.datasource.tomcat.max-active=50
spring.datasource.tomcat.test-on-borrow=true
# Custom (out of springboot configuration)
custom.name=tuana9a
custom.root_folder=D:/home/tuana9a/Public
# Google
custom.google.appId=
custom.google.appSecret=
custom.google.user_info=https://www.googleapis.com/oauth2/v1/userinfo?access_token=
custom.google.scope=https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile
custom.google.redirect=http://localhost/google/callback
# Facebook
custom.facebook.appId=
custom.facebook.appSecret=
custom.facebook.scope=public_profile,email
custom.facebook.redirect=http://localhost/facebook/callback
```