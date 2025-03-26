FROM ubuntu:20.4

WORKDIR /var/www/html

# Install Apache
RUN apt-get update && apt-get install apache2

# Copy website files
COPY ./index.html /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2ctl", "-D", "FOREGROUND"]
