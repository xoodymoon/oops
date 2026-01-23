#!/bin/bash


OOPS_FUNCTION='
oops() {
    local last_cmd=$(history 2 | head -n 1 | sed "s/^[ ]*[0-9]*[ ]*//")
    if [[ "$last_cmd" == "oops" ]]; then
        echo "Error: Last command was already oops."
        return 1
    fi
    echo "Running: sudo $last_cmd"
    eval "sudo $last_cmd"
}'


if [ -f "$HOME/.bashrc" ]; then
    CONF="$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
    CONF="$HOME/.zshrc"
fi


if grep -q "oops()" "$CONF"; then
    echo "Oops is already installed in $CONF!"
else
    echo "$OOPS_FUNCTION" >> "$CONF"
    echo "Installed successfully to $CONF"
    echo "Please restart your terminal or run: source $CONF"
fi
