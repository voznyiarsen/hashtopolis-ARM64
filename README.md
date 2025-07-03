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
   buildx-setup.sh && \
   cp env.example .env && \
   mkdir -p certs
   ```
   and edit the `.env` file to your liking, don't forget to copy your certificates to the `certs` folder
2. Run
   ```
   hashtopolis-container-setup.sh && /
   docker compose up -d
   ```
   to build and start hashtopolis
