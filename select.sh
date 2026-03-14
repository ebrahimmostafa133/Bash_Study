#!/bin/bash

# --- Bash 'readonly' ---
# The 'readonly' command marks variables or functions as unmodifiable.
readonly SCRIPT_VERSION="1.0"
echo "Script Version: $SCRIPT_VERSION"

# Uncommenting the next line would cause an error: "readonly variable"
# SCRIPT_VERSION="2.0" 

echo "-------------------------"

# --- Bash 'shift' ---
# 'shift' is used to parse command-line arguments by shifting the positional
# parameters ($1, $2, $3...) to the left. $2 becomes $1, $3 becomes $2, etc.
# $0 (the script name) is never shifted.

echo "Total initial arguments: $#"
if [ $# -gt 0 ]; then
    echo "First argument before shift: $1"
    shift
    echo "First argument AFTER shift (was the 2nd argument): $1"
    echo "Total arguments remaining: $#"
fi

echo "-------------------------"

# --- Bash 'select' Loop (Interactive Menus) ---

# The 'select' command provides an easy way to create numbered menus.
# It automatically prints a numbered list of the items, prompts the user
# with the PS3 variable, and reads their input.

# 1. Customizing the prompt
# By default, the prompt is "#? ". We can change it by modifying 'PS3'.
PS3="Please select an option (1-4): "

echo "=== Simple Menu Example ==="
# 2. Defining the menu options
options=("Option 1" "Option 2" "Option 3" "Quit")

# 3. The select loop
select opt in "${options[@]}"; do
    case $opt in
        "Option 1")
            echo "You chose Option 1. This could run a specific command."
            ;;
        "Option 2")
            echo "You chose Option 2."
            ;;
        "Option 3")
            echo "You chose Option 3."
            ;;
        "Quit")
            echo "Exiting the menu."
            break # Essential: This breaks out of the loop!
            ;;
        *)
            # If the user enters a number that doesn't correspond to an option,
            # $opt will be empty. The raw user input is stored in the $REPLY variable.
            echo "Invalid option: $REPLY. Please enter a number between 1 and ${#options[@]}."
            ;;
    esac
    # After the case statement, the select loop will automatically re-prompt
    # unless a 'break' command was executed.
done

echo "Script ($SCRIPT_VERSION) finished."
