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
domain=$(dialog --title 'LightWeb 3.0.0' --inputbox 'Enter your staging domain' 25 25  --output-fd 1)
mkdir -p $domain
echo "Installing LightWeb in $platform ..."
echo "____________________________________"
echo " Downloading LightWeb ...      | ⬇️ |"
wget -q https://github.com/ruvenss/lightweb/archive/refs/tags/3.0.0.zip -O "lightweb.zip" && unzip -qq ./"lightweb.zip" && rm ./"lightweb.zip"
echo " Unzipping LightWeb ...        | 🗜️ |"
echo " Deploying at $domain          | ⬆️ |"
sudo cp -aRf lightweb-3.0.0/. $domain
sudo rm -rf lightweb-3.0.0
echo " Installing LightWeb ...       | ✅ |"
chmod 777 $domain
sudo shc -f $domain/lightweb/ToProduction.sh $domain/lightweb/ToProduction
sudo rm -f $domain/lightweb/ToProduction.sh
sudo rm -f $domain/lightweb/ToProduction.sh.x.c
sudo rm -f $domain/lightweb/ToProduction.sh.x
sudo rm -f $domain/.gitignore
