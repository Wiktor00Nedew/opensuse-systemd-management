#!/bin/bash

if mkdir $DOCKER_DIR/$1  > /dev/null 2>&1 && cp -r /sftp/docker/build $DOCKER_DIR/$1/build  > /dev/null 2>&1 && cp /sftp/docker/$1.yml $DOCKER_DIR/$1/docker-compose.yml > /dev/null 2>&1 && cd $DOCKER_DIR/$1 > /dev/null 2>&1 && docker network create $1  > /dev/null 2>&1 && docker-compose up -d > /dev/null 2>&1 ; then
    echo 1
else
    echo 0
fi
