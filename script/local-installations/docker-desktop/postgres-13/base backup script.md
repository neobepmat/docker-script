# Commands for pg_basebackup

The command is executed within the container _pg13_, a base backup is created in the folder
> /basebackup

a folder contained within the container and exposed as persistent volume from the mount point
> /Docker/pg13basebackup

We have created two different types of base backup:
- plain 
- commpressed in tar format

## Plain base backup

- the format is _Plain_
- a separate folder is allocated for WAL files
- a minimal _recover.conf_ is written
- tablespaces are relocated from folder _/bitnami/postgresql_ to _/basebackup_ folder, each tablespace must be mapped to the new folder
- progress reporting is enabled

Example with just one tablespace mapped

> docker exec -t pg13 pg_basebackup -U postgres -D /basebackup -F p -R -T /bitnami/postgresql=/basebackup --waldir=/basebackup/waldir -P


## Compressed base backup

- the format is _Tar_
- a minimal _recover.conf_ is written
- progress reporting is enabled

> docker exec -t pg13 pg_basebackup -U postgres -D /basebackup -F t -R -P


## Continuous archiving

To setup a continuous archiving on Postgres database server, various options should be prepared and configured.

The file _postgresql.conf_ should be edited
```
archive_mode = on
archive_command = 'cp %p /path/to/archive/%f'
restore_command = 'cp /path/to/archive/%f %p'
```
