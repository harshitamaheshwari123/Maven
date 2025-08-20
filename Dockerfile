FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app


COPY pom.xml .
RUN --mount=type=cache,target=/root/.m2 mvn -B -e -DskipTests dependency:go-offline

COPY src ./src
RUN --mount=type=cache,target=/root/.m2 mvn -B -DskipTests package


FROM eclipse-temurin:17-jre
WORKDIR /app


COPY --from=builder /app/target/*.jar /app/app.jar


EXPOSE 3000

ENTRYPOINT ["java","-jar","/app/app.jar"]
