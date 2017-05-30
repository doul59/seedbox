#!/bin/bash
apt-get update
apt-get install -y software-properties-common
add-apt-repository ppa:deluge-team/ppa
apt-get update
apt-get install -y python
apt-get install -y python3
apt-get install -y python3-pip
apt-get install -y curl
apt-get install -y wget
apt-get install -y unzip
apt-get install -y git
apt-get install -y fuse
apt-get install -y nano
apt-get install -y vim
apt-get install -y encfs
apt-get install -y unzip unrar bzip2
debconf-set-selections <<< "postfix postfix/mailname string seedbox"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
apt-get install -y postfix
apt-get install -y procmail
apt-get install deluged -qy
apt-get install deluge-webui -qy
#rclone
cd /root
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip &>/dev/null
unzip rclone-current-linux-amd64.zip &>/dev/null
cd rclone-*-linux-amd64
cp rclone /usr/bin/
chown root:root /usr/bin/rclone
chmod 755 /usr/bin/rclone
mkdir -p /usr/local/share/man/man1
cp rclone.1 /usr/local/share/man/man1/
mandb &>/dev/null
#
wget -P /usr/local/share/ca-certificates/cacert.org http://www.cacert.org/certs/root.crt http://www.cacert.org/certs/class3.crt
update-ca-certificates

