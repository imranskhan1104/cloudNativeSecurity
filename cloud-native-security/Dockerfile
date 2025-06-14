# -------- Stage 1: Build the application --------
FROM maven:3.6.3-openjdk-17 AS builder

WORKDIR /build
COPY pom.xml .
COPY src ./src

# Build the Spring Boot app
RUN mvn clean package -DskipTests

# -------- Stage 2: Create runtime image --------
FROM openjdk:17-jdk-slim

# App directory inside container
WORKDIR /app

# Copy the jar from the build stage
COPY --from=builder /build/target/*.jar app.jar

# Expose the port Spring Boot will listen on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

