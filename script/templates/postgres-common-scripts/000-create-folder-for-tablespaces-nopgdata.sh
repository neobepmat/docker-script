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

echo "Tablespaces for WELDING BOOK--------------------"

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

echo "Tablespaces for SPIDER--------------------"

echo "Creating tablespaces BOD_ENI_TBS"
create_directory "BOD_ENI_TBS";

echo "Creating tablespaces BOD_TMS_TBS"
create_directory "BOD_TMS_TBS";

echo "Creating tablespaces 202109_01_M00A"
create_directory "202109_01_M00A";

echo "Creating tablespaces 202109_01_M00B"
create_directory "202109_01_M00B";

echo "Creating tablespaces 202109_01_M01A"
create_directory "202109_01_M01A";

echo "Creating tablespaces 202109_01_M01B"
create_directory "202109_01_M01B";

echo "Creating tablespaces 202109_01_U"
create_directory "202109_01_U";

echo "Creating tablespaces ENI_ENG_M00A"
create_directory "ENI_ENG_M00A";

echo "Creating tablespaces ENI_ENG _M00B"
create_directory "ENI_ENG_M00B";

echo "Creating tablespaces ENI_ENG_M01A"
create_directory "ENI_ENG_M01A";

echo "Creating tablespaces ENI_ENG_M01B"
create_directory "ENI_ENG_M01B";

echo "Creating tablespaces ENI_ENG_U"
create_directory "ENI_ENG_U";

echo "Creating tablespaces TMS_PG_M00A"
create_directory "TMS_PG_M00A";

echo "Creating tablespaces TMS_PG_M00B"
create_directory "TMS_PG_M00B";

echo "Creating tablespaces TMS_PG_M06A"
create_directory "TMS_PG_M06A";

echo "Creating tablespaces TMS_PG_M06B"
create_directory "TMS_PG_M06B";

echo "Creating tablespaces TMS_PG_U"
create_directory "TMS_PG_U";

echo "Creating tablespaces EXYTE_U"
create_directory "EXYTE_U";