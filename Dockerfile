# Use a specific Ubuntu version
FROM ubuntu:20.04

# Set the working directory
WORKDIR /var/www/html

# Install required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    apache2=2.4.41-4ubuntu3.19 \
    curl=7.68.0-1ubuntu2.18 \
    && rm -rf /var/lib/apt/lists/*

# Copy website files
COPY ./index.html /var/www/html

# Expose port 80 for Apache
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
