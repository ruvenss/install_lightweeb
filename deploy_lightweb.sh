#!/bin/bash
platform='unknown'
unamestr=$(uname)
sudo clear
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
   sudo apt install -y shc > /dev/null
   sudo apt install -y unzip > /dev/null
   sudo apt install -y zip > /dev/null
   sudo apt install -y apt-get install dialog > /dev/null
   sudo apt install -y dialog > /dev/null
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='macosx'
   brew list shc || brew install shc
   brew list ncurses || brew install ncurses
   brew list dialog || brew install dialog
fi
domain=$(dialog --title 'LightWeb 3.0.0' --inputbox 'Enter your staging domain' 0 0  --output-fd 1)
find 2>/dev/null |while read f;
do
    mkdir -p $domain;
    sleep 1
done|dialog --title "Installing LightWeb in $platform" --gauge "$domain ...." 10 60 0
find 2>/dev/null |while read f;
do
    wget -q https://github.com/ruvenss/lightweb/archive/refs/tags/3.0.0.zip -O "lightweb.zip"
done|dialog --title "Downloading LightWeb ..." --gauge "Please wait ...." 10 60 20
find 2>/dev/null |while read f;
do
    unzip -qq ./"lightweb.zip" && rm ./"lightweb.zip"
    sleep 1
done|dialog --title "Uncompressing LightWeb ..." --gauge "Please wait ...." 10 60 30
find 2>/dev/null |while read f;
do
    sudo cp -aRf lightweb-3.0.0/. $domain
    sudo rm -rf lightweb-3.0.0
    chmod 777 $domain
    sleep 1
done|dialog --title "Installing LightWeb ..." --gauge "Please wait ...." 10 60 40
find 2>/dev/null |while read f;
do
    sudo shc -f $domain/lightweb/ToProduction.sh $domain/lightweb/ToProduction
    sudo rm -f $domain/lightweb/ToProduction.sh
    sudo rm -f $domain/lightweb/ToProduction.sh.x.c
    sudo rm -f $domain/lightweb/ToProduction.sh.x
    sleep 1
done|dialog --title "Compiling LightWeb ..." --gauge "Please wait ...." 10 60 60
find 2>/dev/null |while read f;
do
    sudo rm -f $domain/.gitignore
    sleep 1
done|dialog --title "Grooming LightWeb ..." --gauge "Please wait ...." 10 60 90
dialog --msgbox "Your LightWeb is ready to use" 0 0