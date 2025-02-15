#!/usr/bin/env bash

# filestats.sh: Check if file exits, then print number lines, words ands characrer in file.
# Author: 0xA2F
# License: MIT
set -eu

# Intial setup
PROGRAM=$(basename "$0")

# Report errors
error() {
    echo "Error: $PROGRAM: $1" >&2
}

# Validate arguements
if [[ $# -eq 0 ]]; then 
    error "No filenames provided"
    exit 1
fi 

# Print file info
for file in "${@}"; do 
    if [[ ! -f "$file" ]]; then 
        error "File $file doesn't exist"
        continue
    fi 

    LINES=$(wc -l < "$file")
    WORDS=$(wc -w < "$file")
    CHARS=$(wc -c < "$file")

    echo "Statistics for '$file'"
    echo "------------------------------"
    echo "Lines      : $LINES"
    echo "Words      : $WORDS"
    echo "Characters : $CHARS"
    echo ""
done
