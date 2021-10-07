# Benchmarking PostgreSQL

## Benchmarking for PG 13

Opening bash shell on _pg13_ container
> docker exec -it pg13 /bin/bash

log to psql
> export PGPASSWORD=PiattoRiccoMiCiFicco69; psql -h localhost -U postgres

Creating new database in psql
> create database benchmarks

Exit psql and initialize benchmarking application
> export PGPASSWORD=PiattoRiccoMiCiFicco69;pgbench -h localhost -U postgres -i benchmarks

```
dropping old tables...
creating tables...
generating data (client-side)...
100000 of 100000 tuples (100%) done (elapsed 0.07 s, remaining 0.00 s)
vacuuming...
creating primary keys...
done in 21.78 s (drop tables 0.00 s, create tables 0.37 s, client-side generate 11.97 s, vacuum 8.37 s, primary keys 1.06 s).
I have no name!@0c1433e512ef:/$
```

Per number of transactions (10000)
> export PGPASSWORD=PiattoRiccoMiCiFicco69;pgbench -U postgres -c 10 -j 2 -t 10000 benchmarks

```language
starting vacuum...end.
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
number of transactions per client: 10000
number of transactions actually processed: 100000/100000
latency average = 12.485 ms
tps = 800.977050 (including connections establishing)
tps = 801.435317 (excluding connections establishing)
```

```language
starting vacuum...end.
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
number of transactions per client: 10000
number of transactions actually processed: 100000/100000
latency average = 9.091 ms
tps = 1099.935891 (including connections establishing)
tps = 1100.154668 (excluding connections establishing)
I have no name!@0c1433e512ef:/$
```

```language
starting vacuum...end.
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
number of transactions per client: 10000
number of transactions actually processed: 100000/100000
latency average = 8.052 ms
tps = 1241.901736 (including connections establishing)
tps = 1242.043430 (excluding connections establishing)
I have no name!@0c1433e512ef:/$
```

```language
starting vacuum...end.
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
number of transactions per client: 10000
number of transactions actually processed: 100000/100000
latency average = 9.967 ms
tps = 1003.308667 (including connections establishing)
tps = 1003.446765 (excluding connections establishing)
I have no name!@0c1433e512ef:/$
```

```language
starting vacuum...end.
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
number of transactions per client: 10000
number of transactions actually processed: 100000/100000
latency average = 7.553 ms
tps = 1323.972547 (including connections establishing)
tps = 1324.119200 (excluding connections establishing)
I have no name!@0c1433e512ef:/$
```

Per time (60 secs) showing progress every 5 secs
> export PGPASSWORD=PiattoRiccoMiCiFicco69;pgbench -U postgres -c 10 -j 2 -T 60 -P 5 benchmarks

```language
starting vacuum...end.
progress: 5.0 s, 39.4 tps, lat 6.537 ms stddev 4.512
progress: 10.0 s, 1118.7 tps, lat 17.461 ms stddev 248.666
progress: 15.0 s, 1392.6 tps, lat 7.176 ms stddev 5.716
progress: 20.0 s, 1112.8 tps, lat 8.986 ms stddev 7.119
progress: 25.0 s, 937.6 tps, lat 10.663 ms stddev 16.019
progress: 30.0 s, 1414.6 tps, lat 7.071 ms stddev 5.394
progress: 35.0 s, 1427.8 tps, lat 7.001 ms stddev 7.237
progress: 40.0 s, 1519.4 tps, lat 6.583 ms stddev 5.143
progress: 45.0 s, 1490.0 tps, lat 6.707 ms stddev 6.499
progress: 50.0 s, 1404.8 tps, lat 7.121 ms stddev 10.976
progress: 55.0 s, 1572.2 tps, lat 6.356 ms stddev 4.510
progress: 60.0 s, 880.0 tps, lat 11.363 ms stddev 21.840
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
duration: 60 s
number of transactions actually processed: 71558
latency average = 8.377 ms
latency stddev = 70.174 ms
tps = 1190.368295 (including connections establishing)
tps = 1190.771624 (excluding connections establishing)
I have no name!@0c1433e512ef:/$
```