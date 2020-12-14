#!/bin/bash

# to run
# ssh root@_secret_ip_
# curl -O -L https://raw.githubusercontent.com/token-cjg/hello_coturn/master/nginx.sh
# ./nginx.sh

# purge first!
sudo apt-get purge -y nginx nginx-common

# nginx
sudo apt-get install -y nginx
sudo ufw allow 'Nginx Full'
sudo ufw allow ssh
sudo ufw --force enable
# sudo ufw status
# sudo systemctl status nginx

# nginx, HTTPS /w lets encrypt
# note, need a domain - get one from freenom
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt-get update -y
sudo apt-get install python-certbot-nginx -y
sudo nginx -t
sudo systemctl reload nginx
sudo certbot --nginx -d faascliflask.cthulu.tk --keep-until-expiring --no-redirect --register-unsafely-without-email --agree-tos
