#!/usr/bin/env bash
git clone https://github.com/hashtopolis/server.git
cd server
cp ../.env .
echo "##\n## Building server image\n##"
sudo docker build . -t hashtopolis/backend:latest --platform linux/arm64 --target hashtopolis-server-prod
echo -e "##\n## Server image built\n##"
echo $(sudo docker images)
