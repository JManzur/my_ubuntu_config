#!/bin/bash

#Color definitios:
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
ENDCOLOR="\e[0m"

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
        if command -v ansible > /dev/null
            then
                echo -e "${BLUE}INFO:${ENDCOLOR} Ansible installed OK"
            else
                echo -e "${RED}NOT OK:${ENDCOLOR} Ansible not installed"
        fi
        if command -v git > /dev/null
            then
                echo -e "${BLUE}INFO:${ENDCOLOR} Git installed OK"
            else
                echo -e "${RED}NOT OK:${ENDCOLOR} Git not installed"
        fi
fi