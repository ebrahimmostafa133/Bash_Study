#!/bin/bash

# ==============================================================================
# BASH ARRAYS - THE COMPREHENSIVE GUIDE
# ==============================================================================
# Bash supports two types of arrays:
# 1. Indexed Arrays: Numerically indexed from 0 (supported by all Bash versions)
# 2. Associative Arrays: Key-Value pairs (requires Bash 4.0+)
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. INDEXED ARRAYS
# ------------------------------------------------------------------------------
echo "--- 1. INDEXED ARRAYS ---"

# A. Declaration & Initialization
declare -a OS_LIST                    # Explicit declaration
OS_LIST=("Linux" "macOS" "Windows")   # Initialization
mixed_array=("string" 42 3.14 true)   # Bash arrays can hold mixed simulated types

# B. Accessing Elements
echo "First element: ${OS_LIST[0]}"
echo "Third element: ${OS_LIST[2]}"

# C. Modifying & Appending
OS_LIST[1]="FreeBSD"                  # Overwrite existing element
OS_LIST[3]="macOS"                    # Add new element at a specific index
OS_LIST+=("Solaris" "OpenBSD")        # Append multiple elements to the end

# D. Array Information
echo "All elements (space-separated): ${OS_LIST[@]}"
echo "Total number of elements: ${#OS_LIST[@]}"
echo "All indices that are currently in use: ${!OS_LIST[@]}"
echo "Length of the first element's string: ${#OS_LIST[0]}"

# E. Looping through Indexed Arrays
echo -e "\nLooping through OS_LIST:"
for os in "${OS_LIST[@]}"; do
    echo " > $os"
done

echo -e "\nLooping using indices (useful if array has gaps):"
for index in "${!OS_LIST[@]}"; do
    echo " > Index $index contains: ${OS_LIST[$index]}"
done

# F. Slicing and Extracting
# Syntax: ${array[@]:offset:length}
echo -e "\nSlicing:"
echo "Elements from index 1 to 3: ${OS_LIST[@]:1:3}"

# G. Search and Replace in Arrays
# Syntax: ${array[@]/search/replace}
echo "Replace 'Linux' with 'GNU/Linux': ${OS_LIST[@]/Linux/GNU\/Linux}"

# H. Copying Arrays (Creating a true copy)
copied_array=("${OS_LIST[@]}")
echo "Copied array: ${copied_array[@]}"

# I. Removing Elements
unset OS_LIST[2]   # Remove the item at index 2 (leaves a gap in indices)
echo "After unsetting index 2, indices are: ${!OS_LIST[@]}"

# J. Destroying the Array
unset OS_LIST
echo "Array length after complete unset: ${#OS_LIST[@]}"

echo -e "\n==============================================================================\n"

# ------------------------------------------------------------------------------
# 2. ASSOCIATIVE ARRAYS (Dictionaries / Hash Maps)
# Note: Requires Bash 4.0 or newer
# ------------------------------------------------------------------------------
echo "--- 2. ASSOCIATIVE ARRAYS ---"

# A. Declaration (MUST use declare -A)
declare -A SERVER_CONFIG

# B. Initialization
SERVER_CONFIG=(
    ["host"]="192.168.1.100"
    ["port"]="8080"
    ["user"]="admin"
    ["status"]="active"
)

# C. Adding / Modifying Elements
SERVER_CONFIG["protocol"]="https"
SERVER_CONFIG["port"]="8443"    # This overwrites the existing "port"

# D. Accessing Elements
echo "Host: ${SERVER_CONFIG["host"]}"
echo "Port: ${SERVER_CONFIG["port"]}"

# E. Array Information
echo "All values: ${SERVER_CONFIG[@]}"
echo "All keys: ${!SERVER_CONFIG[@]}"
echo "Total number of key-value pairs: ${#SERVER_CONFIG[@]}"

# F. Checking if a Key Exists
# Use the -v flag with [[ ]] test operator
if [[ -v SERVER_CONFIG["timeout"] ]]; then
    echo "Timeout is configured."
else
    echo "Timeout is NOT configured."
fi

# G. Looping through Associative Arrays
echo -e "\nServer Configuration Details:"
for key in "${!SERVER_CONFIG[@]}"; do
    printf " %-10s : %s\n" "$key" "${SERVER_CONFIG[$key]}"
done

# H. Removing Keys and Destroying
unset SERVER_CONFIG["status"]   # Remove a specific key
echo "Keys after removing 'status': ${!SERVER_CONFIG[@]}"

unset SERVER_CONFIG             # Destroy the entire associative array
