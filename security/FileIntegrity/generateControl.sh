#!/usr/bin/env sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "$DIR/config.sh"

mkdir -p "$DIR/hashes/$HOST"

sh "$DIR/getHashes.sh" > "$DIR/hashes/$HOST/control.txt"
