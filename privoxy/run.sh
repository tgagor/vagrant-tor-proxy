#!/bin/sh

# enable forwarding to tor server
echo "forward-socks5t   /               ${TOR_HOST}:${TOR_PORT} ." >> /etc/privoxy/config

exec privoxy $@
