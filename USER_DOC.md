# User Documentation

## Services

This stack provides the following services:
- A **WordPress** website accessible at `https://magillie.42.fr`
- A **MariaDB** database storing all WordPress data
- An **NGINX** reverse proxy handling HTTPS connections

## Start and Stop

**Start the project:**
```bash
make
```

**Stop the project:**
```bash
make down
```

## Access the Website

- **Website:** `https://magillie.42.fr`
- **Admin panel:** `https://magillie.42.fr/wp-admin`

Accept the SSL certificate warning in your browser (self-signed certificate).

## Credentials

All credentials are stored in:
- `srcs/.env` — environment variables
- `secrets/` — Docker secrets

## Check Services

Check that all containers are running:
```bash
docker ps
```

All three containers (nginx, wordpress, mariadb) should show `Up`.

Check logs for a specific service:
```bash
docker logs nginx
docker logs wordpress
docker logs mariadb
```
