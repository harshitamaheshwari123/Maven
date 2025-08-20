# syntax=docker/dockerfile:1.7

########## Stage 1: Build with Maven (JDK 17) ##########
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app

# Cache dependencies
COPY pom.xml .
RUN --mount=type=cache,target=/root/.m2 mvn -B -e -DskipTests dependency:go-offline

# Build the app
COPY src ./src
RUN --mount=type=cache,target=/root/.m2 mvn -B -DskipTests package

########## Stage 2: Run with JRE 17 ##########
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the built jar (adjust if your build produces multiple artifacts)
COPY --from=builder /app/target/*.jar /app/app.jar

# Change if your app uses another port
EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/app.jar"]
