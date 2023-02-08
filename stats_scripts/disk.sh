#!/bin/bash

df | grep ' /$' | awk '{print $3/1024/1024 "/" $2/1024/1024}'
