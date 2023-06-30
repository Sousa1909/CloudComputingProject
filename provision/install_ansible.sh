#!/bin/bash

echo "Update the OS"
apt update -y
apt install vim -y

echo "Install Ansible"
apt install epel-release -y
apt install ansible -y

echo "Install Netcat"
apt install nc

echo "Install Nano"
sudo apt-get install -y nano