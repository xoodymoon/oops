#!/bin/bash

# This is a function. Think of it as a 'saved recipe' 
# that the terminal can cook whenever you say the name.
oops() {
    # 'fc -ln -1' is a secret code that tells the computer:
    # "Get the (1) last command from the history, and (n) don't show the line number."
    # 'sed' cleans up any extra empty spaces.
    local last_cmd=$(fc -ln -1 | sed 's/^[[:space:]]*//')

    # This 'if' check makes sure you actually typed something before.
    if [ -z "$last_cmd" ]; then
        echo "Nothing to fix!"
        return 1
    fi

    # This is where the magic happens. 
    # It prints what it's about to do, then 'eval' runs it.
    echo "Running with sudo: $last_cmd"
    eval "sudo $last_cmd"
}
