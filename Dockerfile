FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean install

FROM eclipse-temurin:17.0.10_7-jre
WORKDIR /app
COPY --from=build /app/target/my-app.jar /apps/
EXPOSE 8081
CMD ["java", "-jar", "my-app.jar"]
