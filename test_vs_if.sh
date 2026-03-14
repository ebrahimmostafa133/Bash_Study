#!/bin/bash

#=============================================================
#  Difference Between 'test' and 'if' in Bash
#=============================================================
#
#  - 'test' is a COMMAND that evaluates a conditional expression
#    and returns an exit status (0 = true, 1 = false).
#
#  - 'if' is a CONTROL STRUCTURE (keyword) that branches
#    execution based on the exit status of a command.
#
#  - 'if' often USES 'test' (or its alias '[ ]') to decide
#    which branch to take, but 'if' can work with ANY command.
#
#  - '[ ]'  is equivalent to 'test'  (POSIX)
#  - '[[ ]]' is an enhanced Bash-specific version of 'test'
#=============================================================

echo "=========================================="
echo "  1. Using 'test' command directly"
echo "=========================================="

num=10

# 'test' evaluates the expression and sets the exit code ($?)
test $num -gt 5
echo "'test $num -gt 5' → exit code: $? (0=true, 1=false)"

test $num -gt 20
echo "'test $num -gt 20' → exit code: $? (0=true, 1=false)"

# You can also use '[ ]' which is identical to 'test'
[ $num -eq 10 ]
echo "'[ $num -eq 10 ]' → exit code: $?"

echo ""
echo "=========================================="
echo "  2. Using 'if' control structure"
echo "=========================================="

# 'if' checks the exit status of the command that follows it
# Here it uses 'test' (via [ ]) to evaluate the condition
if [ $num -gt 5 ]; then
    echo "if [ $num -gt 5 ]: TRUE branch executed"
else
    echo "if [ $num -gt 5 ]: FALSE branch executed"
fi

echo ""
echo "=========================================="
echo "  3. 'if' does NOT require 'test'"
echo "=========================================="

# 'if' can work with ANY command — it checks the exit code
# Example: using 'grep' directly with 'if'
if grep -q "root" /etc/passwd; then
    echo "'grep -q root /etc/passwd' succeeded → user 'root' exists"
else
    echo "'grep -q root /etc/passwd' failed → user 'root' not found"
fi

# Example: using 'ls' directly with 'if'
if ls /tmp > /dev/null 2>&1; then
    echo "'ls /tmp' succeeded → /tmp directory is accessible"
else
    echo "'ls /tmp' failed → /tmp directory is NOT accessible"
fi

echo ""
echo "=========================================="
echo "  4. 'test' vs '[ ]' vs '[[ ]]'"
echo "=========================================="

str="hello"

# All three do the same thing:
test "$str" = "hello" && echo "test: str is hello"
[ "$str" = "hello" ]   && echo "[  ]: str is hello"
[[ "$str" == "hello" ]] && echo "[[]]: str is hello"

# But [[ ]] supports extra features like pattern matching & regex:
if [[ "$str" == h* ]]; then
    echo "[[ ]] pattern match: '$str' starts with 'h'"
fi

if [[ "$str" =~ ^hel ]]; then
    echo "[[ ]] regex match: '$str' matches '^hel'"
fi

echo ""
echo "=========================================="
echo "  5. Key Differences Summary"
echo "=========================================="

cat << 'EOF'
┌──────────────────────────────────────────────────────────┐
│                  test / [ ]                              │
├──────────────────────────────────────────────────────────┤
│ • It is a COMMAND (built-in or /usr/bin/test)            │
│ • Evaluates a single conditional expression              │
│ • Returns exit code: 0 (true) or 1 (false)               │
│ • Cannot branch execution on its own                     │
│ • '[ ]' is just an alias for 'test'                      │
│ • POSIX compatible                                       │
├──────────────────────────────────────────────────────────┤
│                     if                                   │
├──────────────────────────────────────────────────────────┤
│ • It is a KEYWORD / control structure                    │
│ • Branches execution (then/elif/else/fi)                 │
│ • Works with ANY command, not just 'test'                │
│ • Checks the exit status of the given command            │
│ • Supports nested conditions (elif)                      │
├──────────────────────────────────────────────────────────┤
│                   [[ ]]                                  │
├──────────────────────────────────────────────────────────┤
│ • Enhanced version of 'test' (Bash-specific)             │
│ • Supports pattern matching (==) and regex (=~)          │
│ • No word splitting on variables (safer)                 │
│ • Supports logical operators: && || !                    │
│ • NOT POSIX — only works in Bash/Zsh                     │
└──────────────────────────────────────────────────────────┘
EOF

echo ""
echo "=========================================="
echo "  6. Practical Example: Combining both"
echo "=========================================="

file="/etc/passwd"

# 'test' alone — just sets exit code, no branching
test -f "$file"
echo "Does '$file' exist? Exit code: $? (0=yes)"

# 'if' + 'test' — evaluates AND branches
if [ -f "$file" ]; then
    echo "'if' + 'test': $file EXISTS → reading first line:"
    head -1 "$file"
else
    echo "'if' + 'test': $file does NOT exist"
fi

echo ""
echo "✅ Script complete! Now you know the difference."
