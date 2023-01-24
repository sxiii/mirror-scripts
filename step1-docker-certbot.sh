#!/bin/bash
sudo docker run -it --rm --name certbot \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            -p "80:80/tcp" \
            certbot/certbot certonly --non-interactive --agree-tos --standalone -m your@email.com --domains your.website.com
