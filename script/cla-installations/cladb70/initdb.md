# Initdb

## Legenda

- $PG_DATA (for CLADB60 and CLADB70)
> C:\Program Files\PostgreSQL\9.6\data

## Primary Master

- Changes for _postgresql.conf_
```ini
listen_addresses = '*'
wal_level=replica
max_replication_slots=3
max_wal_senders=3
```

- Changes ready for failover on _postgresql.conf_
```ini
hot_standby = on
```

- Restart Master

- Create replication role (replace the list of asterisks with a password)
```sql
create role replicator with replication login encrypted password 'postgresSQL2017';
```

- Changes to pg_hba.conf (specify the ip address of the standby server)
```
host    replication     replicator          192.168.59.26/32           md5
```

- Reload the configuration
> pg_ctl reload -D $PG_DATA

- Create replication slot (the replication slot will be initialized during the primary server backup with pg_basebackup)
> select * from pg_create_physical_replication_slot('standby1');


## Standby server

- Create the folder to match the imported tablespaces from Master Server.

- From the Standby server, perform primary server backup
```
"C:\Program Files\PostgreSQL\9.6\bin\pg_basebackup.exe" -D "C:\Program Files\PostgreSQL\9.6\data" -X stream --write-recovery-conf --slot=standby1 -h 192.168.59.25 -p 5432 -U replicator -W
```

- The file `recovery.conf` is automatically created and populated based on pg_basebackup parameters. Verify the contents
```
standby_mode = 'on'
primary_conninfo = 'user=postgres host=192.168.59.25 port=5432 sslmode=prefer sslcompression=1 krbsrvname=postgres'
primary_slot_name = 'standby1'
```