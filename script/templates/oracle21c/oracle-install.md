# Installation instructions

- get docker image

> docker pull gvenzl/oracle-xe:21-full


- create folder for docker image volume

> mkdir -p /docker/oracle/21c


- running the container
 
> docker run --name oracle-21c -d -p 1521:1521 -e ORACLE_PASSWORD=MangiaGattiConGioia -v /docker/oracle/21c:/opt/oracle/XE21CFULL/oradata gvenzl/oracle-xe:21-full


> https://hub.docker.com/r/gvenzl/oracle-xe


## How to connect

```
IP: 10.0.0.26
Port: 1521
Service: XEPDB1
username: system
pwd: MangiaGattiConGioia
```