# Post installation

https://docs.docker.com/engine/install/linux-postinstall/

- Create the docker group.

> sudo groupadd docker

- Add your user to the docker group.

> sudo usermod -aG docker giuseppe.grilli@cla.cl-grp.local
> sudo usermod -aG docker massimo.rezoalli@cl2001.cl-grp.local

- creating a folder in /home to clone GIT repositories with docker scripts
> /home/docker-scripts

- creating GITHUB account
> usr:      cla-operation
> pwd:      PinocchioELaFatina
> email:    operations.github@cl2001.it

- creating SSH keys and configure GIT to use them to retrieve GIT repositories
> follow the instructions within files _github-config/readme-config_ & _github-config/readme-checkout_

- cloning GIT repository
> cd /home/docker-scripts
> git clone git@github.com:cla-operation/docker-script.git docker-scripts

- installing Nexus (Binary Artifacts Repository), creating folder for docker volume
> mkdir /dock/nexus

- set chmod per /dock folder
> sudo chown root:docker /dock -R

- set permissions for /dock folder
> sudo chmod 777 /dock -R

- creating volume folder for Nexus OSS
> mkdir /dock/nexus
 
- running nexus docker
> bash /home/docker-scripts/docker-scripts/scripts/nexus/runNexus.sh

- review of Nexus configuration
```
docker run --restart always --detach --name CLANexus -p 8081:8081 --env-file nexus.env -v /dock/nexus:/nexus-data sonatype/nexus3:latest

-- restart always, in case of shutdown/restart of Docker Engine or the Ubuntu server, the container is restarted
--detach, after the container has been started the control returns immediately to the console
--name CLANexus, name of the container
-p 8081:8081, mapping between Host port and Container port (-p <host tcp port>:<container tcp port>)
--env-file nexus.env, the file <nexus.env> is loaded and environmente variables are set according to the container needs
-v <host path>:<container path>, an external path is configured and mapped to an internal path within the container
```

- checking running containers
> docker ps -a

- checking docker logs
> docker logs <Container Id>

- inspecting docker configuration
> docker inspect <Container Id> 

- change admin password
> usr: admin
> pwd: password

- NEXUS OSS configuration
> adding user giuseppe.grilli
> pwd: password
> 
> adding new role: nx-develop
> to add api-key, to view everyting on website
> 
> generating new api-key for giuseppe.grilli
> 883eb132-10a8-3b98-9235-2c87d4437ee0
> 
> nuget setapikey 883eb132-10a8-3b98-9235-2c87d4437ee0 -source http://docker-01:8081/repository/{repository name}/
> 
> adding user patrick.nani
> pwd: password
> 
> generating new api-key for patrick.nani
> 98a583b5-8f26-3d5d-9218-77ce544bea4e
> 
> nuget setapikey 98a583b5-8f26-3d5d-9218-77ce544bea4e -source http://docker-01:8081/repository/{repository name}/

- Gitlab volume folder creation
> creating folder /dock/gitlab
> sudo chown root:docker gitlab/ -R
> sudo chmod 777 gitlab/ -R

- Gitlab docker container installation
> gitlab/docker run

- Gitlab re-configure URL how to
> https://docs.gitlab.com/omnibus/settings/configuration.html

- Gitlab after 1st installation
> creating password for user "root" (in our case "password")
> changing email for root username

- LDAP configuration
> https://docs.gitlab.com/ee/administration/auth/ldap/
> https://github.com/shamithmc/gitlab-docker/blob/master/doc/settings/ldap.md

The LDAP configuration detailed documentation can be found within the file
> gitlab/LDAP config.md
---

## Configuration update (24-09-2021)

The containers, CLAGitlab & CLANexus have been set to limit the memory usage.

```CLAGitlab memory reservation
--memory=10g \
--memory_reservation=5g \
```

```CLANexus memory reservation
--memory=6g \
--memory_reservation=4g \
```
---

## Nexus OSS Update (24-09-2021)

The container has been updated to 3.34.0 release