# Restore commands

## PG13 TEST
Restore TACO for PG13 TEST
> export PGPASSWORD=<%password%>; pg_restore --host localhost --port 6432 --username "postgres" --dbname "TACO" --role "TACO" --no-password  --verbose <%filename%>;

Restore CLA for PG13 TEST
> export PGPASSWORD=<%password%>; pg_restore --host localhost --port 6432 --username "postgres" --dbname "CLA" --role "TACO" --no-password  --verbose <%filename%>;

Restore CLA-DEV for PG13 TEST
> export PGPASSWORD=<%password%>; pg_restore --host localhost --port 6432 --username "postgres" --dbname "CLA-DEV" --role "TACO" --no-password  --verbose <%filename%>;

Restore STREICHER-TEST TACO for PG13 TEST
> export PGPASSWORD=<%password%>; pg_restore --host localhost --port 6432 --username "postgres" --dbname "STREICHER-TEST" --role "TACO" --no-password  --verbose <%filename%>;

Restore STREICHER-TEST BOD_TACO for PG13 TEST
> export PGPASSWORD=<%password%>; pg_restore --host localhost --port 6432 --username "postgres" --dbname "STREICHER-TEST" --role "BOD_TACO" --no-password  --verbose <%filename%>;

## PG13 PRODUCTION

Restore BOD_TACO for PG13 PRODUCTION
> export PGPASSWORD=<%password%>; pg_restore --host localhost --port 5432 --username "postgres" --dbname "TACO" --role "BOD_TACO" --no-password  --verbose <%filename%>;

Restore TACO for PG13 PRODUCTION
> export PGPASSWORD=<%password%>; pg_restore --host localhost --port 5432 --username "postgres" --dbname "TACO" --role "TACO" --no-password  --verbose <%filename%>;

Restore STREICHER TACO for PG13 PRODUCTION
> export PGPASSWORD=<%password%>; pg_restore --host localhost --port 5432 --username "postgres" --dbname "STREICHER" --role "TACO" --no-password  --verbose <%filename%>;

Restore STREICHER BOD_TACO for PG13 PRODUCTION
> export PGPASSWORD=<%password%>; pg_restore --host localhost --port 5432 --username "postgres" --dbname "STREICHER" --role "BOD_TACO" --no-password  --verbose <%filename%>;

