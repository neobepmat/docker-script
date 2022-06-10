CREATE TABLESPACE "BOD_TACO_TBS" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/BOD_TACO_TBS.NDF';

CREATE TABLESPACE "TACO_M00A" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/TACO_M00A.DBF';

CREATE TABLESPACE "TACO_M00B" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/TACO_M00B.DBF';

CREATE TABLESPACE "TACO_M01A" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/TACO_M01A.DBF';

CREATE TABLESPACE "TACO_M01B" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/TACO_M01B.DBF';

CREATE TABLESPACE "TACO_M04A" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/TACO_M04A.DBF';

CREATE TABLESPACE "TACO_M04B"  OWNER postgres LOCATION '/usr/pg/usr_tblspcs/TACO_M04B.DBF';

CREATE TABLESPACE "TACO_U" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/TACO_U.DBF';

CREATE TABLESPACE "DBENG_M00A" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/DBENG_M00A.DBF';
CREATE TABLESPACE "DBENG_M00B" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/DBENG_M00B.DBF';

CREATE TABLESPACE "DBENG_M01A" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/DBENG_M01A.DBF';
CREATE TABLESPACE "DBENG_M01B" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/DBENG_M01B.DBF';

CREATE TABLESPACE "DBENG_M02A" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/DBENG_M02A.DBF';
CREATE TABLESPACE "DBENG_M02B" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/DBENG_M02B.DBF';

CREATE TABLESPACE "DBENG_M04A" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/DBENG_M04A.DBF';
CREATE TABLESPACE "DBENG_M04B" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/DBENG_M04B.DBF';

CREATE TABLESPACE "DBENG_M05A" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/DBENG_M05A.DBF';
CREATE TABLESPACE "DBENG_M05B" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/DBENG_M05B.DBF';

CREATE TABLESPACE "DBENG_M06A" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/DBENG_M06A.DBF';
CREATE TABLESPACE "DBENG_M06B" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/DBENG_M06B.DBF';

CREATE TABLESPACE "DBENG_M07A" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/DBENG_M07A.DBF';
CREATE TABLESPACE "DBENG_M07B" OWNER postgres LOCATION '/usr/pg/usr_tblspcs/DBENG_M07B.DBF';

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

CREATE ROLE "DBENG" WITH
  LOGIN
  SUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  ENCRYPTED PASSWORD 'md500c8cee69e04687ecf4b0fa6bc547e97';
  