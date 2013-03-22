#!/usr/bin/env bash

if [ ! -d '/data' ]; then
    sudo mkdir /data
fi

# Install netatalk
apt-packages-install     \
  netatalk

# Update netatalk default setup to set guest account
sudo sed -e 's|#\?AFPD_GUEST=.*|AFPD_GUEST=vagrant|gi' -i '/etc/default/netatalk'

# Add default AFPD to end of afpd.conf file
grep 'transall -uamlist uams_guest.so' '/etc/netatalk/afpd.conf' >/dev/null || \
	( echo "- -transall -uamlist uams_guest.so -nosavepassword -advertise_ssh" | sudo tee -a '/etc/netatalk/afpd.conf' >/dev/null )

# Setup the data share in Apple
grep 'local-dev' '/etc/netatalk/AppleVolumes.default' >/dev/null || \
	( echo "/data \"local-dev\" cnidscheme:dbd options:usedots,upriv" | sudo tee -a '/etc/netatalk/AppleVolumes.default' >/dev/null )

# Configure vagrant as owner and group of data directory
sudo chown -R vagrant /data
sudo chgrp -R vagrant /data
sudo chmod -R 0775 /data

# restart samba services
system-service netatalk restart
