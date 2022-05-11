#!/bin/bash
synthetic(){
   git clone https://github.com/rogerdel/img-downloader
   cd img-downloader
   python3 -m venv env
   source env/bin/activate
   pip install -r requirements.txt
   # python3 main.py
   deactivate
   cd ..

   git clone https://github.com/rogerdel/synthetic-dataset-blender
   cd synthetic-dataset-blender
   wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1irFeuTRgcPoaFrnb8yODG0iovCvu11ym' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1irFeuTRgcPoaFrnb8yODG0iovCvu11ym" -O start_1.blend && rm -rf /tmp/cookies.txt
   cd ..

}

syntethic_hdri(){
   git clone https://github.com/rogerdel/hdri-downloader
   cd hdri-downloader
   wget https://chromedriver.storage.googleapis.com/101.0.4951.41/chromedriver_linux64.zip
   unzip -q chromedriver_linux64.zip
   rm chromedriver_linux64.zip
   sudo mv chromedriver /usr/local/bin
   exportPATH=PATH:/usr/local/bin/chromedriver
   mkdir downloads
   python3 -m venv env
   source env/bin/activate
   pip install -r requirements.txt
   # python3 main.py
   deactivate
   cd ..

   git clone https://github.com/rogerdel/synthetic-dataset-blender-hdri
   cd synthetic-dataset-blender-hdri
   wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1_bcVOvTdThZLmH3XISzo2tWIWz2Fs-Na' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1_bcVOvTdThZLmH3XISzo2tWIWz2Fs-Na" -O syntethic_hdri.blend && rm -rf /tmp/cookies.txt
   cd ..
}



pswd=$1
type=$2

if [ -z "$pswd" ] || [ -z "$type" ];then
   echo "insert two paremeters: password and type(1:sytntethic or 2:synthetic hdri)"
   exit 1
fi

if [ "$type" -gt 2 ] || [ "$type" -lt 1 ]
   then
   echo "second parameter type( 1: sytntethic or 2 : synthetic hdri)"
   exit 1
fi


echo $pswd |sudo -S echo


if sudo -n true 2>/dev/null; then
    echo ""
else
    echo "Wrong password"
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive

echo $pswd | sudo -S apt update && apt upgrade -y
echo $pswd | sudo -S apt -y install ubuntu-mate-desktop

# install nomachine for remote desktop
wget https://download.nomachine.com/download/7.9/Linux/nomachine_7.9.2_1_amd64.deb
echo $pswd |sudo -S apt install ./nomachine_7.9.2_1_amd64.deb
rm nomachine_7.9.2_1_amd64.deb

echo $pswd | sudo -S snap install blender --classic
# sudo apt install firefox
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
echo $pswd |sudo -S apt install ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb
echo $pswd | sudo -S apt install unzipeb
echo $pswd | sudo -S apt -y install python3.10-venv

# git set up
mkdir Desktop
cd Desktop

if [ $type == 1 ]
then 
   echo 'Synthetic'
   synthetic
else
   echo 'hdri'
   syntethic_hdri
fi

sudo reboot