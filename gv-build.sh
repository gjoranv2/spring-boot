#!/bin/bash

set -e
set -x

if [ "$(uname)" != "Darwin" ]; then
    free -m
fi

df -h
df -h .

travis_wait 45 ./mvnw install -T 2.0C -q -U -DskipTests=true -Pfast -Dmaven.test.redirectTestOutputToFile=true

./mvnw install -T 2.0C -q -nsu -Dmaven.test.redirectTestOutputToFile=true -P '!integration'
