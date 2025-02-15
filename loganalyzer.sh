#!/usr/bin/env bash

# loganalyzer.sh: search a logfile for keyword print and count keyword lines.
# Author: 0xA2F
# Date: 11-02-2025

set -euo pipefail

# Set script name
SCRIPT_NAME=$(basename "$0")

# Usage instructions
usage() {
    echo
    echo "Usage: $SCRIPT_NAME <keyword>"
}

# Log script errors
error() {
    echo "Error: $SCRIPT_NAME: $1" >&2
}

# Validate input
if [[ $# -lt 1 || $# -gt 2 ]]; then 
    usage
    exit 2
fi 

# Set source file
PATTERN=$1
LOG_FILE=${2:-.}

# Validate log file
if [[ ! -r "$LOG_FILE" ]]; then
    error "Log file '$LOG_FILE' issue"
    exit 2
fi 

# Check search method
if command -v ack > /dev/null 2>&1; then 

    # Perform search 
    ack -i "$PATTERN" "$LOG_FILE"
else 
    # Default to grep 
    grep "$PATTERN" "$LOG_FILE" | tee /dev/tty | wc -l

fi 
