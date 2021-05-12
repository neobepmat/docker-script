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

- set permissions for /dock folder
> sudo chmod 777 /dock -R

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
> docker logs <dockerId>

- inspecting docker configuration
> docker inspect <dockerId> 
