# Use the official Flutter image as a base
FROM cirrusci/flutter:latest AS build

# Set the working directory
WORKDIR /app

# Copy the pubspec.yaml and pubspec.lock files
COPY pubspec.* ./

# Get the dependencies
RUN flutter pub get

# Copy the rest of the application
COPY . .

# Build the release version of the application
RUN flutter build web

# Use the official Nginx image as a base
FROM nginx:1.21.1-alpine

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/

# Copy the built Flutter application to the Nginx document root
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose the default HTTP port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
