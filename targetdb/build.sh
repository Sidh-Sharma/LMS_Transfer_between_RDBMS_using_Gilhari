#!/bin/bash
# build.sh
# Conversion of build.cmd to a shell script.

docker build -t gilhari5_dest_postgres_local:2.0 .
docker images