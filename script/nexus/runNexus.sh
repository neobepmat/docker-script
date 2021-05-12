docker run --restart always --detach --name CLANexus -p 8081:8081 --env-file nexus.env -v /dock/nexus:/nexus-data sonatype/nexus3:latest
