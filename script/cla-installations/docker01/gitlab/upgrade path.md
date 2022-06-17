13.12.15	ok
14.0.12		ok
il passaggio alla 14.3.6 da errore dalla 14.0.12


- 13.12.15	
	+ ok
- 14.0.12		
	+ ok
- 14.1.8		
	+ ok
	+ necessaria alter table
		* Alter TABLE Services RENAME TO Integrations;
	+ eseguito backup volume
- 14.2.0
	+ pare ok
	+ eseguito backup
	+ comando da eseguire per fixare l'upgrade 
		* sudo gitlab-rake gitlab:background_migrations:finalize[CopyColumnUsingBackgroundMigrationJob,events,id,'[["id"]\, ["id_convert_to_bigint"]]']
- 14.2.7
	+ pare ok
	+ eseguito backup
		* docker exec -it my-gitlab-container update-permissions
		* docker exec -it my-gitlab-container gitlab-ctl reconfigure
		* docker restart my-gitlab-container
	+ eseguiti comandi sui dati da container parallelo
- 14.3.0
	+ ok
- 14.3.6
	+ ok
- 14.6.2
	+ ok
- 14.9.5
	+ ok
- 14.10.4
	+ waiting