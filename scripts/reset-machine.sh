#!/bin/bash

if cd $DOCKER_DIR/$1 > /dev/null 2>&1 && docker-compose stop $2 > /dev/null 2>&1 && docker-compose rm -f $2 > /dev/null 2>&1 && docker-compose up -d $2 > /dev/null 2>&1 ; then
    exit 0
else
    exit 1
fi
