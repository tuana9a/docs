#
# Build stage
#
FROM maven:3.8.4-jdk-8-slim AS build
COPY src /app/src
COPY pom.xml /app
RUN mvn -f /app/pom.xml clean package

#
# Package stage
#
FROM openjdk:8u322-jre-slim-bullseye
COPY --from=build /app/target/docs-1.0.0.jar /app/docs-1.0.0.jar
ENTRYPOINT ["java","-jar","/app/docs-1.0.0.jar"]