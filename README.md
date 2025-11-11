# Hashtopolis + SWAG (ARM64)
Link to the original project is below
https://github.com/hashtopolis

# Installation
Edit the `docker-compose.yml` file before running the command below

Run SWAG to create config files inside the directory that it binds to
```bash
docker compose up swag -d; sleep 10; docker compose stop swag
```

Then just build the images using the script below
```bash
./build-images.sh
```

# Running Hashtopolis
Just run teh `docker compose up -d` command

If you decide to use `dns` verification, make sure you add your DNS API keys to the .ini file of your provider inside `./swag/config/dns-conf/`
