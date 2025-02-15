#!/usr/bin/env bash

# procmon.sh: Monitors for a specific process (by name) then logs when the process starts and stops
# Author: 0xA2F
# Date: 13-02-2025

# Enable strict error handling
set -euo pipefail

# Set script name
SCRIPT_NAME=$(basename "$0")

# Usage instructions
usage() {
    echo "Usage: $SCRIPT_NAME <process_name>"
    exit 1
}

# Log errors
error() {
    echo "Error: $SCRIPT_NAME $1" >&2
}

# Validate inputs
if [[ $# -ne 1 ]]; then 
    usage
fi 

# Setup up logfile
PROCESS_NAME="$1"
LOGFILE="procmon.log"

# Initialize last_state to indicate the process is not running.
last_state=0

echo "Monitoring process '$PROCESS_NAME' (logging to $LOGFILE)..."
echo "Monitoring process '$PROCESS_NAME' (logging to $LOGFILE)..." >> "$LOGFILE"

while true; do
    # Check if the process is running using pgrep.
    if pgrep -f "$PROCESS_NAME" > /dev/null; then
        current_state=1
    else
        current_state=0
    fi
    
    # If the state has changed, print and log the event.
    if [ "$current_state" -ne "$last_state" ]; then
        TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
        if [ "$current_state" -eq 1 ]; then
            message="$TIMESTAMP - Process '$PROCESS_NAME' started."
        else
            message="$TIMESTAMP - Process '$PROCESS_NAME' stopped."
        fi
        echo "$message"
        echo "$message" >> "$LOGFILE"
        last_state=$current_state
    fi
    
    sleep 5
done
