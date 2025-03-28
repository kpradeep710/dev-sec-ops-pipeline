# Use the official NGINX image from Docker Hub
FROM nginx:1.26.3

# Install curl with a pinned version and clean up properly
RUN apt-get update && apt-get install -y --no-install-recommends curl ubuntu2.14 \
    && rm -rf /var/lib/apt/lists/*

# Copy website files to the Nginx web root
COPY index.html /usr/share/nginx/html/

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

