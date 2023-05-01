# Base image
FROM nginx

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy build artifacts from the host machine to the container
COPY build/web/ .

# Expose port
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

