#!/bin/bash

# --- Bash Functions ---

# 1. Defining a basic function
# Method A (standard)
function greet() {
    echo "Hello, world!"
}

# Method B (compatible with standard sh)
say_goodbye() {
    echo "Goodbye, world!"
}

# Calling a basic function
greet
say_goodbye

# 2. Functions with Parameters
# Function arguments are accessed using $1, $2, etc. (similar to script arguments)
greet_user() {
    local first_name=$1
    local last_name=$2
    echo "Hello, $first_name $last_name!"
}

greet_user "Alice" "Smith"
greet_user "Bob" "Jones"

# 3. Returning Values
# Bash functions do not return values like functions in C or Python.
# They only return an exit status (0-255).
# To actually "return" data, you typically echo it and capture it via command substitution.
get_system_uptime() {
    # Extract the uptime string
    local up=$(uptime -p)
    echo "$up" # This is the "returned" value
}

# Capture the output of the function
current_uptime=$(get_system_uptime)
echo "The system uptime is: $current_uptime"

# 4. Return Codes (Exit Status)
# Used to indicate success (0) or failure (non-zero)
check_file_exists() {
    local file_path=$1
    if [ -e "$file_path" ]; then
        return 0 # Success
    else
        return 1 # Failure
    fi
}

test_file="/tmp/test_file.txt"
if check_file_exists "$test_file"; then
    echo "File '$test_file' exists."
else
    echo "File '$test_file' does NOT exist."
fi

# 5. Local vs Global Variables
# Variables are global by default, even inside functions.
# Use the 'local' keyword to restrict scope.
global_var="I am global"

demonstrate_scope() {
    local local_var="I am local"
    global_var="I was changed inside the function"
    echo "Inside function: local_var = $local_var"
    echo "Inside function: global_var = $global_var"
}

demonstrate_scope
# Trying to access local_var outside the function will print nothing (or whatever it was set to globally)
echo "Outside function: local_var = $local_var"
echo "Outside function: global_var = $global_var"
