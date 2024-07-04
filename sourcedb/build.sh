#!/bin/bash
# build.sh
# Conversion of build.cmd to a shell script.

docker build -t gilhari5_source_mysql_local:3.0 .
docker images