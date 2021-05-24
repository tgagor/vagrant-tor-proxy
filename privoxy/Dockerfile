FROM alpine:3

EXPOSE 8118

ENV TOR_HOST=127.0.0.1
ENV TOR_PORT=9050

RUN apk --no-cache --update add privoxy curl bash && \
    ( \
        cd /etc/privoxy && \
        for f in *.new; \
            do mv $f $(basename $f .new); \
        done \
    ) && \
    sed -i'' 's/127\.0\.0\.1:8118/0\.0\.0\.0:8118/' /etc/privoxy/config && \
# disable logging
    sed -i'' 's/^logfile/# logfile/' /etc/privoxy/config

# https://wiki.archlinux.org/index.php/Privoxy#Ad_Blocking_with_Privoxy
# https://github.com/essandess/adblock2privoxy/tree/master/adblock2privoxy
COPY etc/ /etc/
# curl -fL https://raw.githubusercontent.com/Andrwe/privoxy-blocklist/master/privoxy-blocklist.sh -o /usr/local/bin/privoxy-blocklist.sh && \
COPY usr/ /usr/
RUN chown privoxy:privoxy /etc/privoxy/user.action && \
    chmod +x /usr/local/bin/privoxy-blocklist.sh && \
    /usr/local/bin/privoxy-blocklist.sh

COPY run.sh /usr/local/bin

VOLUME ["/var/log/privoxy"]

USER privoxy
ENTRYPOINT ["/usr/local/bin/run.sh"]
CMD ["--no-daemon", "/etc/privoxy/config"]
