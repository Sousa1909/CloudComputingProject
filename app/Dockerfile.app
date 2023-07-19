FROM php:8.2-fpm

# Copy the WebApp files to the Docker container
COPY . /usr/src/webapp

# Set Workdir as the folder with the WebApp content
WORKDIR /usr/src/webapp

# Install required packages
RUN apt-get update && \
    apt-get install -y \
    zip \
    unzip && \
    curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php && \
    php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    composer install

RUN apt-get install -y libpq-dev \
    && docker-php-ext-install pdo_pgsql

# Set permissions for CSS files
RUN chmod 644 public_html/css/bootstrap.min.css \
    && chmod 644 public_html/css/site.css

# Create gallery directory and set permissions
RUN chmod 777 /usr/src/webapp/public_html/data/gallery

# Open Port
EXPOSE 9000

# Start the FPM (FastCGI Process Manager) service
CMD ["php-fpm"]

# build: docker build -t webapp .
# run:   docker run -it --rm --name WebApp webapp  
