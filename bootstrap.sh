#!/bin/bash

# curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/nginx.sh
# curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/python.sh
# curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/user.sh
#
# sudo chmod +x ./nginx.sh
# sudo chmod +x ./user.sh
# sudo chmod +x ./python.sh
#
# bash nginx.sh
# bash user.sh
# bash python.sh

sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

sudo groupadd docker
sudo usermod -aG docker $USER

#Log out and log back in so that your group membership is re-evaluated.
# If testing on a virtual machine, it may be necessary to restart the virtual machine for changes to take effect.
# On a desktop Linux environment such as X Windows, log out of your session completely and then log back in.
# On Linux, you can also run the following command to activate the changes to groups:
newgrp docker

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

git clone git@github.com:ivanpanshin/flask_gunicorn_nginx_docker.git
cd flask_gunicorn_nginx_docker
bash run_docker.sh
