# AWK commands

- Generate file `file.out`, source is `elenco-tablespaces.csv` with all tablespaces - separator is `comma` - in this example, there is only one columun (pay attention, some blanks are included in EXYTE tablespace names)
- The `file.out` is the complete list of the SQL statement to create the TABLESPACE object in the folder `/var/lib/postgresql/data`
```
cat elenco-tablespaces.csv | awk -F',' '{ printf "CREATE TABLESPACE \x22%s\x22 OWNER postgres LOCATION \x22var/lib/postgresql/data/%s.DBF\x22;",$1,$1;print ""}' > file.out
```