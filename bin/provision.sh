#!/usr/bin/env bash

# {{{ Ubuntu utilities
<%= import 'bin/ubuntu.sh' %>
# }}}

# Use Google Public DNS for resolving domain names.
# The default is host-only DNS which may not be installed.
#nameservers-local-purge
nameservers-append '8.8.8.8'
nameservers-append '8.8.4.4'

# Using the GB mirror for faster downloads.
apt-mirror-pick 'gb'

# Update packages cache.
apt-packages-update

# Install VM packages.
apt-packages-install                 \
  git-core                           \
  imagemagick                        \
  curl

<%= import 'bin/samba.sh' %>
<%= import 'bin/lemp.sh' %>

echo 'if [ -d "/vagrant/bin" ]; then PATH=$PATH":/vagrant/bin"; fi' >> ~/.profile
