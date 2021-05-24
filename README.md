vagrant-tor-proxy
=================

[![build](https://github.com/tgagor/vagrant-tor-proxy/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/tgagor/vagrant-tor-proxy/actions/workflows/build.yml)

From time to time I need to hide myself behind the proxy, for privacy or just to have possibility to change IPs/countries frequently. Tor exports only SOCKS5 proxy, which is sufficient for browser, but not convenient when you need HTTP proxy (like for Python scripts). That's why I build this composition of Tor + Privoxy. Initial release used Vagrant, but it was quite heavy. With new possibilities given by Docker and Docker Compose, it's much faster and lightweight to start whole stack

Both Vagrant and Docker Compose configs base on Alpine Linux.

# How to run?

With Vagrant:

```bash
vagrant up
```

With Docker Compose:

```bash
docker-compose up -d
```

# Configuration

* to access tor SOCKS5 proxy use localhost:9050
* to access privoxy HTTP proxy use localhost:8118

# Clean up

With Vagrant:

```bash
vagrant destroy -f
```

With Docker Compose:

```bash
docker-compose down
```
