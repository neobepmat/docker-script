mkdir -p /usr/pg/usr_tblspcs;
mkdir -p /usr/pg_basebackup/usr_tblspcs;

echo "Creating tablespaces in the folder:[/usr/pg/usr_tblspcs]"
cd /usr/pg/usr_tblspcs;

create_directory () {
	if [[ -d "$1" ]]
	then
	    echo "$1 exists on your filesystem."
	else
		mkdir $1;
	fi
}

echo "Creating tablespaces BOD_TACO_TBS.NDF"
create_directory "BOD_TACO_TBS.NDF";

echo "Creating tablespaces TACO_M00A.DBF"
create_directory "TACO_M00A.DBF";

echo "Creating tablespaces TACO_M00B.DBF"
create_directory "TACO_M00B.DBF";

echo "Creating tablespaces TACO_M01A.DBF"
create_directory "TACO_M01A.DBF";

echo "Creating tablespaces TACO_M01B.DBF"
create_directory "TACO_M01B.DBF";

echo "Creating tablespaces TACO_M04A.DBF"
create_directory "TACO_M04A.DBF";

echo "Creating tablespaces TACO_M04B.DBF"
create_directory "TACO_M04B.DBF";

echo "Creating tablespaces TACO_U.DBF"
create_directory "TACO_U.DBF";
