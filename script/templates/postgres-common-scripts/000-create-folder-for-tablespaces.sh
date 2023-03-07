mkdir -p /usr/pg_basebackup/usr_tblspcs;

cd /bitnami/postgresql;

create_directory () {
	if [[ -d "$1" ]]
	then
	    echo "$1 exists on your filesystem."
	else
		mkdir $1;
	fi
}

create_directory "BOD_TACO_TBS.NDF";

create_directory "TACO_M00A.DBF";

create_directory "TACO_M00B.DBF";

create_directory "TACO_M01A.DBF";

create_directory "TACO_M01B.DBF";

create_directory "TACO_M04A.DBF";

create_directory "TACO_M04B.DBF";

create_directory "TACO_U.DBF";
