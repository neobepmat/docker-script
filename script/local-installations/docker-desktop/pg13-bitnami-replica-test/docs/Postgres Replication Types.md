# Postgres Replication Types

- Streaming replication
- Logical Replication 

## Streaming Replication (Physical)
Streaming replication works by transferring, or shipping, the WAL to the standby server in real time, and applying it on the standby server (Log Shipping)

- Synchronous replication
- Asynchronous replication

### Settings on the primary server

postgresql.conf
```
listen_addresses = *
wal_level = 'replica'
max_wal_senders = _numberOfStandbyServers + 1
max_connections = Maximum number of simultaneous connections to the database server
wal_keep_segments = Minimum number of file segments to keep in the pg_wal directory
wal_sender_timeout = Time to wait before determining that the WAL receiver process is in an abnormal state

synchronous_standby_names = Standby servers for synchronous replication. No setting is required for asynchronous replication
synchronous_commit = Synchronization level of the standby servers.
Set 'remote_apply' to optimize data freshness and 'on' to maintain performance and reliability.
archive_mode = on
archive_command = Command for archiving the WAL.
Example: 'cp %p /mnt/serv/arch_dir %f'
```

pg_hba.conf
```
Set the 'database' column to 'replication'.
Example: host replication someuser 187.168.1.5 passwd
```

### Settings on the standby server

postgresql.conf
```
hot_standby = on
wal_receiver_timeout = Time to wait before determining that the WAL sender process is in an abnormal state
standby_mode = on
primary_conninfo = Connection information to the primary server.
Set the same name for application_name and synchronous_standby_names in postgresql.conf on the primary server.
Example: 'host=187.168.1.50 port=5432 user=someuser password=passwd application_name=s1'
restore_command = Set the command to get the WAL archive.
Example: 'scp usr@187.168.1.50:/mnt/serv/arch_dir/%f %p'
```

## Logical Replication
Logical replication in PostgreSQL is achieved by the construction of a stream of logical data modifications from the WAL file. It doesn’t require a particular database to be designated as the main database but supports multi-directional data flow.

