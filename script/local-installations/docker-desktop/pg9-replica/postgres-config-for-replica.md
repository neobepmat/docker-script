# WAL Write Ahead Log
wal_level: (enum)
	possible values: replica, minimal, logical


# Sending Servers
max_wal_senders
	default:0
	0: replication off
	n: maximum number of concurrent connections from standby servers

max_connections:
	default: 100
	maximum number of concurrent connections to the database server
	when running a standby server, this value must be equal or higher than master server

max_replication_slots:
	default: 0
	 wal_level must be set to 'replica' or higher to allow replication slots to be used

wal_keep_segments:
	default: 0
	minimum number of past log file segments kept in the pg_xlog directory, in case a standby server needs to fetch them for streaming replication

wal_sender_timeout:
	default: 60 secs
	A value of 0 disables the timeout
	Terminate replication connections that are inactive longer than the specified number of milliseconds

track_commit_timestamp: (bool)
	default: off
	Record commit time of transactions

---

# Master Servers
synchronous_standby_names (string)
	Specifies a list of standby servers that can support synchronous replication

vacuum_defer_cleanup_age (integer)
	default: 0
	Specifies the number of transactions by which VACUUM and HOT updates will defer cleanup of dead row versions

---

# Standby Servers
hot_standby: (bool)
	default: off
	Specifies whether or not you can connect and run queries during recovery

max_standby_archive_delay (integer)
	
max_standby_streaming_delay (integer)

wal_receiver_status_interval (integer)

hot_standby_feedback (boolean)

wal_receiver_timeout (integer)

wal_retrieve_retry_interval (integer)

