# Oracle Alpine Docker image
Base image to build a container for Oracle XE.

URL for base image:
> https://hub.docker.com/r/cosmomill/alpine-oracle-xe

## Files provided
- dockerfile
- build command
- run command

## Build image
To build image you need to download _Oracle XE for Linux 64bit_ *version 11.2.0-1.0.x86_64*
> https://www.oracle.com/database/technologies/xe-downloads.html

## After installation
After the first run, the Oracle database server is installed.

The default SID is _XE_: the password of the user SYSTEM is listed in the full path specified on the URL foramentioned.

## Credentials
The default password of SYSTEM and SYS can be found on folders (checkout the full path on the URL https://hub.docker.com/r/cosmomill/alpine-oracle-xe)