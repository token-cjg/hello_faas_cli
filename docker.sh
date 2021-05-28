#!/bin/bash

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

sudo usermod -aG docker $USER

exit
#Log out and log back in so that your group membership is re-evaluated.
# If testing on a virtual machine, it may be necessary to restart the virtual machine for changes to take effect.
# On a desktop Linux environment such as X Windows, log out of your session completely and then log back in.
# On Linux, you can also run the following command to activate the changes to groups:
newgrp docker

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

ssh-keyscan github.com >> ~/.ssh/known_hosts

wget https://github.com/token-cjg/flask_gunicorn_nginx_docker/archive/master.zip
sudo apt-get install unzip
unzip master.zip

cd flask_gunicorn_nginx_docker-master
bash run_docker.sh

# also, install jsonnet. This is required for compiling jsonnet files to yaml so that things can be built and published.
sudo snap install jsonnet
