#!bin/bash

# Create an admin user
#####sudo adduser myadmin
#####sudo usermod -a -G sudo myadmin

# Edit
#####sudo nano /etc/sudoers
###### Add the following
###### ubuntu  ALL=(ALL:ALL) NOPASSWD:ALL

## Update the package
sudo apt update

# Used to create default image used by terraform. From vanilla install of
# Ubuntu 18.04 install the following

## SETUP FIREWALL
#####sudo iptables -A INPUT -i lo -j ACCEPT
#####sudo iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
#####sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
#####sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
#####sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
#####sudo iptables -A INPUT -j DROP

#####sudo apt install -y iptables-persistent
##########sudo service iptables-persistent start
#####sudo service netfilter-persistent start
#####sudo iptables-save > /etc/iptables/rules.v4
#####sudo service iptables-persistent restart

## SETUP Fail2Ban
#####sudo apt install -y fail2ban
#####sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
#####sudo service fail2ban reload

## AUTOMATIC SECURITY UPDATES
sudo apt install -y unattended-upgrades

sudo apt install -y unzip

# Then update /etc/apt/apt.conf.d/50unattended-upgrades
# (the number preceding the filename might vary a bit). Make
# sure "Ubuntu trusty-security"; is uncommented, while the
# remaining “Allowed-Origins” listed are commented out:

# File: /etc/apt/apt.conf.d/50unattended-upgrades
# Unattended-Upgrade::Allowed-Origins {
#   "${distro_id}:${distro_codename}-security";
#   // "${distro_id}:${distro_codename}-updates";
#   // "${distro_id}:${distro_codename}-proposed";
#   // "${distro_id}:${distro_codename}-backports";
# };

# Finally, create or edit /etc/apt/apt.conf.d/10periodic and ensure these lines are present:
# File: /etc/apt/apt.conf.d/10periodic
# APT::Periodic::Update-Package-Lists "1";
# APT::Periodic::Download-Upgradeable-Packages "1";
# APT::Periodic::AutocleanInterval "7";
# APT::Periodic::Unattended-Upgrade "1";

## INSTALL Git
sudo apt update
sudo apt install git -y

## INSTALL awscli
sudo apt install awscli -y

## INSTALLING Nginx
sudo add-apt-repository -y ppa:nginx/stable
sudo apt update
sudo apt install -y nginx

## Install PHP 7.3
sudo add-apt-repository ppa:ondrej/php -y # Press enter to confirm.
sudo apt-get update
sudo apt install php7.3 php7.3-common php7.3-cli -y
sudo apt install php7.3-bcmath php7.3-bz2 php7.3-curl php7.3-gd php7.3-intl php7.3-json php7.3-mbstring php7.3-readline php7.3-xml php7.3-zip -y
sudo apt install php7.3-fpm


## INSTALLING Certbot
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt-get update
sudo apt-get install python-certbot-nginx -y

# Alter `/etc/nginx/sites-available/default`
# server {
#     listen 80 default_server;
#
#     listen [::]:80 default_server ipv6only=on;
#
#     return 444;
# }

## ADD Deployment User
sudo adduser deploy
# set password to one within keypass for deployment user

# Update `sudoers`
####### sudo nano /etc/sudoers
# Update line
# deploy  ALL=(root) NOPASSWD: /bin/su - deploy
su deploy
ssh-keygen -t rsa -b 4096 -C robconvery@me.com






