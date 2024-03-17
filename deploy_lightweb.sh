#!/bin/bash
clear
echo "Staging Domain:"
read domain
echo "Installing LightWeb in $platform ..."
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

echo "____________________________________"
echo " Downloading LightWeb ...      | ⬇️ |"
curl "https://github.com/ruvenss/lightweb/archive/refs/heads/master.zip" -o lightweb.zip
echo " Unzipping LightWeb ...        | 🗜️ |"
unzip lightweb.zip
echo " Compiling LightWeb ...        | ⬆️ |"
shc -f lightweb-master/lightweb.sh
echo " Installing LightWeb ...       | ⬆️ |"
sudo mv lightweb-master/lightweb /usr/local/bin