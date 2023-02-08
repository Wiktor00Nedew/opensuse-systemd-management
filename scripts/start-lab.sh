#!/bin/bash

if cd $DOCKER_DIR/$1 > /dev/null 2>&1 && docker-compose start > /dev/null 2>&1 ; then
    exit 0
else
    exit 1
fi
