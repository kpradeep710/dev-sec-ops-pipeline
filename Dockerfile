# Use the official NGINX image from Docker Hub
FROM nginx:latest

# Update package list and clean up to reduce image size
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy website files to the correct Nginx web root
COPY --chown=nginx:nginx index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Use a non-root user for better security
USER nginx

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
