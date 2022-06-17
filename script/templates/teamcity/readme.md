# Team City scripts, readme and templates

https://github.com/JetBrains/teamcity-docker-images/blob/master/dockerhub/teamcity-server/README.md

This document includes all the specifications related to the setup / installation of TeamCity on top of Docker container.

These scripts allow you to create:
- a TeamCity server
- 1 or more Team City agents, for Linux and Windows platform

## Server Configuration

The script is
> docker-run-tc-server.md

The release used at the moment of the creation of this file is:
> jetbrains/teamcity-server:2022.04.1

The Teamcity Docker container is configured to be executed with these specs:
- port 8111, the tcp port where Teamcity is listening
- volumes
	+ for data dir
		* e.g. /dock/teamcity/data
	+ for logs
		* e.g. /dock/teamcity/logs
- the user uid:gid, 1000:1000


## Client Configuration

The file
> docker-run-tc-agent-linux-template.md

and
> docker-run-tc-agent-win-template.md

are yaml templates to create an agent for Linux or Windows platform.

To use them you need to:
- change the <% Agent Name %> on the container name and in the volume path for every agent deployed
- specify the Server Name where a valid Team city installation is available

