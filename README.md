# Hashtopolis ARM64 Port

A <a href="https://github.com/hashtopolis">hashtopolis</a> port with SSL and a simple instalation
---

## Prerequisites

1. **docker with buildx and compose**
2. **SSL certificates (3rd party verified or self-signed)**
---

## Instalation
1. Run
   ```
   buildx-setup.sh; wget https://raw.githubusercontent.com/hashtopolis/server/master/env.example -O .env``` and edit to your liking
3. Run ```
   mkdir -p certs
   ```
   to create a folder for your certificates and place your SSL certificates inside
5. Run ```hashtopolis-container-setup.sh``` to pull and build the docker images
6. Run ```docker compose up -d``` to start hashtopolis
