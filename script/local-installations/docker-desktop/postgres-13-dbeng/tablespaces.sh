mkdir -p /usr/pg/usr_tblspcs;

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

echo "Creating TACO tablespaces"

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


echo "Creating DBENG tablespaces"

echo "Creating tablespaces DBENG_M00A.DBF"
create_directory "DBENG_M00A.DBF";

echo "Creating tablespaces DBENG_M00B.DBF"
create_directory "DBENG_M00B.DBF";

echo "Creating tablespaces DBENG_M01A.DBF"
create_directory "DBENG_M01A.DBF";

echo "Creating tablespaces DBENG_M01B.DBF"
create_directory "DBENG_M01B.DBF";

echo "Creating tablespaces DBENG_M02A.DBF"
create_directory "DBENG_M02A.DBF";

echo "Creating tablespaces DBENG_M02B.DBF"
create_directory "DBENG_M02B.DBF";

echo "Creating tablespaces DBENG_M04A.DBF"
create_directory "DBENG_M04A.DBF";

echo "Creating tablespaces DBENG_M04B.DBF"
create_directory "DBENG_M04B.DBF";

echo "Creating tablespaces DBENG_M05A.DBF"
create_directory "DBENG_M05A.DBF";

echo "Creating tablespaces DBENG_M05B.DBF"
create_directory "DBENG_M05B.DBF";

echo "Creating tablespaces DBENG_M06A.DBF"
create_directory "DBENG_M06A.DBF";

echo "Creating tablespaces DBENG_M06B.DBF"
create_directory "DBENG_M06B.DBF";

echo "Creating tablespaces DBENG_M07A.DBF"
create_directory "DBENG_M07A.DBF";

echo "Creating tablespaces DBENG_M07B.DBF"
create_directory "DBENG_M07B.DBF";
