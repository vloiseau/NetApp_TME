#!/bin/bash

set -ex

KILL_DYNAMO="ps -ef | grep dynamo | grep -v 'faiz89' | awk '{print \$2}' | xargs -r sudo kill -9"

for i in 136 138 140 142 144 146 163 165; do
    START_DYNAMO="sudo ./dynamo -i worker-138 -m worker-$i > /tmp/mylogfile 2>&1 \&"
    ssh -t $i << EOF
    # Kill any dynamo process already running
    eval $KILL_DYNAMO
    # Now start a fresh dynamo process
    if eval $START_DYNAMO; then
        echo "Dynamo successfully started on"
        hostname
    else
        echo "Problem with"
        hostname
    fi
EOF
done
 