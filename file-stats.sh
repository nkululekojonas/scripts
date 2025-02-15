#!/usr/bin/env bash

# file-stats: Check if files exists and print the size and last modification date
# Author: 0x2AF
# Date: 15-02-2025

# Enable strict error handling
set -u

# Set script name
SCRIPT_NAME=$(basename "$0")

# Log errors
error() {
    echo "Error: $SCRIPT_NAME: $1" >&2
}

# Usage instructions
usage() {
    echo "Usage: $SCRIPT_NAME <file ...>"
}

# Validate inputs
if [[ $# -eq 0 ]]; then 
    usage
    exit 1
fi 

# Iterate over files and check they exists
for file in "$@"; do 
    if [[ ! -f "$file" ]]; then
        error "$file not found"

        # Continue with next file instead of exiting
        continue
    else 
        echo "${file}:"
        if command -v gstat > /dev/null 2>&1; then 
           gstat --format="Size: %s bytes, Modified: %y" "$file" || error "$file stat issue"
        else 
           # Format might need adjustment based on your system's stat command
           stat -f "Size: %z bytes, Modified: %Sm" "$file" || error "$file stat issue"
        fi 
        echo ""
    fi 
done
