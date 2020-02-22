FROM alpine:3

EXPOSE 8118

ENV TOR_HOST=127.0.0.1
ENV TOR_PORT=9050

# https://github.com/essandess/adblock2privoxy/tree/master/adblock2privoxy

RUN apk --no-cache --update add privoxy && \
    sed -i'' 's/127\.0\.0\.1:8118/0\.0\.0\.0:8118/' /etc/privoxy/config && \
    sed -i'' 's/^logfile/# logfile/' /etc/privoxy/config

COPY run.sh /usr/local/bin

VOLUME ["/var/log/privoxy"]

# USER privoxy
ENTRYPOINT ["/usr/local/bin/run.sh"]
CMD ["--no-daemon", "--user", "privoxy", "/etc/privoxy/config"]
