CREATE USER replicator WITH REPLICATION ENCRYPTED PASSWORD 'Abcd1234';

SELECT * FROM pg_create_physical_replication_slot('replication_slot_slave1');