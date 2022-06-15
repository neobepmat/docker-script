docker run \
--restart always \
--detach \
--name CLANexus \
--memory=4g \
--memory-reservation=2g \
-p 8081:8081 \
--env-file nexus.env \
-v /dock/nexus:/nexus-data \
sonatype/nexus3:3.39.0