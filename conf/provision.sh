#!/bin/bash

# fix for bug: stdin: is not a tty
# https://github.com/mitchellh/vagrant/issues/1673
sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile

echo "deb http://deb.torproject.org/torproject.org trusty main" > /etc/apt/sources.list.d/tor.list

gpg --keyserver keys.gnupg.net --recv 886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -

apt-get update
apt-get dist-upgrade -y
apt-get autoremove -y

apt-get install -y docker-ce docker-ce-cli containerd.io
apt-get clean

curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

service docker restart
