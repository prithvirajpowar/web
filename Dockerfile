# Use an official Nginx runtime as a parent image
FROM nginx:latest

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the built APK from the previous build stage
COPY --from=builder /app/build/app/outputs/flutter-apk/app-release.apk /usr/share/nginx/html

# Copy the nginx configuration file
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80
