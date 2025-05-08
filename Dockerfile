FROM debian:latest

RUN apt-get update && apt-get install -y \
    cgit \
    spawn-fcgi \
    fcgiwrap \
    nginx \
    git \
    python3-markdown \
    && rm -rf /var/lib/apt/lists/*

RUN rm -rf /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default

COPY cgit.conf /etc/nginx/conf.d/cgit.conf

EXPOSE 80

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
