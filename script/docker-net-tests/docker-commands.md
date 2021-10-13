# docker commands

> docker run --rm -ti -v $PWD:$PWD -w $PWD -p 8080:8080 golang:1.13 go run main.go


# shell commands for test

> dd if=/dev/zero bs=1000000 count=100 | curl --data-binary @- 0:8080 | dd bs=1000000 of=/dev/null
