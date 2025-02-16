#!/usr/bin/env bash

# guess.sh: Randomly generates a number between 1 and 100, then prompts the user to guess
# Author: 0xA2F
# Date: 16-02-2025

# Generate random number
number=$(( RANDOM % 100 + 1 ))

# Initialise $REPLY
REPLY=0

while true; do 
    # Prompt user for a number
    read -r -p "Guess a number between 1 and 100: " REPLY

    # Ensure input is a number
    if ! [[ "$REPLY" =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Please enter a number."
        continue
    fi

    # Convert input to integer
    guess=$((REPLY))

    # Compare guess with the target number
    if (( guess > number )); then
        echo "Too high! Try again."
    elif (( guess < number )); then
        echo "Too low! Try again."
    else
        echo "Congratulations! You guessed the correct number: $number"
        break
    fi
done
