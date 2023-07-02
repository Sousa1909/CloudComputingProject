#!/bin/bash

echo "Update the OS"
apt-get update -y
apt-get install vim -y

echo "Install Ansible"
apt-get install epel-release -y
apt-get install ansible -y