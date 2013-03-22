#!/usr/bin/env bash

cd ../../../

echo "PROGRESS:0"
echo "Stopping Server!"

umount data

echo "PROGRESS:20"
echo "Shared drive Unmounted!"

vagrant halt

rm -rf data

echo "PROGRESS:100"
echo "Server Stopped!"

sleep 1