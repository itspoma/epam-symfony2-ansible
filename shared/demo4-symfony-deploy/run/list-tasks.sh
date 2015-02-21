#!/usr/bin/env bash

if [[ ! $# -eq 1 || $1 == "help" ]]; then
    echo "Usage: $0 <hosts-pattern>"
    exit 0
fi

#
HOST_PATTERN=$1

#
ansible-playbook \
    playbook.yml \
    --limit="${HOST_PATTERN}" \
    --inventory-file=hosts \
    --list-tasks