FROM alpine:3

EXPOSE 9150

RUN apk --no-cache --update add tor && \
    chmod 0700 /var/lib/tor

COPY etc/ /etc/

VOLUME ["/var/log/tor", "/var/lib/tor"]
USER tor
CMD ["/usr/bin/tor", "-f", "/etc/tor/torrc"]
