# Installation Log

Every command has been executed logged as _administrator_ user.

We refer to _administrator_ HOME when ~ appears in commands and scripts.

The Post Installation log includes also the file
> Post installation - Part Two.md

---

## System commands
Creating home directory for user _administrator_

Adding .bash_aliases for user _administrator_

Adding aliases for _administrator_
> alias la='ls -la'
> alias ll='ls -l'

Installing additional net tools
> sudo apt install net-tools

Installing postgres client
> sudo apt install postgresql-client-common
> sudo apt-get install postgresql-client

Reusing SSH keys created for _docker01_
> cd ~
> mkdir .ssh
> chmod 700 .ssh -R
> copy the private and the public key generated in _docker01_

---

## Installing Docker

Installing Docker for Ubuntu
> https://docs.docker.com/engine/install/ubuntu/
---

Installing Docker Compose for Linux
> https://docs.docker.com/compose/install/

---
Executing post install procedures
> https://docs.docker.com/engine/install/linux-postinstall/

Detail: Add users to the docker group.
> sudo usermod -aG docker administrator;
> sudo usermod -aG docker geronimo_24;
> sudo usermod -aG docker geronimo_16;
> sudo usermod -aG docker geronimo_22;
---

## Configuring Docker volumes

The mount point used for Docker volumes has been located in _/Docker_ folder.

Creating folder for postgres 13 test & production docker volume as root:root
> mkdir /Docker/pg13test
>   data files folder for Postgres 13 TEST
> mkdir /Docker/pg13
>   data files folder for Postgres 13 PRODUCTION
> mkdir /Docker/pg13-preinit
>   script folder for bash script
> mkdir /Docker/pg13-init
>   script folder for bash and sql script
> mkdir /Docker/pg13conf
> mkdir /Docker/pg13conf/conf.d
>   script folder for configuration files

set chmod per Docker volume folders (Bitnami image runs as non-root user uid 1001)
> sudo chown 1001:docker /Docker/pg13test -R
> sudo chown 1001:docker /Docker/pg13 -R
> sudo chown 1001:docker /Docker/pg13-preinit -R
> sudo chown 1001:docker /Docker/pg13-init -R
> sudo chown 1001:docker /Docker/pg13conf -R

set permissions for Docker volume folders
> sudo chmod 777 /Docker -R
---

## Cloning Docker Scripts GIT repository

cloning GIT repository in _administrator_ HOME folder, a new folder _docker-scripts_ is created
> cd ~
> git clone git@github.com:cla-operation/docker-script.git docker-scripts
---

## Installing PostgreSQL 13 Client

Adding Postgres public key
> wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

Adding PostgreSQL 13 Repository
> echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/postgresql-pgdg.list > /dev/null

Refreshing apt metadata
> sudo apt update

Updating postgres packages
> sudo apt list --upgradable;
> sudo apt upgrade;
---

## Initializing the TEST container for PostgreSQL 13

From the folder 
> ~/docker-scripts/script/postgres-common-scripts

Copy in the folder /Docker/pg13-preinit the files:
> 000-create-folder-for-tablespaces.sh

Copy in the folder /Docker/pg13-init the files
> 010-create-tablespaces.sql
> 020-create-roles.sql

From the folder 
> ~/docker-scripts/script/cladb80/pg13conf/conf.d

Copy in the folder /Docker/pg13conf/conf.d the files:
> pgtune.conf

Set chmod per Docker volume folders (Bitnami image runs as non-root user uid 1001)
> sudo chown 1001:docker /Docker/pg13-preinit -R
> sudo chown 1001:docker /Docker/pg13-init -R
> sudo chown 1001:docker /Docker/pg13conf -R
---

change directory to
> ~/docker-scripts/script/postgres-13

execute the Docker Compose command to initialize the PostgresSQL 13 TEST
> docker-compose -f docker-compose-pg13test.yml -p pg13test up -d

or rebuild it
> docker-compose -f docker-compose-pg13test.yml -p pg13test up -d --no-deps --build

in case of success a new container labelled as _pg13test_ should be up and running

---

## Initializing the PRODUCTION container for PostgreSQL 13

From the folder 
> ~/docker-scripts/script/postgres-common-scripts

Copy in the folder /Docker/pg13-preinit the files:
> 000-create-folder-for-tablespaces.sh

Copy in the folder /Docker/pg13-init the files
> 010-create-tablespaces.sql
> 020-create-roles.sql

From the folder 
> ~/docker-scripts/script/cladb80/pg13conf/conf.d

Copy in the folder /Docker/pg13conf/conf.d the files:
> pgtune.conf

Set chmod per Docker volume folders (Bitnami image runs as non-root user uid 1001)
> sudo chown 1001:docker /Docker/pg13-preinit -R
> sudo chown 1001:docker /Docker/pg13-init -R
> sudo chown 1001:docker /Docker/pg13conf -R
---

change directory to
> ~/docker-scripts/script/postgres-13

execute the Docker Compose command to initialize the PostgresSQL 13 TEST
> docker-compose -f docker-compose-pg13.yml -p pg13 up -d 

or rebuild it
> docker-compose -f docker-compose-pg13.yml -p pg13 up -d --no-deps --build

in case of success a new container labelled as _pg13_ should be up and running

---

## Initializing the container for PostgreSQL 9

This section includes all the commands and settings to produce a PostgreSQL container with 9.6 version and to perform comparison tests with PostgreSQL 13

The mount point used for Docker volumes has been located in _/Docker_ folder.

Creating folder for postgres 9
> mkdir /Docker/pg9
>   data files folder for Postgres 9
> mkdir /Docker/pg9script
> mkdir /Docker/pg9script/init
> mkdir /Docker/pg9script/preinit
> mkdir /Docker/pg9script/conf
> mkdir /Docker/pg9script/conf/conf.d
>   script folder for Postgres 9

set chmod per Docker volume folders (Bitnami image runs as non-root user uid 1001)
> sudo chown 1001:docker /Docker/pg9 -R
> sudo chown 1001:docker /Docker/pg9script -R

set permissions for Docker volume folders
> sudo chmod 777 /Docker -R
---

From the folder 
> ~/docker-scripts/script/postgres-common-scripts

Copy in the folder /Docker/pg9script/preinit the files:
> 000-create-folder-for-tablespaces.sh

Copy in the folder /Docker/pg9script/init the files
> 010-create-tablespaces.sql
> 020-create-roles.sql

Set chmod per Docker volume folders (Bitnami image runs as non-root user uid 1001)
> sudo chown 1001:docker /Docker/pg9script -R
---

From the folder
> ~/dockr-scripts/script/cladb80/pg9

Copy in the folder /Docker/pg9script/conf/conf.d the files:
> postgresql.auto.conf

Set chmod
> sudo chown 1001:docker /Docker/pg9script -R
---

change directory to
> ~/docker-scripts/script/postgres-9.6-debian

execute the Docker Compose command to initialize the PostgresSQL 13 TEST
> docker-compose -f docker-compose-pg9.yml -p pg9 up -d 

in case of success a new container labelled as _pg9_ should be up and running


