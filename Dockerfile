# Stage 1 — build with Maven
FROM maven:3.8.6-jdk-17 AS builder
WORKDIR /app

# copy only pom first to leverage Docker cache for dependencies
COPY pom.xml .
RUN mvn -B -f pom.xml dependency:go-offline

# copy rest and build
COPY src ./src
RUN mvn -B -f pom.xml clean package -DskipTests

# Stage 2 — run with a small JRE
FROM eclipse-temurin:17-jre
WORKDIR /app

# copy the fat/uber jar (adjust pattern to your artifact name)
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
