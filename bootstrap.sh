#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
else
	echo "Updating and Upgrading"
	apt-get update && sudo apt-get upgrade -y
    echo ""
    echo "Installing Git"
    apt install git -y
    echo ""
    echo "Installing Ansible"
    apt install ansible -y
    echo ""
    echo "Installation process completed successfully."
    exit 0
fi