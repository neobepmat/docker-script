docker run \
--detach \
--name LocalGitlab \
--memory=2g \
--memory-reservation=1g \
--publish 4431:443 --publish 8082:80 --publish 222:22 \
--volume /Docker/gitlab/data:/var/opt/gitlab \
--volume /Docker/gitlab/logs:/var/log/gitlab \
--volume /Docker/gitlab/config:/etc/gitlab \
--shm-size 256m \
gitlab/gitlab-ce:15.4.6-ce.0 