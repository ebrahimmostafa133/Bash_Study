# Bash Scripting Guide

Welcome to the Bash Scripting Guide! This directory contains a collection of simple, well-documented Bash scripts designed to help you learn and reference fundamental Bash concepts.

Each file is focused entirely on one core construct. To try any script, simply execute it from your terminal:

```bash
# Example: Running the string operations script
./string.sh
```

## Available Scripts

### 1. `string.sh` - String Operations
Demonstrates several common operations you need to work with text in Bash.
* **Topics covered:** Concatenation, length checking, substring extraction, string replacement, checking for empty strings (`-z`, `-n`), pattern/regex matching, and prefix/suffix removal.

### 2. `array.sh` - Arrays
A comprehensive guide to using both Indexed and Associative (Key/Value) Arrays in Bash.
* **Topics covered:** Declaration, initialization, accessing, looping, slicing, copying, replacing, and unsetting variables.

### 3. `functions.sh` - Custom Functions
Learn how to dry up your code by encapsulating logic into reusable functions.
* **Topics covered:** Function syntax, passing arguments/parameters, returning values (command substitution vs exit codes), and variable scoping (`local` vs global).

### 4. `switch_case.sh` - Case Statements
Examples demonstrating how to use the versatile `case` statement, often utilized as a cleaner alternative to complex `if/elif` ladders.

### 5. `select.sh` - Interactive Menus, Readonly, & Shift
Demonstrates how to generate simple and clean interactive numbered menus for terminal users using the `select` construct.
* **Other topics covered:** Using `readonly` to create immutable variables, and using `shift` to parse and consume command-line arguments in scripts.

### 6. `expressions.sh` - Expressions & Math
Examples showcasing how to evaluate arithmetic expressions and compare integers in your scripts.

### 7. `arguments.sh` - Script Arguments
Demonstrates how to handle command-line arguments passed to your script.
* **Topics covered:** Positional parameters (`$1`, `$2`), special variables (`$#`, `$@`, `$*`), and argument parsing.

### 8. `test_vs_if.sh` - Test vs If
Highlights the differences and appropriate use cases for the `test` command (`[ ]`) and the `if` conditional construct in Bash scripting.

---
*Created as part of a personalized bash learning journey.*
