FROM eclipse-temurin:21-jre

WORKDIR /app

ARG APP_VERSION

COPY target/microservice-${APP_VERSION}.jar app.jar

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "app.jar"]