#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

git clone https://github.com/hashtopolis/web-ui.git
git clone https://github.com/hashtopolis/server.git

echo "### cp $SCRIPT_DIR/Dockerfile-webui $SCRIPT_DIR/web-ui/Dockerfile"
cp $SCRIPT_DIR/Dockerfile-webui $SCRIPT_DIR/web-ui/Dockerfile

echo "### Building WEB-UI..."
cd $SCRIPT_DIR/web-ui
docker buildx build \
  --platform linux/arm64 \
  -t hashtopolis/frontend:latest \
  --target hashtopolis-web-ui-prod \
  --load \
  .
echo "### WEB-UI image built"

echo "### Copying SSL certificates/configs"
# Certbot/Self-Signed certs
cp $SCRIPT_DIR/certs/*.pem $SCRIPT_DIR/server
# SSL Sites configs
cp $SCRIPT_DIR/sites/* $SCRIPT_DIR/server

echo "### cp $SCRIPT_DIR/Dockerfile-server $SCRIPT_DIR/server/Dockerfile"
cp $SCRIPT_DIR/Dockerfile-server $SCRIPT_DIR/server/Dockerfile

echo "### Building SERVER..."
cd $SCRIPT_DIR/server
docker buildx build \
  --platform linux/arm64 \
  -t hashtopolis/backend:latest \
  --target hashtopolis-server-prod \
  --load \
  .
echo "### SERVER image built"

echo "### BACKEND image:"
docker images hashtopolis/backend
echo "### FRONTEND image:"
docker images hashtopolis/frontend
# certs here

