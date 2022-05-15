#!/bin/bash

if sudo -n true 2>/dev/null; then
    echo ""
else
    echo "Wrong password"
    exit 1
fi
export DEBIAN_FRONTEND=noninteractive

apt update && apt upgrade -y
apt -y install ubuntu-mate-desktop

# install nomachine for remote desktop

wget https://download.nomachine.com/download/7.9/Linux/nomachine_7.9.2_1_amd64.deb
apt install ./nomachine_7.9.2_1_amd64.deb
rm nomachine_7.9.2_1_amd64.deb

snap install blender --classic
# sudo apt install firefox
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb
apt install unzipeb
apt -y install python3.10-venv

sudo reboot