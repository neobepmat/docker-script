CREATE ROLE "BOD_TACO" WITH
  LOGIN
  SUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  ENCRYPTED PASSWORD 'md500c8cee69e04687ecf4b0fa6bc547e97';

CREATE ROLE "TACO" WITH
  LOGIN
  SUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  ENCRYPTED PASSWORD 'md523d4c9c38e912f34c7d6bb28fcdd87a4';