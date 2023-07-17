#!/bin/bash
MSG_COLOR="\033[41m"

echo -e "$MSG_COLOR$(hostname): Update package lists\033[0m"
sudo apt-get update

echo -e "$MSG_COLOR$(hostname): Install PHP-FPM and necessary modules\033[0m"
sudo apt-get install -y php php-fpm php-common php-cli php-mysql php-pgsql php-pdo php-mbstring php-zip zip unzip

echo -e "$MSG_COLOR$(hostname): Install Composer (PHP)\033[0m"
cd ~
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

echo -e "$MSG_COLOR$(hostname): Install dependencies for websockets server\033[0m"
cd /vagrant/ws

#if [ ! -d "ws" ]; then
 #   mkdir ws
#fi

#cd ws

sudo -u vagrant bash -c 'composer install'

#ssh fazer a parte do github do stor
