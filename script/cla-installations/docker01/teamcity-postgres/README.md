# Teamcity installation for Docker01

This installtion for Docker01 includes:

- Teamcity server, current installed version is 2022.04.1
- Postgres server, to support Teamcity configuration

## Configuration

The bind mounts and Postgres credentials are specified in the environment file
> .env

The Postgres database server is installed from a DockerFile from the folder 
> ./postgres


## Build

docker-compose -f docker-compose.yml build

## Create containers

docker-compose -f docker-compose.yml up -d