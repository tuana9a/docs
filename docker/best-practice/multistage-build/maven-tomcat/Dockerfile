# bước đầu chỉ cần tải maven và build file war
FROM maven AS build
WORKDIR /app
COPY . .
RUN mvn package

# bước 2 copy file war ở bước 1 và cho vào tomcat image
# để ý --from là build ứng với alias maven ở trên
FROM tomcat:10.0.16-jdk8-corretto
COPY --from=build /app/target/file.war /usr/local/tomcat/webapps 