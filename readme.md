# Tree structure

This repository collects modifications for docker containers mainly used in CLA Linux environment.
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
- postgres-9.6-alpine, postgres-9.6.21
    + docker container to run Postgres 9.6 in Linux container
- python2-7
    + docker container to run linux image for python 2.7
- ubuntu
    + docker container to run Ubuntu for test purposes

## Special Dockers

The _Nexus_ folder also includes a detailed README on how to configure Nexus, how to Build and Push a Nuget Package and also the required Visual Studio configuration

The _github-config_ folder includes all the required steps to assign a GITHUB account and configure a GIT client with a SSH pair of keys to authenticate git push & pull operations.

The _server-cla_ includes files and notes of post installations steps executed while installing and configuring the Linux Server in CLA organization.
