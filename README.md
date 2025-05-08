# cgit-docker

This project provides a simple Docker setup for running CGit with Nginx.

## How to (As a User)

1. Create the docker-compose.yml:

```yaml
services:
  cgit:
    image: ghcr.io/thespeedcubing/cgit-nginx
    container_name: cgit
    ports:
      - "80:80"
```

2. Start the container:

```bash
sudo docker compose up -d
```

### /etc/cgitrc

default
```
css=/cgit-css/cgit.css
logo=/cgit-css/cgit.png
favicon=/cgit-css/favicon.ico
```
