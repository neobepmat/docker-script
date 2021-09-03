# Installation Log

Every command has been executed logged as _administrator_ user

---

Creating home directory for user _administrator_

Adding .bash_aliases for user _administrator_

Adding aliases for _administrator_
> alias la='ls -la'
> alias ll='ls -l'
---

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

creating a folder in /home to clone GIT repositories with docker scripts
> /home/docker-scripts
---

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
>   script folder for postgresql.conf

set chmod per Docker volume folders (Bitnami image runs as non-root user uid 1001)
> sudo chown 1001:docker /Docker/pg13test -R
> sudo chown 1001:docker /Docker/pg13 -R
> sudo chown 1001:docker /Docker/pg13-preinit -R
> sudo chown 1001:docker /Docker/pg13-init -R
> sudo chown 1001:docker /Docker/pg13conf -R

set permissions for Docker volume folders
> sudo chmod 777 /Docker -R
---

Installing additional net tools
> sudo apt install net-tools
---

Installing postgres client
> sudo apt install postgresql-client-common
> sudo apt-get install postgresql-client
---

> reusing SSH keys created for _docker01_
---

cloning GIT repository
> cd /home/docker-scripts
> git clone git@github.com:cla-operation/docker-script.git docker-scripts
---

Installing PostgreSQL 13 TEST on Docker
> please refer to scripts in %gitrepo%/script/postgres-13

From the home folder where GIT repo has been cloned you should have the folder
```
%gitrepo%/script/postgres-13
```

Copy in the folder /Docker/pg13script the files:
> 000-create-folder-for-tablespaces.sh
> 010-create-tablespaces.sql
> 020-create-roles.sql

Change user:group for the files in the folder /Docker/pg13script
> sudo chown 1001:docker 0*

in the folder
> /Docker/pg13script

execute the Docker Compose command
> docker-compose -f docker-compose-pg13test.yml up -d

in case of success a new container labelled as _pg13test_ should be up and running

