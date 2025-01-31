#!/bin/sh
set -e

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

echo "Setting vm.overcommit_memory=1"
sysctl -w vm.overcommit_memory=1

exec "$@"
