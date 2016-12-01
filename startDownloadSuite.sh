#!/bin/bash
/root/remount.sh
python /root/CouchPotatoServer/CouchPotato.py --daemon
python /root/SickRage/SickBeard.py --nolaunch --daemon
/usr/bin/deluged -d &
/usr/bin/deluge-web -d -p 8080 &
exec /bin/bash
