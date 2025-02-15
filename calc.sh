#!/usr/bin/env bash

# calc.sh: Accept two numbers and an operator (+, -, *, or /) as command-line arguments and prints the result.
# Author: 0xA2F
# License: MIT

# Initial values
PROGNAME=$(basename "$0")

# Log error
err() {
    echo "$PROGNAME : Error: $1" >&2
    exit 2
}

# Usage instructions
usage() {
    echo "Usage: $PROGNAME <number1> <operator> <number2>"
    echo "Operators supported: +, -, *, / (or add, sub, mul, div)"
    echo "Example: $PROGNAME 5 + 3"
    exit 1
}

# Validate arguements
if [[ "$#" -ne 3 ]]; then 
    usage
fi 

# Get values 
OPERATION=$1
VALUE_1=$2
VALUE_2=$3

# Validate numbers
if ! [[ "$VALUE_1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$VALUE_2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
        err "Both operands must be numbers."
fi

# Perform operation 
case $OPERATION in 

    + | add) 
        echo "$VALUE_1 + $VALUE_2" | bc
        ;;
    - | sub) 
        echo "$VALUE_1 - $VALUE_2" | bc
        ;;
    '*' | mul)
        echo "$VALUE_1 * $VALUE_2" | bc
        ;;
    / | div)
        if [[ "$VALUE_2" == "" ]]; then 
            err "Division by zero"
        else 
            echo "scale=2; $VALUE_1 / $VALUE_2" | bc
        fi 
        ;;
    *)
        usage
        ;;
esac
