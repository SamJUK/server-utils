#!/usr/bin/env sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "$DIR/config.sh"

find "$FOLDER" -type f $EXTRA  -exec md5sum {} +
