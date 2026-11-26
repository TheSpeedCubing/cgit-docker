FROM alpine:latest

RUN apk add --no-cache \
    lighttpd \
    cgit \
    mailcap \
    python3 \
    py3-markdown \
    py3-pygments

RUN mkdir -p /srv/git/ \
 && mkdir -p /var/cache/cgit \
 && chown lighttpd:lighttpd /var/cache/cgit

COPY lighttpd.cgit.conf /etc/lighttpd/
COPY --chmod=755 entrypoint.sh /usr/local/bin/entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.cgit.conf"]
