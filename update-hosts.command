#!/usr/bin/env bash

cd `dirname $0`

echo "############################################"
echo "#####       Updating hosts file,       #####"    
echo "#####       administrator access       #####"
echo "#####           is required!           #####"
echo "############################################"
echo " "

vagrant hosts update

echo " "
echo "############################################"
echo "#####         Update Complete!         #####"
echo "############################################"

exit
