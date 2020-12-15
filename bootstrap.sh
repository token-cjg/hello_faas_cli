#!/bin/bash

curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/nginx.sh
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/python.sh
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/user.sh

sudo chmod +x ./nginx.sh
sudo chmod +x ./user.sh
sudo chmod +x ./python.sh

bash nginx.sh
bash user.sh
bash python.sh
