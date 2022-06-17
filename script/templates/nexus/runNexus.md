docker run \
--restart always \
--detach \
--name CLANexus \
--memory=6g \
--memory-reservation=4g \
-p 8081:8081 \
--env-file nexus.env \
-v /dock/nexus:/nexus-data \
sonatype/nexus3:3.34.0