#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

[ "${SHELLCHECK:-0}" == "1" ] && shellcheck "$0"

find . -type f -printf '%Cs %s %p ' -exec mimetype -b {} \; | awk -v current_time="$(date '+%s')" '
BEGIN {
     total_size = 0
}{
    timestamp = $1;
    size = $2;
    name = $3;
    mimetype = $4;
    if (mimetype != "text/plain") {
        next;
    }
    if (current_time - timestamp > 86400) {
        next;
    }
    total_size += size;
    print(name);
} END {
    printf("Total size: %s bytes.\n", total_size);
}'
