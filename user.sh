#!/bin/bash

# non interactive add new user "sammy"
adduser --disabled-password --gecos "" sammy

# add to the sudo group
usermod -aG sudo sammy

# so that we can ssh in as sammy@ip
rsync --archive --chown=sammy:sammy ~/.ssh /home/sammy

# switch to sammy
sudo su sammy
cd /home/sammy
