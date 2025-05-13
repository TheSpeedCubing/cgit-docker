FROM alpine:latest

RUN apk add --no-cache \
    lighttpd \
    cgit

RUN mkdir -p /srv/git/

COPY lighttpd.cgit.conf /etc/lighttpd/

EXPOSE 80

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.cgit.conf"]
