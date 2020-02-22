#!/bin/sh

# enable forwarding to tor server
echo "forward-socks5t / ${TOR_HOST}:${TOR_PORT} ." >> /etc/privoxy/config

cat << EOF >> /etc/privoxy/user.action
{+block-as-image{Facebook "like" and similar tracking URLs.}}
www.facebook.com/(extern|plugins)/(login_status|like(box)?|activity|fan)\.php
platform.twitter.com/widgets/follow_button?
plusone.google.com
EOF

exec privoxy $@
