#!/usr/bin/env bash

# Setup NginX, MySql, PHP
apt-packages-install     \
  mysql-server           \
  nginx                  \
  php5-fpm               \
  php5-common            \
  php5-cli               \
  php5-gd                \
  php5-curl              \
  phpmyadmin

# Allow unsecured remote access to MySQL.
mysql-remote-access-allow

# setup new mysql admin user
mysql -u root -e "GRANT ALL PRIVILEGES ON  * . * TO  'admin'@'localhost' IDENTIFIED BY  'admin';"
mysql -u root -e "GRANT GRANT OPTION ON  * . * TO  'admin'@'localhost' IDENTIFIED BY  'admin';"

# Restart MySQL service for changes to take effect.
mysql-restart

# Set PHP timezone
php-settings-update 'date.timezone' 'Europe/London'

# Install Composer
if [ ! -f "/usr/local/bin/composer" ]; then
    curl -s https://getcomposer.org/installer | sudo php
    sudo mv composer.phar /usr/local/bin/composer
fi

# Setup the localhost virtual host
if [ ! -d '/data/httpd/lempdev.localhost' ]; then
  sudo mkdir -p /data/httpd/lempdev.localhost
  PHP=/usr/bin/php5-fpm nginx-sites-create "00-lempdev.localhost" "/data/httpd/lempdev.localhost" "vagrant"
  nginx-sites-enable "00-lempdev.localhost"
fi

#symlink phpmyadmin to localhost directory
if [ ! -d "/data/httpd/lempdev.localhost/phpmyadmin" ]; then
    sudo ln -s /usr/share/phpmyadmin /data/httpd/lempdev.localhost
fi

# create virtual hosts
for site in `cat /vagrant/host-aliases`; do
    if [ ! -d "/data/httpd/$site" ]; then
        sudo mkdir -p /data/httpd/$site
        PHP=/usr/bin/php5-fpm nginx-sites-create "$site" "/data/httpd/$site" "vagrant"
        nginx-sites-enable "$site"
    fi
done

php-fpm-restart
nginx-restart
