#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

git clone https://github.com/hashtopolis/web-ui.git
git clone https://github.com/hashtopolis/server.git

echo "### Fixing dogshit compatablility... ###"
cp $SCRIPT_DIR/Dockerfile-webui $SCRIPT_DIR/web-ui/Dockerfile

echo "### Building... ###"
cd $SCRIPT_DIR/web-ui
docker buildx build \
  --platform linux/arm64 \
  -t hashtopolis/frontend:latest \
  --target hashtopolis-web-ui-prod \
  --load \
  .
echo "### web-ui build done ###"

#
echo "### Setting up SSL for hashtopolis/server... ###"
# Certbot/Self-Signed certs
cp $SCRIPT_DIR/certs/*.pem $SCRIPT_DIR/server

# SSL Sites configs
cp $SCRIPT_DIR/sites/* $SCRIPT_DIR/server

# use diffs instead actually
echo "### Copied Dockerfile ####"
cp $SCRIPT_DIR/Dockerfile-server $SCRIPT_DIR/server/Dockerfile
echo "### Files copied ###"

# Building
cd $SCRIPT_DIR/server

docker buildx build \
  --platform linux/arm64 \
  -t hashtopolis/backend:latest \
  --target hashtopolis-server-prod \
  --load \
  .
echo "### server build done ###"

cd $SCRIPT_DIR

echo "### BACKEND ###"
docker images hashtopolis/backend
echo "### FRONTEND ###"
docker images hashtopolis/frontend
# certs here

