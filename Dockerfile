# Use the srsolutions/ilias image as the base
FROM srsolutions/ilias

# Update to PHP 8.2 and install Apache
RUN apt-get update && \
    apt-get install -y \
    php8.2 \
    php8.2-mysql \
    php8.2-xml \
    apache2 && \
    apt-get clean

# Enable Apache modules
RUN a2enmod rewrite

# Set the working directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]