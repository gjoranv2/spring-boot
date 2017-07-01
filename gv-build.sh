#!/bin/bash

set -e
set -x

if [ "$(uname)" != "Darwin" ]; then
    free -m
fi

df -h
df -h .

time ./mvnw install -q -U -DskipTests=true -Pfast -Dmaven.test.redirectTestOutputToFile=true

time ./mvnw install -q -nsu -Dmaven.test.redirectTestOutputToFile=true -P '!integration'
