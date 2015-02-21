#!/bin/bash

if [[ ! $# -eq 2 || $1 == "help" ]]; then
    echo "Usage: $0 <role-name> <role-out-file>"
    exit 0
fi

ROLE_NAME=$1
ROLE_OUT_FILENAME=$2

# remove old dirs
rm -rf roles/${ROLE_NAME}
rm -rf roles/${ROLE_OUT_FILENAME}

# download role
ansible-galaxy \
    install \
    --roles-path=roles/ \
    --force \
    ${ROLE_NAME}

# move role to required dir
mv roles/${ROLE_NAME} roles/${ROLE_OUT_FILENAME}