# Docker logs

One of the main aspects about Docker and its disk usage is strictly related to the logging feature.

Running the containers without proper settings on the logs (log rolling) might bring unpredictable results in terms of disk occupation.

Besides the command to reduce the size of these files, there are also configuration changes for containers to tackle this issue at his root cause.


## Websites with information

- How to reduce the size of the log files in docker container

> https://menetray.com/en/blog/how-reduce-size-log-files-docker-containers


The command to get the disk occupation (usually /var/lib/docker requires sudo)

> docker ps -aq | xargs -I '{}' docker inspect --format='{{.LogPath}}' '{}' | sudo xargs ls -lh

the list of files also reports the file size, hereunder an example

```
-rw-r----- 1 root root  34K 2017-06-08  /var/lib/docker/containers/3uy7mfiybwnaakfgstokw6h5kmsrzbhmeay9lssnm39v8y5ngf6yz7amd3i8kjhj/3uy7mfiybwnaakfgstokw6h5kmsrzbhmeay9lssnm39v8y5ngf6yz7amd3i8kjhj-json.log
-rw-r----- 1 root root 276K 2018-04-16  /var/lib/docker/containers/q51e1h6e3y4uproc0u4qq8bvighswuzhqi1jzw49ucqarsbcftfdcpa26ls02bxo/q51e1h6e3y4uproc0u4qq8bvighswuzhqi1jzw49ucqarsbcftfdcpa26ls02bxo-json.log
-rw-r----- 1 root root 131G 01-11 18:19 /var/lib/docker/containers/nol87bct8i1pd0ya6pg1m3iva0cpgdde6khm0vym0g0jlob1jd3gcgbwm1scfpyg/nol87bct8i1pd0ya6pg1m3iva0cpgdde6khm0vym0g0jlob1jd3gcgbwm1scfpyg-json.log
```

In case you want to backup your logs
```
sudo cat /var/lib/docker/containers/nol87bct8i1pd0ya6pg1m3iva0cpgdde6khm0vym0g0jlob1jd3gcgbwm1scfpyg/nol87bct8i1pd0ya6pg1m3iva0cpgdde6khm0vym0g0jlob1jd3gcgbwm1scfpyg-json.log | bzip2 --best --compress --stdout &gt; /mnt/nfs-shared/temp/c12a851-12.01.2019.log.bz2
```

To reduce the size of the logs we are going to use the `fallocate` command.

First, let's install util-linux
> sudo apt-get install util-linux

to reduce the logs
```
sudo fallocate --collapse-range --offset 0 --length 130GiB --verbose /var/lib/docker/containers/nol87bct8i1pd0ya6pg1m3iva0cpgdde6khm0vym0g0jlob1jd3gcgbwm1scfpyg/nol87bct8i1pd0ya6pg1m3iva0cpgdde6khm0vym0g0jlob1jd3gcgbwm1scfpyg-json.log
```


## Rolling settings for Docker

These settings reduce the maximum size of logs for a container to max 3 files with 10MB each of them.

- For docker compose file

```
logging:
  driver: "json-file"
  options:
    max-size: "10m"
    max-file: "3"
```

- For simple `docker run` command
```
--log-driver json-file --log-opt max-size=10m \
```

- For all dockers on a machine

```
echo '{"log-driver": "json-file", "log-opts": {"max-size": "10m", "max-file": "3"}}' | jq . > /etc/docker/daemon.json \
  && systemctl restart docker
```