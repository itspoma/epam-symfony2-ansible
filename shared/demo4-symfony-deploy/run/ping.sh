#!/usr/bin/env bash

if [[ $1 == "help" ]]; then
    echo "Usage: $0 <hosts-pattern>"
    exit 0
fi

#
if [ ! -z "$1" ]; then
    HOST_PATTERN=$1
else
    HOST_PATTERN="all"
fi

ARGS=""
ARGS="${ARGS} ${HOST_PATTERN}"
ARGS="${ARGS} --inventory-file hosts"
ARGS="${ARGS} --one-line"
ARGS="${ARGS} -m ping"

#
ansible ${ARGS}