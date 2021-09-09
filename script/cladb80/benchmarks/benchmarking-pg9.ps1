# benchmarking postgresql via powershell script

Function Execute($command) {
    # execute:
    Invoke-Expression "& $command";
    # if you have trouble try:
    # Invoke-Expression "& $command";
    # or if you need also output to a variable
    # Invoke-Expression $command | Tee-Object -Variable cmdOutput;
}

$pgbenchPath = 'C:\Program Files\PostgreSQL\13\bin'
$logPath = 'C:\Temp\benchlog\cladb80-pg9-benchlog.txt'

$port= '7432'
$pghost= '192.168.59.27'
$user= 'postgres'
$pgpwd= 'Abcd1234'
$database= 'benchmarks'

# benchmarking parameters

$clientNumber= '10'
$jobs=2
$executionTime= '60'
$showProgressEvery = '5'

$env:PGPASSWORD=$pgpwd

Stop-Transcript | out-null
Start-Transcript -path "$logPath" -append

For ($i=0; $i -le 10; $i++) {

    $app = "$pgbenchPath\pgbench.exe";
    $args = '-U', $user,
            '-h', $pghost,
            '-p', $port,
            '-c', $clientNumber,
            '-j', $jobs,
            '-T', $executionTime,
            '-P', $showProgressEvery,
            $database;
        
    Execute "'$app' $args";

}

Stop-Transcript