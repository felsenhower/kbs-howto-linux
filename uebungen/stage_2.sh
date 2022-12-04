#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

[ "${SHELLCHECK:-0}" == "1" ] && shellcheck "$0"

target_directory="$1"

cd "$target_directory"

total_size=0

while read -r f ; do
    mimetype="$(mimetype -b "$f")"
    if [ "$mimetype" != "text/plain" ] ; then
        continue
    fi
    file_size="$(du -b "$f" | cut -f1)"
    total_size=$(( total_size + file_size ))
    echo "$f"
done < <(find . -type f)

printf 'Total file size: %d bytes\n' "$total_size"
