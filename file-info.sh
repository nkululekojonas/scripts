#!/usr/bin/env bash

# file-info: print file info or report error
# Author: Nkululeko Jonas
# License: MIT

set -eu

# Log error
error() {
    echo "Error: $1" >&2
}

# Set program name
PROGNAME="$(basename "$0")"

if [[ -e "$1" ]]; then 
    echo -e "\nFile Type:"
    file "$1" || { error "Error with $1"; exit 1; }
    echo -e "\nFile Status:"
    stat "$1" || { error "Error with $1"; exit 1; }
else 
    error "$PROGNAME: usage $PROGNAME file"
    exit
fi 

