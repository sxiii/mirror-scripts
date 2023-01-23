#!/bin/bash
sudo docker build -t nginx .
sudo docker run -it -p "80:80/tcp" -p "443:443/tcp" -v /etc/letsencrypt/:/etc/letsencrypt/ -v /srv/http/:/srv/http/ nginx
