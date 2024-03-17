#!/bin/bash
clear
echo "Staging Domain:"
read domain
mkdir -p $domain
platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
   sudo apt install -y shc > /dev/null
   sudo apt install -y unzip > /dev/null
   sudo apt install -y zip > /dev/null
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='macosx'
   brew install shc
fi
echo "Installing LightWeb in $platform ..."
echo "____________________________________"
echo " Downloading LightWeb ...      | ⬇️ |"
wget -q https://github.com/ruvenss/lightweb/archive/refs/tags/3.0.0.zip -O "lightweb.zip" && unzip -qq ./"lightweb.zip" && rm ./"lightweb.zip"
echo " Unzipping LightWeb ...        | 🗜️ |"
echo " Deploying at $domain          | ⬆️ |"
sudo cp -aRf lightweb-3.0.0/. $domain
sudo mr -rf lightweb-3.0.0
echo " Installing LightWeb ...       | ✅ |"
chmod 777 $domain
sudo shc -f $domain/lightweb/ToProduction.sh $domain/lightweb/ToProduction
sudo rm -f $domain/lightweb/ToProduction.sh
