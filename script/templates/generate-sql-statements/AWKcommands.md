# AWK commands

- For Linux filesystem
- Generate file `file.out`, source is `elenco-tablespaces.csv` with all tablespaces - separator is `comma` - in this example, there is only one columun (pay attention, some blanks are included in EXYTE tablespace names)
- The `file.out` is the complete list of the SQL statement to create the TABLESPACE object in the folder `/var/lib/postgresql/data`
```
cat elenco-tablespaces.csv | awk -F',' '{ printf "CREATE TABLESPACE \x22%s\x22 OWNER postgres LOCATION \x22var/lib/postgresql/data/%s.DBF\x22;",$1,$1;print ""}' > file.out
```

- For Linux filesystem
- Generate file `file.out`, source is `elenco-tablespaces.csv` with all tablespaces mapping for pg_basebackup command - separator is `comma` - in this example, there is only one columun (pay attention, some blanks are included in EXYTE tablespace names)
- The `file.out` is the complete list of the command to be attached to the main part
```
cat elenco-tablespaces.csv | awk -F',' '{ printf " --tablespace-mapping=\x22$MASTER_FOLDER_TABLESPACES/%s.DBF\x22=\x22$SLAVE_FOLDER_TABLESPACES/%s.DBF\x22 \x5c",$1,$1; print ""}' > file.out
```

- For Windows filesystem
- Generate file `filewin.out`, source is `elenco-tablespaces.csv` with all tablespaces - separator is `comma` - in this example, there is only one columun (pay attention, some blanks are included in EXYTE tablespace names)
- The `filewin.out` is the complete list of the SQL statement to create the TABLESPACE object in the folder `/var/lib/postgresql/data`
```
cat elenco-tablespaces.csv | awk -F',' '{ printf "CREATE TABLESPACE \x22%s\x22 OWNER postgres LOCATION \x22C:\x5cProgram Files\x5cPostgreSQL\x5c9.6\x5cdata\x5c%s.DBF\x22;",$1,$1;print ""}' > filewin.out
```

- For Windows filesystem
- Generate file `filewin.out`, source is `elenco-tablespaces.csv` with all tablespaces mapping for pg_basebackup command - separator is `comma` - in this example, there is only one columun (pay attention, some blanks are included in EXYTE tablespace names) - the master source folder and the slave source folder are absolute paths
- The `filewin.out` is the complete list of the command to be attached to the main part
```
cat elenco-tablespaces.csv | awk -F',' '{ printf " --tablespace-mapping=\x22C:\x5cProgram Files\x5cPostgreSQL\x5c9.6\x5cdata\x5c%s.DBF\x22=\x22C:\x5cProgram Files\x5cPostgreSQL\x5c9.6\x5cdata\x5c%s.DBF\x22^",$1,$1; print ""}' > filewin.out
```

- For Windows filesystem
- Generate file `filewin.out`, source is `elenco-tablespaces.csv` with all tablespaces mapping for pg_basebackup command - separator is `comma` - in this example, there is only one columun (pay attention, some blanks are included in EXYTE tablespace names) - the master source folder and the slave source folder are batch variables (to be defined in the batch script using this list of commands)
- The `filewin.out` is the complete list of the command to be attached to the main part
```
cat elenco-tablespaces.csv | awk -F',' '{ printf " --tablespace-mapping=\x22%MASTER_TABLESPACES_FOLDER%\x5c%s.DBF\x22=\x22%STANDBY_TABLESPACES_FOLDER%\x5c%s.DBF\x22^",$1,$1; print ""}' > filewin.out
```