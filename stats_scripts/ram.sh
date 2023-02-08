#!/bin/bash

ava=$(cat /proc/meminfo | grep '^MemAvailable: ' | awk '{print $2/1024/1024}')
total=$(cat /proc/meminfo | grep '^MemTotal: ' | awk '{print $2/1024/1024}')

awk '{print $1-$2}' <<< "$total $ava"
