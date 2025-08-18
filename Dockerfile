# Stage 1: Build
FROM maven:3.8.6-jdk-17-slim AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

ENV PORT=3000
EXPOSE 3000

CMD ["java", "-jar", "app.jar"]
