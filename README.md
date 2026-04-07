*This project has been created as part of the 42 curriculum by magillie.*

# Inception

## Description

This project consists of setting up a small infrastructure composed of different services using Docker and Docker Compose, running inside a Virtual Machine. The goal is to deepen knowledge of system administration and containerization.

The stack includes:
- **NGINX** with TLSv1.2/TLSv1.3 — the only entry point (port 443)
- **WordPress + php-fpm** — the web application
- **MariaDB** — the database

## Instructions

### Requirements
- Docker and Docker Compose installed
- A Virtual Machine (Debian recommended)
- Make

### Installation
```bash
git clone git@github.com:MatthieuGillieron/inception.git
cd inception
make
```

The site will be available at: `https://magillie.42.fr`

### Commands

| Command | Description |
|---------|-------------|
| `make` | Build and start all containers |
| `make down` | Stop all containers |
| `make re` | Restart everything |
| `make clean` | Stop and remove volumes |
| `make fclean` | Full clean including data |

## Project Description

### Virtual Machines vs Docker
A VM emulates an entire OS with its own kernel. Docker shares the host kernel and isolates processes using namespaces and cgroups — much lighter and faster.

### Secrets vs Environment Variables
Environment variables are visible via `docker inspect`. Docker secrets are mounted as files in `/run/secrets/` inside the container, never exposed in logs or inspect output.

### Docker Network vs Host Network
Host network shares the host's network stack — no isolation. Docker network creates an isolated virtual network between containers, which is safer and required by this project.

### Docker Volumes vs Bind Mounts
Bind mounts link a specific host path to a container. Named volumes are managed by Docker and more portable. This project uses named volumes with a specific host path for data persistence.

## Resources

- [Docker documentation](https://docs.docker.com)
- [NGINX documentation](https://nginx.org/en/docs/)
- [WordPress CLI](https://wp-cli.org)
- [MariaDB documentation](https://mariadb.com/kb/en/)

### AI Usage
Claude (Anthropic) was used to:
- Make this readme
- Review code.
