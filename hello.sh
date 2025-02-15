#!/usr/bin/env bash

# hello.sh: Print Hello, [name | World]! to stdout
# Author: /0xA2F
# License: MIT

if [[ ! $# -eq 0 ]]; then
    for name in "$@"; do
        echo "Hello, ${name}!"
    done
else 
    echo "Hello, World!"
fi 
