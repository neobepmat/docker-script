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
> mkdir /Docker/pg13

set chmod per Docker volume folder
> sudo chown root:docker /Docker -R

set permissions for Docker volum folder
> sudo chmod 777 /Docker -R
---

> reusing SSH keys created for _docker01_
---

cloning GIT repository
> cd /home/docker-scripts
> git clone git@github.com:cla-operation/docker-script.git docker-scripts
---

Installing PostgreSQL 13 TEST on Docker
> please refer to scripts in %gitrepo%/script/postgres-13



