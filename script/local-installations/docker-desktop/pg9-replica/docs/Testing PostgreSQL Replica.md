# Testing PostgreSQL Replica

On MASTER, retrieve the replication stats
> select * from pg_stat_replication

On SLAVE
> select * from pg_stat_wal_receiver;

On MASTER or SLAVE, check the configuration settings
> select * from pg_settings;

On Master or Slave, checking th pg_hba configuration (PG 10 and above)
> table pg_hba_file_rules ;

On Master or Slave, checking th pg_hba configuration (Up to PG 9.6)
> SELECT pg_read_file('pg_hba.conf');
