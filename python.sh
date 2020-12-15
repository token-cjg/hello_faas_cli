sudo apt update
sudo apt install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools -y
sudo apt install python3-venv python3.8 pipenv -y


# get the Flask app
mkdir faas-cli-flask
# Move into the parent directory for our Flask project.
cd ~/faas-cli-flask
mkdir app
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/fixtures/flaskapp/app/main.py
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/fixtures/flaskapp/wsgi.py
mv main.py app/main.py

# Create a virtual environment to store your Flask project’s Python requirements by typing:
pipenv install wheel gunicorn flask

# If you followed the initial server setup guide, you should have a UFW firewall enabled. To test the application, you need to allow access to port 5000:
sudo ufw allow 5000

# Set up a service to run this thing
VENV_PATH=$(pipenv --venv)

curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/fixtures/faas_cli_flask.service
sed -i 's/replaceme/'"$VENV_PATH"'/g' faas_cli_flask.service
mv faas_cli_flask.service /etc/systemd/system/faas_cli_flask.service

# run the service
sudo systemctl start faas_cli_flask
sudo systemctl enable faas_cli_flask

# route nginx to the service
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/fixtures/flaskapp/nginx/faas_cli_flask
mv faas_cli_flask /etc/nginx/sites-available/faas_cli_flask

# activate the nginx route
sudo ln -s /etc/nginx/sites-available/faas_cli_flask /etc/nginx/sites-enabled

# restart nginx to pick up the change
sudo systemctl restart nginx

sudo ufw delete allow 5000
sudo ufw allow 'Nginx Full'
