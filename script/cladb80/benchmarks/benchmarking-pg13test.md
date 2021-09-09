# Benchmarking PostgreSQL

## Benchmarking for PG 13 TEST

Opening bash shell on _pg13test_ container
> docker exec -it pg13test /bin/bash

Creating new database in psql
> create database benchmarks

Initializing benchmarking application
> pgbench -h localhost -U postgres -i benchmarks

```
I have no name!@a7b9efc4014a:/$ pgbench -h localhost -U postgres -i benchmarks
Password:
dropping old tables...
creating tables...
generating data (client-side)...
100000 of 100000 tuples (100%) done (elapsed 0.88 s, remaining 0.00 s)
vacuuming...
creating primary keys...
done in 19.40 s (drop tables 0.03 s, create tables 0.20 s, client-side generate 8.85 s, vacuum 8.06 s, primary keys 2.26 s).
I have no name!@a7b9efc4014a:/$
```

Example
> pgbench -U postgres -c 10 -j 2 -t 10000 benchmarks

## Results
```language
I have no name!@a7b9efc4014a:/$ pgbench -U postgres -c 10 -j 2 -t 10000 benchmarks
Password:
starting vacuum...end.
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
number of transactions per client: 10000
number of transactions actually processed: 100000/100000
latency average = 12.830 ms
tps = 779.398540 (including connections establishing)
tps = 779.468018 (excluding connections establishing)
I have no name!@a7b9efc4014a:/$
```

Per time (60 secs) showing progress every 5 secs
> export PGPASSWORD=Abcd1234;pgbench -U postgres -c 10 -j 2 -T 60 -P 5 benchmarks

```language
starting vacuum...end.
progress: 5.0 s, 140.6 tps, lat 68.903 ms stddev 54.905
progress: 10.0 s, 219.4 tps, lat 45.791 ms stddev 44.400
progress: 15.0 s, 610.6 tps, lat 16.405 ms stddev 16.858
progress: 20.0 s, 896.4 tps, lat 11.158 ms stddev 11.129
progress: 25.0 s, 882.8 tps, lat 11.296 ms stddev 15.030
progress: 30.0 s, 1108.6 tps, lat 9.043 ms stddev 8.978
progress: 35.0 s, 1118.2 tps, lat 8.940 ms stddev 9.517
progress: 40.0 s, 992.4 tps, lat 10.064 ms stddev 11.044
progress: 45.0 s, 944.2 tps, lat 10.593 ms stddev 12.495
progress: 50.0 s, 950.4 tps, lat 10.522 ms stddev 10.333
progress: 55.0 s, 835.2 tps, lat 11.963 ms stddev 12.562
progress: 60.0 s, 880.0 tps, lat 11.366 ms stddev 11.378
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
duration: 60 s
number of transactions actually processed: 47904
latency average = 12.500 ms
latency stddev = 17.372 ms
tps = 798.265945 (including connections establishing)
tps = 798.576075 (excluding connections establishing)
```

```language
starting vacuum...end.
progress: 5.0 s, 699.4 tps, lat 13.807 ms stddev 24.192
progress: 10.0 s, 166.4 tps, lat 61.356 ms stddev 58.909
progress: 15.0 s, 314.2 tps, lat 31.898 ms stddev 32.569
progress: 20.0 s, 414.6 tps, lat 24.083 ms stddev 25.418
progress: 25.0 s, 771.8 tps, lat 13.022 ms stddev 15.688
progress: 30.0 s, 933.2 tps, lat 10.719 ms stddev 12.622
progress: 35.0 s, 977.8 tps, lat 10.203 ms stddev 9.685
progress: 40.0 s, 909.2 tps, lat 10.846 ms stddev 12.006
progress: 45.0 s, 705.0 tps, lat 14.405 ms stddev 18.188
progress: 50.0 s, 942.0 tps, lat 10.612 ms stddev 12.380
progress: 55.0 s, 875.8 tps, lat 11.404 ms stddev 13.248
progress: 60.0 s, 919.2 tps, lat 10.891 ms stddev 12.979
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
duration: 60 s
number of transactions actually processed: 43153
latency average = 13.896 ms
latency stddev = 19.880 ms
tps = 719.109192 (including connections establishing)
tps = 719.179707 (excluding connections establishing)
```

```language
starting vacuum...end.
progress: 5.0 s, 132.0 tps, lat 73.183 ms stddev 76.090
progress: 10.0 s, 103.5 tps, lat 94.406 ms stddev 94.473
progress: 15.0 s, 222.3 tps, lat 46.349 ms stddev 43.402
progress: 20.0 s, 315.6 tps, lat 31.701 ms stddev 31.224
progress: 25.0 s, 467.0 tps, lat 21.540 ms stddev 21.494
progress: 30.0 s, 572.4 tps, lat 17.427 ms stddev 18.806
progress: 35.0 s, 598.8 tps, lat 16.695 ms stddev 19.587
progress: 40.0 s, 380.2 tps, lat 26.384 ms stddev 68.477
progress: 45.0 s, 768.0 tps, lat 13.024 ms stddev 12.947
progress: 50.0 s, 706.0 tps, lat 14.126 ms stddev 15.873
progress: 55.0 s, 768.0 tps, lat 13.039 ms stddev 13.084
progress: 60.0 s, 825.8 tps, lat 12.084 ms stddev 12.989
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
duration: 60 s
number of transactions actually processed: 29304
latency average = 20.446 ms
latency stddev = 33.936 ms
tps = 488.270075 (including connections establishing)
tps = 488.417663 (excluding connections establishing)
```

## Benchmarking pg13test from RASARD01

From curr dir
>  cd "C:\Program Files\PostgreSQL\13\bin"

Open psql in powershell CLI
> $env:PGPASSWORD='Abcd1234'; .\psql -h 192.168.59.27 -p 6432 -U postgres

Per time (60 secs) showing progress every 5 secs
> $env:PGPASSWORD='Abcd1234'; .\pgbench -U postgres -h 192.168.59.27 -p 6432 -c 10 -j 2 -T 60 -P 5 benchmarks

### Results
```language
starting vacuum...end.
progress: 5.0 s, 101.9 tps, lat 90.785 ms stddev 83.002
progress: 10.0 s, 131.7 tps, lat 74.456 ms stddev 65.811
progress: 15.0 s, 239.3 tps, lat 42.653 ms stddev 47.904
progress: 20.0 s, 324.7 tps, lat 30.745 ms stddev 36.058
progress: 25.0 s, 432.5 tps, lat 22.888 ms stddev 26.566
progress: 30.0 s, 594.6 tps, lat 17.051 ms stddev 14.976
progress: 35.0 s, 569.3 tps, lat 17.420 ms stddev 13.879
progress: 40.0 s, 519.8 tps, lat 19.402 ms stddev 19.089
progress: 45.0 s, 543.5 tps, lat 18.419 ms stddev 16.727
progress: 50.0 s, 529.3 tps, lat 18.897 ms stddev 15.323
progress: 55.0 s, 510.7 tps, lat 19.577 ms stddev 16.786
progress: 60.0 s, 515.5 tps, lat 19.401 ms stddev 18.631
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
duration: 60 s
number of transactions actually processed: 25067
latency average = 23.802 ms
latency stddev = 30.246 ms
tps = 417.671365 (including connections establishing)
tps = 418.142288 (excluding connections establishing)
```

```language
starting vacuum...end.
progress: 5.0 s, 327.2 tps, lat 30.152 ms stddev 40.719
progress: 10.0 s, 455.3 tps, lat 22.017 ms stddev 20.034
progress: 15.0 s, 552.0 tps, lat 18.119 ms stddev 17.202
progress: 20.0 s, 748.8 tps, lat 13.354 ms stddev 10.331
progress: 25.0 s, 758.4 tps, lat 13.178 ms stddev 10.587
progress: 30.0 s, 464.0 tps, lat 21.499 ms stddev 18.989
progress: 35.0 s, 559.3 tps, lat 17.929 ms stddev 13.527
progress: 40.0 s, 536.4 tps, lat 18.626 ms stddev 19.829
progress: 45.0 s, 623.6 tps, lat 16.028 ms stddev 12.536
progress: 50.0 s, 578.2 tps, lat 17.309 ms stddev 18.537
progress: 55.0 s, 570.0 tps, lat 17.556 ms stddev 17.210
progress: 60.0 s, 645.9 tps, lat 15.458 ms stddev 13.574
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
duration: 60 s
number of transactions actually processed: 34098
latency average = 17.581 ms
latency stddev = 18.044 ms
tps = 568.248037 (including connections establishing)
tps = 568.338761 (excluding connections establishing)
```

```language
starting vacuum...end.
progress: 5.0 s, 205.9 tps, lat 45.811 ms stddev 58.979
progress: 10.0 s, 122.5 tps, lat 84.653 ms stddev 67.536
progress: 15.0 s, 209.9 tps, lat 47.684 ms stddev 46.335
progress: 20.0 s, 485.4 tps, lat 20.720 ms stddev 21.276
progress: 25.0 s, 581.2 tps, lat 17.180 ms stddev 14.107
progress: 30.0 s, 452.9 tps, lat 22.117 ms stddev 19.732
progress: 35.0 s, 551.8 tps, lat 18.096 ms stddev 20.618
progress: 40.0 s, 533.9 tps, lat 18.720 ms stddev 20.220
progress: 45.0 s, 499.2 tps, lat 20.023 ms stddev 18.224
progress: 50.0 s, 548.2 tps, lat 18.282 ms stddev 15.841
progress: 55.0 s, 397.6 tps, lat 25.024 ms stddev 28.642
progress: 60.0 s, 449.3 tps, lat 22.325 ms stddev 17.841
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
duration: 60 s
number of transactions actually processed: 25199
latency average = 23.798 ms
latency stddev = 28.958 ms
tps = 419.467382 (including connections establishing)
tps = 419.544534 (excluding connections establishing)
```

```language
starting vacuum...end.
progress: 5.0 s, 547.8 tps, lat 17.999 ms stddev 13.844
progress: 10.0 s, 487.1 tps, lat 20.508 ms stddev 14.929
progress: 15.0 s, 505.9 tps, lat 19.780 ms stddev 14.473
progress: 20.0 s, 540.2 tps, lat 18.513 ms stddev 15.479
progress: 25.0 s, 598.9 tps, lat 16.698 ms stddev 13.041
progress: 30.0 s, 643.5 tps, lat 15.537 ms stddev 11.592
progress: 35.0 s, 556.0 tps, lat 17.977 ms stddev 15.328
progress: 40.0 s, 575.0 tps, lat 17.401 ms stddev 16.003
progress: 45.0 s, 533.1 tps, lat 18.692 ms stddev 40.373
progress: 50.0 s, 545.8 tps, lat 18.400 ms stddev 20.347
progress: 55.0 s, 481.4 tps, lat 20.712 ms stddev 23.260
progress: 60.0 s, 469.9 tps, lat 21.283 ms stddev 23.540
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
duration: 60 s
number of transactions actually processed: 32437
latency average = 18.485 ms
latency stddev = 19.828 ms
tps = 540.284717 (including connections establishing)
tps = 540.393431 (excluding connections establishing)
```

```language
starting vacuum...end.
progress: 5.0 s, 541.8 tps, lat 18.169 ms stddev 15.741
progress: 10.0 s, 503.8 tps, lat 19.845 ms stddev 23.044
progress: 15.0 s, 572.9 tps, lat 17.401 ms stddev 13.817
progress: 20.0 s, 614.2 tps, lat 16.322 ms stddev 13.085
progress: 25.0 s, 522.6 tps, lat 19.119 ms stddev 20.915
progress: 30.0 s, 505.5 tps, lat 19.822 ms stddev 19.869
progress: 35.0 s, 491.6 tps, lat 20.335 ms stddev 15.954
progress: 40.0 s, 526.0 tps, lat 19.016 ms stddev 19.767
progress: 45.0 s, 544.0 tps, lat 18.408 ms stddev 23.872
progress: 50.0 s, 550.0 tps, lat 18.168 ms stddev 16.683
progress: 55.0 s, 552.1 tps, lat 18.050 ms stddev 14.589
progress: 60.0 s, 369.9 tps, lat 27.098 ms stddev 49.695
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
duration: 60 s
number of transactions actually processed: 31483
latency average = 19.046 ms
latency stddev = 21.471 ms
tps = 524.411713 (including connections establishing)
tps = 524.520480 (excluding connections establishing)
```



### Results after hardware improvements (by Massimo, 08/09/2021)

```language
starting vacuum...end.
progress: 5.0 s, 837.2 tps, lat 11.797 ms stddev 11.849
progress: 10.0 s, 810.8 tps, lat 12.336 ms stddev 8.772
progress: 15.0 s, 712.0 tps, lat 14.039 ms stddev 9.543
progress: 20.0 s, 780.2 tps, lat 12.824 ms stddev 7.900
progress: 25.0 s, 734.0 tps, lat 13.626 ms stddev 8.873
progress: 30.0 s, 182.0 tps, lat 50.295 ms stddev 137.346
progress: 35.0 s, 678.4 tps, lat 15.969 ms stddev 52.838
progress: 40.0 s, 579.4 tps, lat 17.274 ms stddev 32.934
progress: 45.0 s, 762.8 tps, lat 13.105 ms stddev 14.455
progress: 50.0 s, 855.4 tps, lat 11.694 ms stddev 7.143
progress: 55.0 s, 828.2 tps, lat 12.076 ms stddev 7.949
progress: 60.0 s, 774.0 tps, lat 12.911 ms stddev 12.064
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 2
duration: 60 s
number of transactions actually processed: 42674
latency average = 14.048 ms
latency stddev = 28.525 ms
tps = 711.098152 (including connections establishing)
tps = 711.219591 (excluding connections establishing)
```

```language

```