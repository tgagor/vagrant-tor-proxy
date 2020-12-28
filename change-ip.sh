#!/bin/sh

# (echo authenticate '""'; echo signal newnym; echo quit) | nc localhost 9051

docker exec -ti vagrant-tor-proxy_tor_1 sh -c '(echo authenticate '""'; echo signal newnym; echo quit) | nc localhost 9051'
