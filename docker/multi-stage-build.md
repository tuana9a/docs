<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Multi Stage Build</title>
</head>

<body>
    
    <hr>
    <!--  -->
    <h1>Ví dụ với maven và tomcat</h1>
    <div class="fetchAppend" data-url="./maven-tomcat/Dockerfile"></div>
    <hr>
    <h1>Ví dụ với react</h1>
    <div class="fetchAppend" data-url="./react/Dockerfile"></div>
    <script src="/libs/fetchAppend.js"></script>
</body>

</html>

# Lợi ích của multi stage build

cực kì hữu dụng do có rất nhiều app sau khi build <br>
thì không cần dùng các tool trước đó nữa

ví dụ với java servlet <br>
sau khi đóng gói với maven thì chỉ cần file war là chạy app <br>
cỏn maven thì vứt được

```dockerfile
# bước đầu chỉ cần tải maven và build file war
FROM maven AS build
WORKDIR /app
COPY . .
RUN mvn package

# bước 2 copy file war ở bước 1 và cho vào tomcat image
# để ý --from là build ứng với alias maven ở trên
FROM tomcat:10.0-jdk8-openjdk-slim
COPY --from=build /app/target/file.war /usr/local/tomcat/webapps 
```

react thi cung tuong tu

```dockerfile
# đại loại là build
FROM node:12 AS build
WORKDIR /app
COPY package* yarn.lock ./
RUN yarn install
COPY public ./public
COPY src ./src
RUN yarn run build

# sau đó copy toàn bộ file build vào image cuối
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
```