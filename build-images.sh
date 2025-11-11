#!/bin/bash
set -e

[ -d "web-ui" ] || git clone https://github.com/hashtopolis/web-ui.git
[ -d "server" ] || git clone https://github.com/hashtopolis/server.git

[ -d "web-ui" ] && (cd web-ui && git pull)
[ -d "server" ] && (cd server && git pull)

echo "### COPYING SWAG SUBDOMAIN CONFIG ###"
mkdir -p ./swag/config/nginx/proxy-confs/
cp hashtopolis.subdomain.conf ./swag/config/nginx/proxy-confs/

echo "### BUILDING WEB-UI ###"
docker build -t hashtopolis/frontend:latest --target hashtopolis-web-ui-prod web-ui
echo "### BUILDING SERVER ###"
docker build -t hashtopolis/backend:latest --target hashtopolis-server-prod server
echo "### OK ###"
