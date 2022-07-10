#!/bin/bash

if sudo -n true 2>/dev/null; then
    echo ""
else
    echo "Wrong password"
    exit 1
fi
export DEBIAN_FRONTEND=noninteractive

apt update && apt upgrade -y
sudo apt-get install ubuntu-desktop

# install nomachine for remote desktop
sudo apt install build-essential linux-headers-$(uname -r)

wget https://download.nomachine.com/download/7.9/Linux/nomachine_7.9.2_1_amd64.deb
apt install ./nomachine_7.9.2_1_amd64.deb
rm nomachine_7.9.2_1_amd64.deb

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb
apt install unzip
apt -y install python3.10-venv

sudo reboot