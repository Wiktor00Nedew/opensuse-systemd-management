#!/bin/bash

machineCount=0
sum=0

for lab in $(docker ps -a --format '{{.Label "com.docker.compose.project"}}' | sort | uniq); do # maybe replace with docker compose ls -a
    for row in $(docker ps -a --filter label=com.docker.compose.project=$lab --format '{{.State}}'); do
        if [[ $row == running ]]; then
            ((sum++))
        fi
        ((machineCount++))
    done
    var=$(( ($sum * 100 + $machineCount/2) / $machineCount ))
    echo "$lab:$var" # $(echo $var | awk '{print int($1+0.5)}')"
    sum=0
    machineCount=0
done
