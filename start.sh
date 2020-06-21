#!/bin/sh
# /app/utils/launch.sh requires bash, which is overkill for our purposes

if test -z "$REMOTE_ADDR"; then
    REMOTE_ADDR="$REMOTE_HOST"
    if test -n "$REMOTE_PORT"; then
        REMOTE_ADDR="$REMOTE_ADDR:$REMOTE_PORT"
    fi
fi

/app/utils/websockify/run --web /app/build/ 80 "$REMOTE_ADDR"
