# Tree structure

This repository collects modifications for docker containers mainly used in CLA Linux environment.


## Documentation structure

The folder _script/templates_ includes all the script and command files to deploy docker containers.
Every docker container has its own folder, e.g. _script/templates/nexus_ is used by Nexus OSS.

The _script/templates/cla-installations_ includes files and notes of post installations steps executed while installing and configuring the Linux Server in CLA organization.

The _script/templates/cla-installations/cladb80_ includes files and notes of post installations steps executed while installing and configuring the _CLADB80_ database server:
- Postgres 13 Test and Production
- Postgres 9 Test
- Sql Server 2019 Express Test

The folder _script/templates/cla-installations/cla-topology_ contains files to show via picture the topology of CLA services.


## Template Docker list

Every folder of _script/templates_ represents a different image/container, hereunder the list of the available configurations:

- alpine
    + docker container to use alpine linux distribution
- baget
    + Nuget Server
- docker-net-tests
    + go container and go snippet for perf tests
- kubernetes
    + minikube installation with readme and legenda
- gitlab
    + compose for Gitlab installation, based on Gitlab Community Edition
- liget
    + docker run for Nuget server fork of Baget
- nexus
    + docker run for Binary Artifacts Repository (Nuget-Rpm-Npm etc..)
- oracle-XE-alpine
    + Instructions for docker container based on Oracle XE11 complete with SQL DDL to create tablespaces, users and special configuration to be used with SharpPlant Builder
- postgres-13
    + docker compose Postgres 13 based on Debian 
- postgres-9.6-alpine
    + docker container for Postgres 9.6 based on Alpine
- postgres-9.6-debian
    + docker compose for Postgres 9.6 in Linux Debian 10.9 container
- postgres-common-scripts
    + bash scripts, sql scripts useful for docker postgres containers
- python2-7
    + docker container to run linux image for python 2.7
- postgres13-pgbouncer
    + template for postgres 13 and pgbouncer
- sqlserver-linux
    + instructions to configure and install a Docker container for Sql Server 2019 / 2017 Express Edition
- svn-server
    + lightweight SVN Server based on Apache Subversion
- teamcity
    + templates for teamcity installation
- teamcity-agent
    + docker run for Teamcity Agent, Windows
- teamcity-postgres
    + templates for teamcity-postgres-trafik installation
- ubuntu
    + docker container to run Ubuntu for test purposes

## Local and CLA installation folders

Hereunder the list of special folders containing script customization for local and remote installations.

- _script/local-installations_
    + Windows 10 - WSL 2 / Docker Desktop installations
- _script/cla-installations_
    + docker installations on cla environment
- _script/common-bin_
    + common bin files useful for docker/dockerfile customizations


## Special Dockers

The _script/templates/Nexus_ folder also includes a detailed README on how to configure Nexus, how to Build and Push a Nuget Package and also the required Visual Studio configuration

The _script/templates/github-config_ folder includes all the required steps to assign a GITHUB account and configure a GIT client with a SSH pair of keys to authenticate git push & pull operations.

