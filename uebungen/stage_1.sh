#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

[ "${SHELLCHECK:-0}" == "1" ] && shellcheck "$0"

target_directory="$1"

cd "$target_directory"

find . -type f -printf '%p ' -exec mimetype -b {} \; | grep 'text/plain' | cut -d' ' -f1
