FROM openjdk:8-jdk-slim

RUN apt-get update && \
    apt-get install -y curl git unzip xz-utils libglu1-mesa && \
    apt-get clean

# Install Flutter SDK
RUN git clone --branch stable --depth 1 https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH "$PATH:/usr/local/flutter/bin"

# Create app directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN flutter pub get

# Build APK
RUN flutter build apk --release
