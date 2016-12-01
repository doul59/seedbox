#!/bin/bash
#adduser --disabled-password --system --home /var/lib/deluge --gecos "Deluge service" --group deluge
#touch /var/log/deluged.log && touch /var/log/deluge-web.log && chown deluge:deluge /var/log/deluge*
cd /root
git clone https://github.com/CouchPotato/CouchPotatoServer.git &>/dev/null
git clone https://github.com/SickRage/SickRage.git &>/dev/null
cp -f /remount.sh /root/remount.sh
mkdir -p /root/acd
/root/remount.sh &>/dev/null|| { echo "ERROR : Could not mount ACD. Make sure your volume has .cache/acd/oauth_data file" ; exit 1; }
mkdir -p /root/acd/temp
mkdir -p /root/acd/Shows
mkdir -p /root/acd/Movies
mkdir -p /root/.cache/acd_cli/
#cp -n /deluged.service /etc/systemd/system/deluged.service
#systemctl enable /etc/systemd/system/deluged.service
#systemctl start deluged
#systemctl status deluged
#cp -n /deluge-web.service /etc/systemd/system/deluge-web.service
#systemctl enable /etc/systemd/system/deluge-web.service
#systemctl start deluge-web
#systemctl status deluge-web
mkdir -p /root/.couchpotato
cp -n /couchpotato_settings.conf /root/.couchpotato/settings.conf
cp -n /sickrage_config.ini /root/SickRage/config.ini
mkdir -p /root/downloads/completed
mkdir -p /root/downloads/incomplete
mkdir -p /root/downloads/torrents
ln -s /root/acd/temp ~/downloads/Shows &>/dev/null
ln -s /root/acd/Movies ~/downloads/Movies  &>/dev/null
cp -f /startDownloadSuite.sh /root/startDownloadSuite.sh
test -f /root/SickRage/_init || cp  -f /sickrage_config.ini ~/SickRage/config.ini
touch /root/SickRage/_init
echo "Init completed"
