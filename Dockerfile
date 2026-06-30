# Use Eclipse Temurin JDK 21 (lightweight and stable)
FROM eclipse-temurin:21-jdk-alpine

# Set working directory inside container
WORKDIR /app

# Copy the built JAR file into container
COPY target/tms-user-service-0.0.1-SNAPSHOT.jar app.jar

# Expose User Service port (default 8081 to match docker-compose and application.yaml)
EXPOSE 8081

# Run the application
ENTRYPOINT ["java","-jar","app.jar"]
