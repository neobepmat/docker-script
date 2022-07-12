# Database Legenda

- PITR
	+ Point In Time Recovery
		* while using log shipping, a specific restore in time can be performed
		
- pg_basebackup
	+ https://backup.ninja/news/postgresql-backups-what-is-pgbasebackup
	+ utility to perform a base backup of a postgreSQL database cluster, usueful to start a standby replica server or as a base for a PITR service
	+ this utility perform a file system backup of the actual database files
	+ you can also capture the log files while executing the base backup to build a fully operational database cluster backup
	+ up to PG 9.5, enable the option _wal\_level = archive_ to generate the logs in the format compatible for pg_basebackup
	+ greater than pg 9.5, _wal\_level = replica_
	+ the value of _max\_wal\_senders_ determines how many clients can connect with the database and request the data files