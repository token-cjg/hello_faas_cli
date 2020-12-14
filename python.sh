sudo apt update
sudo apt install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools -y
sudo apt install python3-venv -y


# get the Flask app
mkdir faas-cli-flask
# Move into the parent directory for our Flask project.
cd ~/faas-cli-flask
mkdir app
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/fixtures/app/main.py
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/fixtures/wsgi.py
mv main.py app/main.py

# Create a virtual environment to store your Flask project’s Python requirements by typing:
python3.6 -m venv myprojectenv
# This will install a local copy of Python and pip into a directory called myprojectenv within your project directory.

# Before installing applications within the virtual environment, you need to activate it. Do so by typing:
source myprojectenv/bin/activate

# First, let’s install wheel with the local instance of pip to ensure that our packages will install even if they are missing wheel archives:
pip install wheel

# Next, let’s install Flask and Gunicorn:
pip install gunicorn flask

# If you followed the initial server setup guide, you should have a UFW firewall enabled. To test the application, you need to allow access to port 5000:
sudo ufw allow 5000
