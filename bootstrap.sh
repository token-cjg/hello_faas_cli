#!/bin/bash

curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/nginx.sh
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/app.sh
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/python.sh

sudo chmod +x ./nginx.sh
sudo chmod +x ./app.sh
sudo chmod +x ./python.sh

bash nginx.sh
bash app.sh
