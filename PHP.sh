#!bin/bash

## NO LONGER USED
## At the moment the AMI Image has the full
## requirements contained on it


# Custom installation run by terraform `user_data`

## INSTALL PHP
# install the required version of PHP

# Install PHP 7.3
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo apt install php7.3 php7.3-common php7.3-cli -y
sudo apt install php7.3-bcmath php7.3-bz2 php7.3-curl php7.3-gd php7.3-intl php7.3-json php7.3-mbstring php7.3-readline php7.3-xml php7.3-zip -y
sudo apt install php7.3-fpm

# Uninstall Apache2
sudo service apache2 stop
sudo apt-get purge -y apache2 apache2-utils apache2.2-bin apache2-common
sudo apt-get autoremove
sudo rm -rf /usr/sbin/apache2 & sudo rm -rf /usr/lib/apache2 & sudo rm -rf /etc/apache2 & sudo rm -rf /usr/share/apache2 & sudo rm -rf /usr/share/man/man8/apache2.8.gz

## Install composer
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer


## SETUP Virtual Host FOR NGINX

# Create conf file, replace {name}
#/etc/nginx/sites-available/{name}

#server {
#	listen 80 default_server;
#	listen [::]:80 default_server;
#	server_name example.com www.example.com;
#	return 301 https://$server_name$request_uri;
#}


# server {
#     listen 80;
#     server_name *.example.com;
#     return 301 $scheme://fideloper.com$request_uri;
# }

# server {
#     listen 80;
#     server_name example.com;
#
#     root /home/deploy/app/public;
#
#     index index.html index.thm index.php
#
#     charset utf-8;
#
#     access_log /var/log/nginx/example.com.log;
#     error_log /var/log/nginx/example.com-error.log error;
#
#     # include h5bp/basic.conf;
#
#     location = /favicon.ico { access_log off; log_not_found off; }
#     location = /robots.txt { access_log off; log_not_found off; }
#
#     location / {
#         try_files $uri $uri/ /index.php$is_args$args;
#     }
#
#     location ~ \.php$ {
#         include snippets/fastcgi-php.conf;
#         fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
#     }
#
#     location ~ /\.ht {
#	      deny all;
#     }
# }

sudo ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/app

sudo chown -R root:root /var/www/app
####### sudo chown -R www-data:www-data ~/app/storage