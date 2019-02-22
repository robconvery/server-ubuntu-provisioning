#!bin/bash

#################
## NO LONGER USED
#################

# Install

# Uninstall Apache2
sudo service apache2 stop
sudo apt-get purge -y apache2 apache2-utils apache2.2-bin apache2-common
sudo apt-get autoremove
# whereis apache2
# apache2: /usr/sbin/apache2 /usr/lib/apache2 /etc/apache2 /usr/share/apache2 /usr/share/man/man8/apache2.8.gz
sudo rm -rf /usr/sbin/apache2 & sudo rm -rf /usr/lib/apache2 & sudo rm -rf /etc/apache2 & sudo rm -rf /usr/share/apache2 & sudo rm -rf /usr/share/man/man8/apache2.8.gz

# Install GIT
#sudo apt update
#sudo apt install git -y

# Install Ngnix
sudo apt update & sudo apt install nginx -y

# Install PHP 7.3
sudo add-apt-repository ppa:ondrej/php -y # Press enter to confirm.
sudo apt-get update
sudo apt install php7.3 php7.3-common php7.3-cli -y
sudo apt install php7.3-bcmath php7.3-bz2 php7.3-curl php7.3-gd php7.3-intl php7.3-json php7.3-mbstring php7.3-readline php7.3-xml php7.3-zip -y
sudo apt install php7.3-fpm

# Setup for PHP
sudo sed -i -e s/php7\.0-fpm\.sock/php7\.3-fpm\.sock/g /etc/nginx/sites-available/default; sudo sed -i -e '56s/#//' /etc/nginx/sites-available/default; sudo sed -i -e '57s/#//' /etc/nginx/sites-available/default; sudo sed -i -e '58s/#//' /etc/nginx/sites-available/default; sudo sed -i -e '60s/#//' /etc/nginx/sites-available/default; sudo sed -i -e '63s/#//' /etc/nginx/sites-available/default; sudo sed -i -e s/index\.nginx-debian\.html/index\.php/g /etc/nginx/sites-available/default; sudo sed -i -e "s/]:80 default/]:80 ipv6only=on default/g" /etc/nginx/sites-available/default;

## Installing composer
#https://www.digitalocean.com/community/tutorials/how-to-install-and-use-composer-on-ubuntu-18-04

# Setup lets encrypt
# https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt-get update
sudo apt-get install python-certbot-nginx -y

# Setup index page
echo "<?php echo \"Building server..\" ?>" | sudo tee /var/www/html/index.php
sudo chmod +x /var/www/html/index.php
sudo rm -f /var/www/html/index.html
sudo service nginx restart

sudo apt install awscli -y

# tidy
sudo truncate --size=0 /var/log/nginx/error.log
sudo truncate --size=0 /var/log/nginx/access.log
sudo rm -rf /etc/logrotate.d/apache2
