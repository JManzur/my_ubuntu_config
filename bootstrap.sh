#!/bin/bash

#Color definition:
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
ENDCOLOR="\e[0m"

#Progress bar function:
progress_bar () {
    echo ""
    echo -e "${BLUE}INFO:${ENDCOLOR} ${GREEN}Starting verification: ${ENDCOLOR} \n"
    echo -ne '[....................](00%)\r'
    sleep 1
    echo -ne '[#####...............](25%)\r'
    sleep 1
    echo -ne '[##########..........](50%)\r'
    sleep 1
    echo -ne '[###############.....](75%)\r'
    sleep 1
    echo -ne '[####################](100%)\r'
    sleep 1
    echo -e '\n'
}

# Check if pre-requisites are installed:
check_if_installed () {
    if command -v $1 > /dev/null
        then
            echo -e "${BLUE}INFO:${ENDCOLOR} $1 installed OK"
        else
            echo -e "${RED}NOT OK:${ENDCOLOR} $1 not installed"
    fi
}

# Run Ansible Pull:
run_ansible_pull () {
    echo -e "${GREEN}Running Ansible Pull${ENDCOLOR} \n"
    sudo ansible-pull -U https://github.com/JManzur/my_ubuntu_config.git
}

# Install QEMU Agent:
install_qemu_agent () {
    echo -e "${GREEN}Installing QEMU Agent${ENDCOLOR} \n"
    sudo apt install qemu-guest-agent -y
    sudo systemctl start qemu-guest-agent
    sudo systemctl enable qemu-guest-agent
}

if [[ $EUID -ne 0 ]]
    then
        echo -e "${RED}ERROR:${ENDCOLOR} This script must be run as root" 
        exit 1
    else
        echo -e "${GREEN}Updating and Upgrading${ENDCOLOR} \n"
        apt-get update && sudo apt-get upgrade -y
        echo -e "${GREEN}Installing Git${ENDCOLOR} \n"
        apt install git -y
        echo -e "${GREEN}Installing Ansible${ENDCOLOR} \n"
        apt install ansible -y
        progress_bar
        check_if_installed "git"
        check_if_installed "ansible"
        run_ansible_pull
        read -p "Do you want to install QEMU Agent? (y/n): " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]
            then
                install_qemu_agent
            else
                echo -e "${BLUE}INFO:${ENDCOLOR} QEMU Agent not installed"
        fi
fi