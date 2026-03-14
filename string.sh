#!/bin/bash

# --- Bash String Operations ---

# 1. String Declaration
str1="Hello"
str2="World"

# 2. String Concatenation
greeting="$str1 $str2"
echo "Concatenation: $greeting"

# 3. String Length (number of characters)
echo "Length of str1 ('$str1'): ${#str1}"

# 4. Substring Extraction
# Syntax: ${string:position:length}
text="Bash scripting is fun"
substring="${text:5:9}"
echo "Substring (from index 5, length 9): $substring"

# 5. String Replacement
# Syntax: ${string/search/replace} (replaces first occurrence)
# Syntax: ${string//search/replace} (replaces all occurrences)
echo "Replace 'is' with 'can be': ${text/is/can be}"

# 6. Check if string is empty
empty_str=""
if [ -z "$empty_str" ]; then
    echo "The variable empty_str is empty (-z)"
fi

if [ -n "$str1" ]; then
    echo "The variable str1 is not empty (-n)"
fi

# 7. String Comparison
if [ "$str1" == "Hello" ]; then
    echo "str1 is equal to 'Hello'"
fi

if [ "$str1" != "$str2" ]; then
    echo "str1 is not equal to str2"
fi

# 8. String Default Values
# ${var:-default_value} returns default if var is unset/empty
unset uninitialized_var
echo "Default value: ${uninitialized_var:-"This is a fallback value"}"

# 9. Case Conversion (Requires Bash 4.0+)
mixed_case="BaSh ScRiPtInG"
echo "Uppercase: ${mixed_case^^}"
echo "Lowercase: ${mixed_case,,}"

# 10. Removing Prefix or Suffix
filename="report.tar.gz"
# Remove shortest match from end (%)
echo "Remove shortest suffix: ${filename%.*}"   # report.tar
# Remove longest match from end (%%)
echo "Remove longest suffix: ${filename%%.*}"   # report

path="/var/log/syslog"
# Remove shortest match from beginning (#)
echo "Remove shortest prefix: ${path#*/}"   # var/log/syslog
# Remove longest match from beginning (##)
echo "Remove longest prefix: ${path##*/}"   # syslog  (similar to basename)

# 11. String Splitting / Creating an array from a string
csv_data="apple,banana,cherry"
IFS="," read -r -a fruits_array <<< "$csv_data"
echo "First fruit: ${fruits_array[0]}"
echo "All fruits: ${fruits_array[@]}"

# 12. Pattern Matching in [[ ]]
file="image.png"
if [[ $file == *.png ]]; then
    echo "This is a PNG file based on pattern matching"
fi

# 13. Regular expression matching in [[ ]]
email="user@example.com"
if [[ $email =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$ ]]; then
    echo "Valid email format."
fi
