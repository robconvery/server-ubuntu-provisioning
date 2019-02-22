#!/bin/bash

## first switch to root & the to user deploy
sudo su
su deploy
cd ~

git clone git@github.com:robconvery/robconvery.com.git app
cd app
cp .env.example .env
composer install --no-dev --optimize-autoloader
php artisan key:generate

# SET PERMISSIONS
# type `exit` to return to root user
sudo chmod -R 0755 /home/deploy/app
sudo chown -R www-data:www-data /home/deploy/app/storage

# Create a new config: sudo touch laravelapp In the config file
# as ubuntu user

cd /etc/logrotate.d
touch laravelapp
sudo nano laravelapp

### Add content

#/home/deploy/app/storage/logs/*.log {
#    monthly
#    missingok
#    rotate 12
#    compress
#    notifempty
#    create 755 www-data www-data
#}

#test setup
sudo logrotate --force laravelapp