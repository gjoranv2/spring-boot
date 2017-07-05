#!/bin/bash
# Copyright 2017 Yahoo Holdings. Licensed under the terms of the Apache 2.0 license. See LICENSE in the project root.
set -e
set -x

if [ "$(uname)" != "Darwin" ]; then
    free -m
fi

df -h
df -h .

#SOURCE_DIR=~/spring-boot
NUM_CORES=$(nproc --all)

#mkdir "${SOURCE_DIR}"
#git clone --no-hardlinks /spring-boot "${SOURCE_DIR}"

#cd "${SOURCE_DIR}"

whoami
cd spring-boot
pwd
ls -l

exit 12

time ./mvnw install -q -U -DskipTests=true -Pfast -Dmaven.test.redirectTestOutputToFile=true
time ./mvnw install -q -nsu -Dmaven.test.redirectTestOutputToFile=true -P '!integration'

#MAVEN_OPTS="-Xms128m -Xmx512m" mvn install -Dmaven.test.redirectTestOutputToFile=true
#time mvn install -q -U -DskipTests=true -Pfast -Dmaven.test.redirectTestOutputToFile=true
#time mvn install -q -nsu -Dmaven.test.redirectTestOutputToFile=true -P '!integration'

echo "Success!"
