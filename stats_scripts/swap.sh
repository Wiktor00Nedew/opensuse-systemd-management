#!/bin/bash

free=$(cat /proc/meminfo | grep '^SwapFree: ' | awk '{print $2/1024/1024}')
total=$(cat /proc/meminfo | grep '^SwapTotal: ' | awk '{print $2/1024/1024}')

awk '{print $1-$2}' <<< "$total $free"
