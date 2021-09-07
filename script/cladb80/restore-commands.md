# Restore commands

Restore TACO for PG13 TEST
> export PGPASSWORD=<%password%>; pg_restore --host localhost --port 6432 --username "postgres" --dbname "TACO" --role "TACO" --no-password  --verbose <%filename%>.backup;

Restore TACO for PG13 PRODUCTION
> export PGPASSWORD=<%password%>; pg_restore --host localhost --port 5432 --username "postgres" --dbname "TACO" --role "TACO" --no-password  --verbose <%filename%>.backup;

Restore CLA for PG13 TEST
> export PGPASSWORD=<%password%>; pg_restore --host localhost --port 6432 --username "postgres" --dbname "CLA" --role "TACO" --no-password  --verbose <%filename%>.backup;

Restore CLA-DEV for PG13 TEST
> export PGPASSWORD=<%password%>; pg_restore --host localhost --port 6432 --username "postgres" --dbname "CLA-DEV" --role "TACO" --no-password  --verbose <%filename%>.backup;