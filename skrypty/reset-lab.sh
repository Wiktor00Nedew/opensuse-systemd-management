#!/bin/bash

if cd $DOCKER_DIR/$1 > /dev/null 2>&1 && docker-compose down > /dev/null 2>&1 && docker-compose up -d > /dev/null 2>&1 ; then
    echo 1
else
    echo 0
fi
