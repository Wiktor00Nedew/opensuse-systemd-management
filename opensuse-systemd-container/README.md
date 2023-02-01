# OpenSUSE with systemd

Example docker compose file for running OpenSUSE in Docker container with working systemd.

Image loosely based on [robertdebock/docker-opensuse-systemd](https://github.com/robertdebock/docker-opensuse-systemd).

## Starting

Set your own password for geeko!!!

Consider adjusting custom subnet and IP address.

Consider forwarding port 22 to expose SSHD to outside world. 


Run with:
```bash
docker compose up -d
```

## Features

- Enabled SSHD serwer
- Working sudo
- geeko user with passwordless sudo 
- Preconfigured CPU and memory cap
- Healthcheck makes sure that systemd works
- Custom subnet and IP address
- Persistent volume mounted on ```/data```
