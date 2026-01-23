#!/bin/bash

oops() {
    # Get the last command accurately
    local last_cmd=$(history 2 | head -n 1 | sed 's/^[ ]*[0-9]*[ ]*//')

    if [[ "$last_cmd" == "oops" ]]; then
        echo "Error: Last command was already 'oops'."
        return 1
    fi

  
    echo "Executing: sudo bash -c \"$last_cmd\""
    eval "sudo bash -c \"$last_cmd\""
}
