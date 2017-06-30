#!/bin/bash

set -e
set -x

if [ "$(uname)" != "Darwin" ]; then
    free -m
fi

df -h
df -h .

./mvnw install -q -U -DskipTests=true -Pfast -Dmaven.test.redirectTestOutputToFile=true

./mvnw install -q -nsu -Dmaven.test.redirectTestOutputToFile=true -P '!integration'
