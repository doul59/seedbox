#!/bin/bash
/root/remount.sh
python /root/CouchPotatoServer/CouchPotato.py --daemon
python /root/SickRage/SickBeard.py --nolaunch --daemon
/etc/init.d/deluged start
/etc/init.d/deluge-web start
exec /bin/bash
