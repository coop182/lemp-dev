#!/usr/bin/env bash

cd ../../../

echo "PROGRESS:0"
echo "Starting Server!"

if vagrant hosts list >/dev/null; then
	echo "Plugin: vagrant-hostmaster installed"
else
	echo "Plugin: vagrant-hostmaster installing now."
	vagrant gem install vagrant-hostmaster
fi

echo "PROGRESS:10"

vagrant up --no-provision

echo "PROGRESS:80"
echo "Server Started!"

mkdir data
mount -t smbfs //guest@192.168.33.11/data data

echo "PROGRESS:90"
echo "Shared Drive Mounted!"

open provision.app

echo "PROGRESS:100"
echo "Server Booted!"

sleep 1
