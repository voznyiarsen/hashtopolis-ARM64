#!/usr/bin/env bash
## CERTS
#sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
#sudo certbot certonly --standalone -d domain.org
## CERTS END
git clone https://github.com/hashtopolis/server.git
cd server
cp ../.env .
echo -e "###\n### Building server image\n###"
sudo docker build . -t hashtopolis/backend:latest --platform linux/arm64 --target hashtopolis-server-prod
echo -e "###\n### Server image built\n###"
echo $(sudo docker images)
echo -e "###\n### You can now run (docker compose up -d)\n###"
