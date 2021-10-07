# Tree structure

This repository collects modifications for docker containers mainly used in CLA Linux environment.


## Documentation structure

The folder _script_ includes all the script and command files to deploy docker containers.
Every docker container has its own folder, e.g. _script/nexus_ is used by Nexus OSS.

The _script/cla-installations_ includes files and notes of post installations steps executed while installing and configuring the Linux Server in CLA organization.

The _script/cla-installations/cladb80_ includes files and notes of post installations steps executed while installing and configuring the _CLADB80_ database server:
- Postgres 13 Test and Production
- Postgres 9 Test
- Sql Server 2019 Express Test

The folder _script/cla-installations/cla-topology_ contains files to show via picture the topology of CLA services.


## Docker list

Every folder represents a different image/container, hereunder the list of the available configurations:

- alpine
    + docker container to use alpine linux distribution
- baget
    + Nuget Server
- gitlab
    + container for Gitlab installation, based on Gitlab Community Edition
- liget
    + Nuget server fork of Baget
- nexus
    + Binary Artifacts Repository, Nuget-Rpm-Npm etc..
- oracle-alpine
    + Instructions for docker container based on Oracle X11 complete with SQL DDL to create tablespaces, users and special configuration to be used with SharpPlant Builder
- postgres-13
    + docker container Postgres 13 on Debian 
- postgres-9.6-alpine, postgres-9.6.21
    + docker container to run Postgres 9.6 in Linux container
- postgres-9.6-debian
    + docker container to run Postgres 9.6 in Linux Debian 10.9 container
- python2-7
    + docker container to run linux image for python 2.7
- sqlserver-linux
    + instructions to configure and install a Docker container for Sql Server 2019 Express Edition
- ubuntu
    + docker container to run Ubuntu for test purposes

## Special Dockers

The _Nexus_ folder also includes a detailed README on how to configure Nexus, how to Build and Push a Nuget Package and also the required Visual Studio configuration

The _github-config_ folder includes all the required steps to assign a GITHUB account and configure a GIT client with a SSH pair of keys to authenticate git push & pull operations.

