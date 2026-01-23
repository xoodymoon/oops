# OOPS

A shell utility for the automatic execution of the previous command with elevated privileges.

## Description
The oops utility is designed for Linux users who frequently execute commands that require root permissions. Instead of re-typing the command with sudo, the user can simply type 'oops'. The script retrieves the last executed command from the shell history and re-runs it within a sudo bash subshell.

## Features
- **One-Line Installation**: Remote installation script for rapid deployment.
- **Pipe Support**: Uses 'bash -c' to ensure that piped commands and redirects handle permissions correctly.
- **Infinite Loop Protection**: Logic to prevent the script from attempting to sudo itself.
- **Dual Shell Support**: Compatible with both Bash and Zsh environments.

## Installation
Execute the following command to download and install oops automatically:

curl -sSL https://raw.githubusercontent.com/xoodymoon/oops/main/install.sh | bash

## Usage
$ pacman -Syu
error: you cannot perform this operation unless you are root.

$ oops
Running: sudo bash -c "pacman -Syu"
[sudo] password for user:

## Technical Implementation
The tool functions by accessing the second-to-last entry in the shell history (history 2), cleaning the string via sed, and executing it through a privileged eval call.

---
License: MIT
Author: xoodymoon

