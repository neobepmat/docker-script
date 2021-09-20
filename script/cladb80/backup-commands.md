# Backup commands

Backup PG13 TEST, DB=TACO
> export PGPASSWORD=<%password%>;pg_dump -h localhost -p 6432 -U postgres -Fc TACO > ~/dbbackup/test-TACO.bak;

Backup PG13 TEST , DB=CLA
> export PGPASSWORD=<%password%>;pg_dump -h localhost -p 6432 -U postgres -Fc CLA > ~/dbbackup/test-CLA.bak;

Backup PG13 TEST , DB=CLA-DEV
> export PGPASSWORD=<%password%>;pg_dump -h localhost -p 6432 -U postgres -Fc CLA-DEV > ~/dbbackup/test-CLA-DEV.bak;