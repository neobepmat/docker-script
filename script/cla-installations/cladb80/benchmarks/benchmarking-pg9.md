# Benchmarking PostgreSQL

This file includes the commands used to execute benchmarks on PostgreSQL database server.

## Benchmarking for PG 9 TEST

Opening bash shell on _pg9_ container
> docker exec -it pg9 /bin/bash

Creating new database in psql
> create database benchmarks

Initializing benchmarking application
> pgbench -h localhost -U postgres -i benchmarks

Example
> pgbench -U postgres -c 10 -j 2 -t 10000 benchmarks

```
I have no name!@96914d5f0b1c:/$ pgbench -U postgres -c 10 -j 2 -t 10000 benchmarks
Password:
starting vacuum...end.
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
number of transactions per client: 10000
number of transactions actually processed: 100000/100000
latency average = 8.550 ms
tps = 1169.534451 (including connections establishing)
tps = 1170.059635 (excluding connections establishing)
```

Per time (60 secs) showing progress every 5 secs
> export PGPASSWORD=Abcd1234;pgbench -U postgres -c 10 -j 2 -T 60 -P 5 benchmarks

```language
starting vacuum...end.
progress: 5.0 s, 1288.3 tps, lat 7.104 ms stddev 9.868
progress: 10.0 s, 157.0 tps, lat 67.618 ms stddev 538.182
progress: 15.0 s, 1359.6 tps, lat 7.355 ms stddev 7.778
progress: 20.0 s, 1307.6 tps, lat 7.643 ms stddev 11.315
progress: 25.0 s, 1319.8 tps, lat 7.578 ms stddev 8.020
progress: 30.0 s, 1571.8 tps, lat 6.363 ms stddev 4.609
progress: 35.0 s, 676.2 tps, lat 6.506 ms stddev 4.496
progress: 40.0 s, 1388.7 tps, lat 11.239 ms stddev 123.099
progress: 45.0 s, 1350.6 tps, lat 7.405 ms stddev 10.313
progress: 50.0 s, 1448.8 tps, lat 6.900 ms stddev 6.987
progress: 55.0 s, 1450.6 tps, lat 6.891 ms stddev 5.621
progress: 60.0 s, 1046.8 tps, lat 6.510 ms stddev 4.474
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
duration: 60 s
number of transactions actually processed: 71837
latency average = 8.479 ms
latency stddev = 75.347 ms
tps = 1176.938847 (including connections establishing)
tps = 1177.355464 (excluding connections establishing)
```

```language
starting vacuum...end.
progress: 5.0 s, 1322.4 tps, lat 7.336 ms stddev 5.620
progress: 10.0 s, 65.4 tps, lat 152.849 ms stddev 817.220
progress: 15.0 s, 1290.6 tps, lat 7.747 ms stddev 7.269
progress: 20.0 s, 1321.2 tps, lat 7.573 ms stddev 12.604
progress: 25.0 s, 1259.6 tps, lat 7.939 ms stddev 6.646
progress: 30.0 s, 1054.2 tps, lat 9.449 ms stddev 13.455
progress: 35.0 s, 1170.0 tps, lat 8.553 ms stddev 7.078
progress: 40.0 s, 329.4 tps, lat 12.139 ms stddev 17.492
progress: 45.0 s, 0.0 tps, lat -nan ms stddev -nan
progress: 50.0 s, 907.6 tps, lat 28.686 ms stddev 401.343
progress: 55.0 s, 870.2 tps, lat 11.476 ms stddev 15.498
progress: 60.0 s, 731.4 tps, lat 13.680 ms stddev 13.728
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
duration: 60 s
number of transactions actually processed: 51618
latency average = 11.600 ms
latency stddev = 136.559 ms
tps = 859.558130 (including connections establishing)
tps = 859.970107 (excluding connections establishing)
```

```language
starting vacuum...end.
progress: 5.0 s, 982.8 tps, lat 9.648 ms stddev 9.643
progress: 10.0 s, 1523.4 tps, lat 6.761 ms stddev 8.916
progress: 15.0 s, 1040.1 tps, lat 6.751 ms stddev 4.639
progress: 20.0 s, 970.3 tps, lat 13.375 ms stddev 133.228
progress: 25.0 s, 1390.4 tps, lat 7.188 ms stddev 5.540
progress: 30.0 s, 1446.8 tps, lat 6.912 ms stddev 4.797
progress: 35.0 s, 1477.4 tps, lat 6.765 ms stddev 5.020
progress: 40.0 s, 1280.0 tps, lat 7.813 ms stddev 12.168
progress: 45.0 s, 286.4 tps, lat 6.612 ms stddev 4.137
progress: 50.0 s, 320.8 tps, lat 56.468 ms stddev 602.474
progress: 55.0 s, 935.2 tps, lat 10.693 ms stddev 12.328
progress: 60.0 s, 648.8 tps, lat 15.412 ms stddev 21.069
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
duration: 60 s
number of transactions actually processed: 61522
latency average = 9.742 ms
latency stddev = 104.888 ms
tps = 1023.280964 (including connections establishing)
tps = 1023.637281 (excluding connections establishing)
```

```language
starting vacuum...end.
progress: 5.0 s, 728.4 tps, lat 13.621 ms stddev 96.155
progress: 10.0 s, 1027.6 tps, lat 9.743 ms stddev 9.076
progress: 15.0 s, 1054.8 tps, lat 9.488 ms stddev 7.943
progress: 20.0 s, 1185.4 tps, lat 8.435 ms stddev 7.259
progress: 25.0 s, 939.6 tps, lat 10.634 ms stddev 17.809
progress: 30.0 s, 412.2 tps, lat 11.595 ms stddev 12.108
progress: 35.0 s, 928.5 tps, lat 16.404 ms stddev 179.967
progress: 40.0 s, 1534.8 tps, lat 6.513 ms stddev 4.920
progress: 45.0 s, 1539.6 tps, lat 6.497 ms stddev 4.412
progress: 50.0 s, 1425.8 tps, lat 7.011 ms stddev 10.369
progress: 55.0 s, 1426.5 tps, lat 6.654 ms stddev 5.025
progress: 60.0 s, 0.0 tps, lat -nan ms stddev -nan
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
duration: 60 s
number of transactions actually processed: 61037
latency average = 10.181 ms
latency stddev = 109.965 ms
tps = 981.503017 (including connections establishing)
tps = 981.572300 (excluding connections establishing
```



## Benchmarking pg9 from RASARD01

From curr dir
>  cd "C:\Program Files\PostgreSQL\13\bin"

Open psql in powershell CLI
> $env:PGPASSWORD='Abcd1234'; .\psql -h 192.168.59.27 -p 6432 -U postgres

Per time (60 secs) showing progress every 5 secs
> $env:PGPASSWORD='Abcd1234'; .\pgbench -U postgres -h 192.168.59.27 -p 7432 -c 10 -j 2 -T 60 -P 5 benchmarks
