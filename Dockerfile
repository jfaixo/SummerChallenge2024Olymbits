FROM node:20 as ui-builder
WORKDIR /app
COPY ./ .
WORKDIR /app/src/main/resources/

RUN npm install
RUN npm run build

FROM maven:3-eclipse-temurin-17 AS java-builder
WORKDIR /app
COPY ./ .
COPY --from=ui-builder /app/src/main/resources/ /app/src/main/resources/
RUN mvn package
RUN chown 1000 /app/target/spring-2024-olympics-1.0-SNAPSHOT.jar
RUN chgrp 1000 /app/target/spring-2024-olympics-1.0-SNAPSHOT.jar

FROM eclipse-temurin:17

USER 1000
WORKDIR /app
COPY --from=java-builder /app/target/spring-2024-olympics-1.0-SNAPSHOT.jar /app/referee.jar
COPY ./src/main/resources /app/src/main/resources

EXPOSE 8888

ENTRYPOINT ["java", "-jar", "referee.jar"]
