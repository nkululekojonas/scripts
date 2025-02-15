#!/usr/bin/env bash

# backup.sh: Create compressed tarball backup of given directory paths.
# Author: 0xA2F
# Date: 09-02-2025

# Enable strict error handling
set -euo pipefail

# Inital variables
PROGNAME=$(basename "$0")
CURR_DATE=$(date +%F_%H-%M-%S)

# Log error
error() {
    echo "Error: $PROGNAME: $1" >&2
}

# Usage instructions
usage() {
    echo "Usage: $PROGNAME <source ...>"
    exit 1
}

# Validate variables
if [[ $# -eq "0" ]]; then 
    usage
fi 

# Set initial variables
SOURCE_DIR="$1"

# Validate directory
if [[ ! -d "$SOURCE_DIR" ]]; then 
    error "'$SOURCE_DIR': not a valid direcory"
    exit 1
fi 

# Sanitize backup filename
DIR_NAME=$(basename "$SOURCE_DIR")
BACKUP_FILE="${DIR_NAME}_backup_${CURR_DATE}.tar.gz"

# Create backup
if tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$DIR_NAME"; then
    echo "Backup successful: $SOURCE_DIR -> $BACKUP_FILE"
    exit 0
else 
    error "$SOURCE_DIR backup failed"
    exit 2
fi
