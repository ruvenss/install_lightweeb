#!/bin/bash
platform='unknown'
unamestr=$(uname)
sudo clear
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
   echo "$platform OS Detected. Installing LightWeb for Debian like Distros"
   sudo apt update
   sudo apt upgrade -y
   clear
   sudo apt install -y shc 
   clear
   sudo apt install -y unzip
   clear
   sudo apt install -y zip
   clear
   sudo apt install -y dialog
   clear
   domain=$(dialog --title 'LightWeb 3.0.0' --inputbox 'Enter your staging domain' 0 0  --output-fd 1)
    mkdir -p $domain;
    echo -ne '#                         (  0%)\r'
    sleep 1
    wget -q https://github.com/ruvenss/lightweb/archive/refs/tags/3.0.0.zip -O "lightweb.zip"
    echo -ne '#####                     ( 20%)\r'
    sleep 1
    unzip -qq ./"lightweb.zip" && rm ./"lightweb.zip"
    echo -ne '###########               ( 40%)\r'
    sleep 1
    sudo cp -aRf lightweb-3.0.0/. $domain
    sudo rm -rf lightweb-3.0.0
    chmod 777 $domain
    echo -ne '#################         ( 60%)\r'
    sleep 1
    sudo shc -f $domain/lightweb/ToProduction.sh $domain/lightweb/ToProduction
    sudo rm -f $domain/lightweb/ToProduction.sh
    sudo rm -f $domain/lightweb/ToProduction.sh.x.c
    sudo rm -f $domain/lightweb/ToProduction.sh.x
    echo -ne '#######################   ( 90%)\r'
    sleep 1
    sudo rm -f $domain/.gitignore
    sudo chown -R www-data:www-data $domain
    echo -ne '##########################(100%)\r'
    sleep 1
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
  
   platform='macosx'
   brew list shc || brew install shc
   brew list ncurses || brew install ncurses
   brew list dialog || brew install dialog
   clear
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
        sudo chown -R www-data:www-data $domain
        sleep 1
    done|dialog --title "Grooming LightWeb ..." --gauge "Please wait ...." 10 60 90

fi
dialog --msgbox "Your LightWeb is ready to use at https://$domain" 0 0
cd $domain
cd lightweb
mv config_sample.php config.php
chown www-data:www-data config.php
clear
nano config.php