#!/bin/bash

docker ps -a --filter label=com.docker.compose.project=$1 --format '{{.Label "com.docker.compose.service"}}:{{.State}}'
