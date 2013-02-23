#!/usr/bin/env bash

echo "############################################"
echo "#####           Provisioning!          #####"
echo "############################################"
echo " "

cd ../../../

# Try to update hosts file
vagrant hosts update

# Get the VM ID
vm_id=$(cat .vagrant | sed "s/.*\":\"\(.*\)\"}}/\1/g")

# Get the hosts
vm_basehost=$(cat Vagrantfile | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n//g' -e "s/.*config\.vm\.host_name[^\"]*=[^\"]*\"\([^\"]*\)\".*/\1/g")
if [ -f host-aliases ];
then
	vm_aliases=$(cat host-aliases | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/ /g')
else
	vm_aliases=""
fi

# Test if hosts have been added
hosts_exist=$(cat /private/etc/hosts | sed "s/192\.168\.33\.11.*$vm_basehost.*$vm_aliases.*#.*VAGRANT.*$vm_id/HOSTS_EXIST/g")

if [[ "$hosts_exist" == *HOSTS_EXIST* ]]
then
	echo "Host file up to date"
else
	echo "Host file out of date, launching edit script"
	chmod +x update-hosts.command
	open update-hosts.command
fi

vagrant provision
mkdir data
mount -t smbfs //guest@192.168.33.11/data data

echo " "
echo "############################################"
echo "#####      Provisioning Finished!      #####"
echo "############################################"

sleep 1
