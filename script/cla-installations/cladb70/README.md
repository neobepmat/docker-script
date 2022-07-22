# README

This folder contains information about installation and configuration of services for CLADB70

## TOC

- elenco-tablespaces.cmd
	+ batch to create all the CLA tablespaces used in CLA (same configuration as CLADB60)

## Procedures

- initdb
	+ how to setup a primary replica master and a slave standby
- failover
	+ doc with the procedures to promote a standby server to primary master and transforming primary to standby server
- failback
	+ to be prepared
	
## Scripts

- elenco-tablespaces.cmd
	+ generates the folders for all the tablespaces defined in the server 
- pg_basebackup.cmd
	+ command for pg_basebackup taken from CLADB60 and saving all the data file to a new PG_DATA location configurable in the script