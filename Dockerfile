FROM maven:3.8.6-openjdk-8-slim as builder
WORKDIR /temporary
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:8-jdk-alpine
COPY --from=builder /temporary/target/demo-0.0.1-SNAPSHOT.jar demo-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/demo-0.0.1-SNAPSHOT.jar"]