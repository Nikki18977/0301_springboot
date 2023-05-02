FROM bitnami/java:17 as builder
LABEL org.opencontainers.image.source="https://github.com/Nikki18977/0301_springboot"

ARG DB_ENDPOIN
ENV DB_ENDPOINT=${DB_ENDPOIN}
ENV JDBC_URL='jdbc:postgresql://${DB_ENDPOINT}:5432/db?user=app&password=pass'

WORKDIR /app
COPY . .
RUN ./mvnw install
RUN ./mvnw verify

FROM bitnami/java:17
COPY --from=builder /app/target/app.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
