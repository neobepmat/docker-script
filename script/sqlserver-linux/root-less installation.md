# Root-less installation

Create new user to run container as root-less
> useradd -M -s /bin/bash -u 10001 -g 0 mssql

Options details:
- "-M", do not create user's home directory
- "-s /bin/bash", user's shell name
- "-u", user's ID
- "-g 0" number of the user's initial login group
- "mssql" login

## Creating volume folders

Create the folders:
> mkdir /Docker/sqlsrvr2019e
> mkdir /Docker/sqlsrvr2019e/data
> mkdir /Docker/sqlsrvr2019e/data/system
> mkdir /Docker/sqlsrvr2019e/data/user

Modify owner ad group
> sudo chown 10001:docker sqlsrvr2019e/ -R