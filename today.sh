#!/bin/bash

# today: show the time and date, lists all logged-in users, and gives the system uptime
# Author: Nkululeko Jonas
# License: MIT

# Define log directory and ensure it exits
LOG_DIR="$PWD/logs"
mkdir -p "$LOG_DIR"

# Generate log filename
LOG_FILE="$LOG_DIR/$(date '+%Y-%m-%d_%H-%M-%S').log"

# Capture Date and Time
NOW=$(date '+%Y-%m-%d %H:%M:%S')

# Print and log information
{
    echo "=============================="
    echo "Date and Time: $NOW"
    echo "------------------------------"
    echo "Logged-in Users:"
    w -h
    echo "------------------------------"
    echo "System Uptime:"
    uptime
    echo "=============================="
} | tee -a "$LOG_FILE"
