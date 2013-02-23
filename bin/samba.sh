#!/usr/bin/env bash

if [ ! -d '/data' ]; then
    sudo mkdir /data
fi

# Install samba
apt-packages-install     \
  samba

# Clear the samba config for the local dev server
sudo sed -e ':a' -e 'N' -e '$!ba' \
-e 's/\n/##NEW_LINE##/g' \
-e 's/\(##NEW_LINE##\)*\[data\].*#\[data\] End/##NEW_LINE##/g' \
-e 's/\[global\].*# End local-dev global settings/\[global\]/g' \
-e 's/##NEW_LINE##/\n/g' -i '/etc/samba/smb.conf'

# Samba config for local dev server
local_dev_data=$( cat <<-EOD
[data]
    comment = Local Dev Server - /data
    path = /data
    browsable = yes
    guest ok = yes
    read only = no
    create mask = 0777
    force user = root
    force group = root
#[data] End
EOD
)

# write the config to the samba config file.
echo "$local_dev_data" | sudo tee -a '/etc/samba/smb.conf' >/dev/null

# Samba config global settings
sudo sed -e "s|\[global\]|\[global\]\n\
# Start local-dev global settings\n\
    follow symlinks = yes\n\
    wide links = yes\n\
    unix extensions = no\n\
# End local-dev global settings|g" \
-i '/etc/samba/smb.conf'

# restart samba services
system-service smbd restart
system-service nmbd restart