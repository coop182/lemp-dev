#!/usr/bin/env bash

apt-packages-ppa 'chris-lea/node.js'
apt-packages-update

apt-packages-install \
  nodejs

# set node path
echo 'if [ -d "/usr/lib/node_modules" ]; then NODE_PATH="/usr/lib/node_modules"; fi' >> ~/.profile

# http://meteor.com/main see: https://github.com/meteor/meteor
curl https://install.meteor.com | /bin/sh

# install bower
sudo npm install bower -g
