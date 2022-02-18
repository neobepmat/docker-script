$DataFolder='E:\PostgreSQL\9.6\data'

ForEach ($Dir in ("BOD_TACO_TBS.NDF","TACO_M00A.DBF","TACO_M00B.DBF","TACO_M01A.DBF","TACO_M01B.DBF","TACO_M04A.DBF","TACO_M04B.DBF","TACO_U.DBF"))
{
    $CurrentFolder = $DataFolder + '\' + $Dir

    if (Test-Path -Path $CurrentFolder) 
    {
        'Path ' + $CurrentFolder + ' exists!'
    } 
    else 
    {
        New-Item -ItemType Directory -Path $CurrentFolder
    }
} 