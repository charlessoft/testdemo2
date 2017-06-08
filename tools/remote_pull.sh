#!/bin/bash 
ssh root@10.142.55.177 " \
    cd /mnt/apps/basin-content; \
    git pull origin master
    "
