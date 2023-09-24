#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "$(cliphist list | sed 's/^[0-9]*//' | sed 's/	//')"
else
    echo "$(cliphist decode <<<"$1" | wl-copy | sed 's/^[0-9]*//' | sed 's/	//')"
fi
