#!/bin/bash

# ==========================================
# Sed (Stream Editor) Example
# ==========================================
# `sed` is a powerful text processing tool used for filtering and transforming text.
# It is mostly used for text substitution (find and replace).

# Let's create a temporary file to work with
temp_file="sed_demo.txt"
cat << EOF > $temp_file
apple is healthy
banana is sweet
apple is a fruit
EOF

echo "--- Original File ---"
cat $temp_file

echo -e "\n--- Replace first occurrence of 'apple' with 'orange' on each line ---"
# s means substitute, /search/replace/
sed 's/apple/orange/' $temp_file

echo -e "\n--- Replace ALL occurrences of 'apple' with 'orange' (Global - g) ---"
# Add 'g' at the end for global replacement
sed 's/apple/orange/g' $temp_file

echo -e "\n--- Delete lines containing 'banana' (-d) ---"
sed '/banana/d' $temp_file

echo -e "\n--- In-place editing (-i) ---"
echo "Run: sed -i 's/healthy/delicious/' sed_demo.txt to modify the file directly."

# Clean up
rm -f $temp_file

# ==========================================
# Advanced Sed Examples
# ==========================================

echo -e "\n--- Advanced Sed Usage ---"

# Create a more complex file
advanced_file="sed_advanced.txt"
cat << EOF > $advanced_file
1. apple
2. orange
3. banana
4. apple and banana
# This is a comment
5. grapefruit
EOF

echo "--- Advanced Original File ---"
cat $advanced_file

echo -e "\n--- 1. Using a different delimiter ---"
# If your search strings contain '/', it's easier to use a different delimiter like '|' or ':'
# Let's say we want to replace 'apple' with '/usr/local/apple'
sed 's|apple|/usr/local/apple|' $advanced_file

echo -e "\n--- 2. Delete empty lines or comments ---"
# Delete lines starting with '#'
sed '/^#/d' $advanced_file

echo -e "\n--- 3. Print only specific lines (-n and p) ---"
# The -n flag suppresses automatic printing, 'p' tells it to print matching lines
echo "Printing lines 2 to 4:"
sed -n '2,4p' $advanced_file

echo -e "\n--- 4. Multiple commands in one sed string (-e) ---"
# Replace apple with pear AND banana with mango
sed -e 's/apple/pear/g' -e 's/banana/mango/g' $advanced_file

# Clean up
rm -f $advanced_file
