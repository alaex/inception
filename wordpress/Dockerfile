FROM debian:bullseye

# Install dependencies, clean up, and add PHP repository if needed
RUN apt-get update && \
    apt-get install -y wget mariadb-client php7.4 php7.4-fpm php7.4-mysql
    
# Download and set up WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp

# Copy and set permissions for the script
COPY script.sh /script.sh
RUN chmod +x /script.sh

# Create WordPress directory and set permissions
RUN mkdir -p /var/www/wordpress && \
    chown -R www-data:www-data /var/www/wordpress

# Set the working directory
WORKDIR /var/www/wordpress

# Expose port 80
# EXPOSE 80

# Run the script
CMD ["bash", "/script.sh"]
