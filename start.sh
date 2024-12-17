#!/bin/bash -e
OS_NAME=$(grep '^NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')
OS_VERSION=$(grep '^VERSION_ID=' /etc/os-release | cut -d= -f2 | tr -d '"') 
OS_ID=$(echo $OS_VERSION | cut -d. -f1)
if [[ "$OS_NAME" == "Ubuntu" && $OS_ID < 24 ]]; then
apt-add-repository ppa:ansible/ansible -y
apt update
apt install ansible -y

ansible-playbook setup_generic-icub-machine.yml
else
    echo "wrong distrubution please run this playbook on a supported distribution check README file"
fi    

