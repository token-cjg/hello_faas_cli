#!/bin/bash

curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/docker.sh
sudo chmod +x ./docker.sh
bash docker.sh

# install openFaaS cli
curl -sSL https://cli.openfaas.com | sudo -E sh

echo "You now need to manually set OPENFAAS_URL and then faas-cli login with the
username and password of your faasd server or your throwaway server"
