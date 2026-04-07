# Developer Documentation

## Prerequisites

- A Virtual Machine running Debian
- Docker and Docker Compose installed
- Make installed
- Git installed

## Setup from Scratch

### 1. Clone the repository

    git clone git@github.com:MatthieuGillieron/inception.git
    cd inception

### 2. Create the environment file

    vim srcs/.env

Fill in the following variables:

    DOMAIN_NAME=magillie.42.fr
    MYSQL_DATABASE=wordpress
    MYSQL_USER=wpuser
    MYSQL_PASSWORD=yourpassword
    MYSQL_ROOT_PASSWORD=yourrootpassword
    WP_ADMIN_USER=magillie_admin
    WP_ADMIN_PASSWORD=youradminpassword
    WP_ADMIN_EMAIL=magillie@student.42.fr
    WP_USER=magillie
    WP_USER_PASSWORD=youruserpassword
    WP_USER_EMAIL=magillie2@student.42.fr

### 3. Create secrets

    echo "yourpassword" > secrets/db_password.txt
    echo "yourrootpassword" > secrets/db_root_password.txt
    echo "youradminpassword" > secrets/credentials.txt

### 4. Configure /etc/hosts

    sudo vim /etc/hosts

Add this line:

    127.0.0.1 magillie.42.fr

## Build and Launch

    make

This will create the data directories, build all Docker images and start
all containers.

## Useful Commands

    docker ps
    docker logs mariadb
    docker logs wordpress
    docker logs nginx
    docker exec -it mariadb bash
    docker exec -it wordpress bash
    docker exec -it nginx bash
    make re
    make fclean

## Data Persistence

All data is stored on the host VM at:
- /home/magillie/data/db — MariaDB database files
- /home/magillie/data/wordpress — WordPress files

These directories persist even if containers are stopped or removed.

## Project Structure

    inception/
    Makefile
    secrets/
        credentials.txt
        db_password.txt
        db_root_password.txt
    srcs/
        .env
        docker-compose.yml
        requirements/
            mariadb/
                Dockerfile
                conf/50-server.cnf
                tools/init.sh
            nginx/
                Dockerfile
                conf/nginx.conf
            wordpress/
                Dockerfile
                conf/www.conf
                tools/init.sh
