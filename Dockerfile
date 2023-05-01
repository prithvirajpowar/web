# Use the official OpenJDK 8 image as the base image
FROM openjdk:8-jdk-alpine

# Install required packages
RUN apk add --no-cache bash git openssh

# Set the working directory
WORKDIR /app

# Copy the app source code and dependencies into the container
COPY pubspec.yaml /app/
COPY lib /app/lib/
RUN flutter packages get

# Build the app and generate the APK file
RUN flutter build apk

# Copy the APK file into the container
COPY build/app/outputs/flutter-apk/app-release.apk

# Install APK in the Docker image
RUN apk add --no-cache --virtual .rundeps \
    unzip \
  && unzip /app/app-release.apk -d /app \
  && rm /app/app-release.apk \
  && apk del .rundeps

# Set the command to run when the Docker container starts
CMD ["flutter", "run"]
