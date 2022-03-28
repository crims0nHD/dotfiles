#!/bin/bash

# Poll the qtile daemon for the workspace config and currently selected workspace

if [[ -z "${POLL_TIMEOUT}" ]]
then
    POLL_TIMEOUT=1
fi

while true
do

    sleep ${POLL_TIMEOUT}
done
