#!/bin/bash

if sudo -n true 2>/dev/null; then
    echo ""
else
    echo "Wrong password"
    exit 1
fi
export DEBIAN_FRONTEND=noninteractive

apt update && apt upgrade -y
sudo apt -y install gnome-session gdm3

# install nomachine for remote desktop
sudo apt-get install build-essential
wget https://developer.download.nvidia.com/compute/cuda/11.7.0/local_installers/cuda_11.7.0_515.43.04_linux.run
sudo sh cuda_11.7.0_515.43.04_linux.run
rm cuda_11.7.0_515.43.04_linux.run

wget https://download.nomachine.com/download/7.9/Linux/nomachine_7.9.2_1_amd64.deb
apt install ./nomachine_7.9.2_1_amd64.deb
rm nomachine_7.9.2_1_amd64.deb

snap install blender --classic
# sudo apt install firefox
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb
apt install unzip
apt -y install python3.10-venv
apt install -y dolphin

sudo reboot