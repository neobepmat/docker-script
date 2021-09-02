# PostgreSQL 13 installation

At the moment of the installation (02-09-2021) the latest released version is
> _PostgreSQL 13_  
> _Current minor_ 13.4_

with a First Release & Final Release dates
> _September 24, 2020  November 13, 2025_

We are going to install the PostgreSQL in a Docker container.

Currently the official Docker images are based on
- alpine (based on Alpine Linux Project, built specifically for use inside of containers) (smaller image footprint)
- buster (based on Debian 10.4, _stable_) (full Linux OS)

We choose the Debian image docker, published from Bitnami
> image: "bitnami/postgresql:13.4.0-debian-10-r19"

## TOC

- docker-compose.yml
    + yaml script for docker compose
