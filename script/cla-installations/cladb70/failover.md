## FAILOVER

Primary is in trouble, e.g. shutdown primary
```
pg_ctl stop -D $PG_DATA
```

Modify _postgresql.conf_
```ini
listen_addresses = '*'
wal_level = replica
max_wal_senders = 3
max_replication_slots = 3
```

Modify _pg_hba.conf_
```
host    replication     repmgr          79.xxx.xxx.xxx/32        md5
```


Create the replication slot _standby1_
```sql
select * from pg_create_physical_replication_slot('standby1',true);
```

Prepare the file _recovery.conf_ and link it to the replication slot _standby1_
```ini
standby_mode = 'on'
primary_conninfo = 'user=repmgr host=vpsfrsqlpac2 port=30001 password=***********!'
primary_slot_name = 'standby1'
recovery_target_timeline = 'latest'

```