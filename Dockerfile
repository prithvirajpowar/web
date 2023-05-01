# Base image
FROM ubuntu:latest

# Update packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl git unzip xz-utils zip libglu1-mesa

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git /flutter && \
    export PATH=$PATH:/flutter/bin && \
    flutter config --enable-web && \
    flutter precache && \
    flutter doctor

# Set working directory
WORKDIR dharati / app

# Copy the Flutter application code to the container
COPY . .

# Build the Flutter application
RUN flutter build web

# Expose port 8080
EXPOSE 8080

# Run the Flutter application
CMD ["flutter", "run", "-d", "web-server", "--web-port", "8080"]
