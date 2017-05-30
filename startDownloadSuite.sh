#!/bin/bash
python /root/CouchPotatoServer/CouchPotato.py --daemon
python /root/SickRage/SickBeard.py --nolaunch --daemon
/usr/bin/deluged -d &
/usr/bin/deluge-web -p 8080 &
exec /bin/bash
