#!/bin/bash

# fix for bug: stdin: is not a tty
# https://github.com/mitchellh/vagrant/issues/1673
sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile

# update source to something geolocalized
cat > /etc/apt/sources.list <<SRC
deb http://http.debian.net/debian jessie main contrib non-free 
deb-src http://http.debian.net/debian jessie main contrib non-free 

deb http://security.debian.org/ jessie/updates main contrib non-free 
deb-src http://security.debian.org/ jessie/updates main contrib non-free 

# jessie-updates, previously known as 'volatile'
deb http://http.debian.net/debian jessie-updates main contrib non-free 
deb-src http://http.debian.net/debian jessie-updates main contrib non-free 

# jessie-backports, previously on backports.debian.org
deb http://http.debian.net/debian jessie-backports main contrib non-free 
deb-src http://http.debian.net/debian jessie-backports main contrib non-free
SRC

echo "deb http://deb.torproject.org/torproject.org jessie main" > /etc/apt/sources.list.d/tor.list

gpg --keyserver keys.gnupg.net --recv 886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -

apt-get update
apt-get dist-upgrade -y

apt-get install -y deb.torproject.org-keyring
apt-get install -y tor
apt-get install -y privoxy
apt-get clean

cp -av /vagrant/tor/* /etc/tor/
cp -av /vagrant/privoxy/* /etc/privoxy/

service tor restart
service privoxy restart