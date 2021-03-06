#!/bin/bash
cd /root
git clone https://github.com/CouchPotato/CouchPotatoServer.git &>/dev/null
git clone https://github.com/SickRage/SickRage.git &>/dev/null
cp -f /remount.sh /root/remount.sh
mkdir -p /root/acd
#/root/remount.sh &>/dev/null|| { echo "ERROR : Could not mount ACD. Make sure your volume has .cache/acd/oauth_data file" ; exit 1; }
/root/remount.sh
mkdir -p /root/acd/temp
mkdir -p /root/acd/Shows
mkdir -p /root/acd/Movies
mkdir -p /root/.cache/acd_cli/
mkdir -p /root/.couchpotato
mkdir -p /root/.config/deluge
cp -n /couchpotato_settings.conf /root/.couchpotato/settings.conf
cp -n /sickrage_config.ini /root/SickRage/config.ini
cp -n /deluge_config.conf /root/.config/deluge/core.conf
mkdir -p /root/downloads/completed
mkdir -p /root/downloads/incomplete
mkdir -p /root/downloads/torrents
ln -s /root/acd/temp ~/downloads/Shows &>/dev/null
ln -s /root/acd/Movies ~/downloads/Movies  &>/dev/null
cp -f /startDownloadSuite.sh /root/startDownloadSuite.sh
test -f /root/SickRage/_init || cp  -f /sickrage_config.ini ~/SickRage/config.ini
touch /root/SickRage/_init
echo "Init completed"
