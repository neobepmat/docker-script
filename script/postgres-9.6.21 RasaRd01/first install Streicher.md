# Postgres installation
Application: **C:\Program Files\PostgreSQL\9.6**

Data files: **F:\PostgreSQL\9.6\data**

---

# Prod
Db: TACO

# First User
usr: admin
pwd: password

---

# Test
Db: TACO_TST

# First User
usr: admin
pwd: password

---

# Current Version (PROD & TEST)
01.010.24.05

# Local User for Db Backup
Rasa-Rd-01\DbBackup
pwd: DetergenteSpray123

L'utente è stato aggiunto alla lista degli user con diritto "Log on as a batch job"


# Script di Backup
Operazione schedulata
> WeldingBook Backup

Il Backup viene effettuato tutti i giorni a partire dalle ore 4:00 AM

Viene eseguito lo script C:\Script\DUMP_ALL.bat, effettua il backup di tutti i database della installazione locale di PostgreSQL nella directory F:\Backups

# Script rolling di cancellazione Backup
Operazione schedulata
> Postgres Clean Backup Folder

Effettua a cancellazione in rolling dei file di backup (cancella i file di backup più vecchi di una settimana)