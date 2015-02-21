#!/usr/bin/env bash

if [[ ! $# -eq 2 || $1 == "help" ]]; then
    echo "Usage: $0 <hosts-pattern> <command>"
    exit 0
fi

#
HOST_PATTERN=$1
COMMAND=$2

#
ansible \
    ${HOST_PATTERN} \
    --inventory-file=hosts \
    --one-line \
    -m shell -a "${COMMAND}"