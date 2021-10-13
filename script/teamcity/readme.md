# README

This document includes all the specifications related to the setup / installation of TeamCity on top of Docker container.

These scripts allow to create:
- a TeamcCity server
- 1 or more Team City agents, separated in Linux and Windows platform

## Server Configuration

The release used at the moment of the creation of this file is:
> jetbrains/teamcity-server:2021.1.3

The Teamcity Docker container is configured to be executed with these specs:
- port 8111, the tcp port where Teamcity is listening
- volumes
	+ for data dir
		* /Docker/teamcity/data
	+ for logs
		* /Docker/teamcity/logs


## Client Configuration

The file
> docker-run-tc-agent-linux-template.md

and
> docker-run-tc-agent-win-template.md

are template yaml to create an agent for Linux or Windows platform.

To use them you need to:
- change the <% Agent Name %> on the container name and in the volume path for every agent deployed
- specify the Server Name where a valid Team city installation is available

