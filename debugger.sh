#!/bin/bash

# ==========================================
# Debugger Options (-x, -v, -e)
# ==========================================
# Bash provides built-in options to help debug scripts.
# 
# set -x : Print commands and their arguments as they are executed.
# set -v : Print shell input lines as they are read.
# set -e : Exit immediately if a command exits with a non-zero status.

echo "This line runs normally."

# Enable debugging (Print commands before running them)
set -x

echo "This command will be printed before execution."
result=$(( 5 + 5 ))
echo "Result is $result"

# Disable debugging
set +x

echo "Debugging disabled. This runs normally."

# Exit on error example
# echo "This won't print if 'set -e' is active and the above command fails."

# ==========================================
# Advanced Debugging Techniques
# ==========================================

echo -e "\n--- Advanced Debugging ---"

# 1. Debugging specific blocks of code
# Instead of debugging the whole script, you can wrap a specific section
echo "Normal execution..."
set -x # Turn on debugging for just this loop
for i in {1..3}; do
  echo "Processing item $i"
done
set +x # Turn off debugging
echo "Back to normal execution."

# 2. Trap command for debugging
# 'trap' allows you to execute commands when an error occurs or the script exits
handle_error() {
    # $? holds the exit status of the last command
    # $BASH_COMMAND holds the command that failed
    # $LINENO holds the line number
    echo "ERROR: Command '$BASH_COMMAND' failed with exit code $? on line $LINENO"
}

# Set the trap to call handle_error when any command fails (ERR signal)
# Note: This requires 'set -e' or 'set -E' to work reliably across functions
set -e
trap 'handle_error' ERR

echo "Let's force an error to trigger the trap:"
# We do it cautiously in a subshell or a command we expect to fail so the whole demo doesn't stop entirely if run directly
# Uncomment the line below to see the trap work
# cat /file_that_does_not_exist.txt

# Disable exit on error for the rest of the script
set +e
trap - ERR # Disable the trap

# 3. set -u (Exit on undefined variable)
# Highly recommended for catching typos in variable names
set -u
name="Alice"
# echo "Hello, $nam" # $nam is undefined. With set -u, this throws an error and exits.
echo "Hello, $name"
set +u
