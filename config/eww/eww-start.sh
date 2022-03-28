#!/bin/bash

# Startup script for the eww widget collection

if [[ -z $(command -h eww) ]]
then
    ${EWW_BINARY}&
    PID_DAEMON=$!
else
    eww &
    PID_DAEMON=$!
fi

# Prepare the daemon directory for any scripts
mkdir -p /run/user/$(id -u)/eww-scripts

# Execute scripts
for f in ./scripts/*
do
    $f &
done

wait $PID_DAEMON
