#!/bin/bash

#=============================================================
#  Bash Expressions — A Complete Guide
#=============================================================
#  This script demonstrates all types of expressions you'll
#  encounter in Bash scripting.
#=============================================================

echo "============================================"
echo "  1. ARITHMETIC EXPRESSIONS"
echo "============================================"

a=10
b=3

# Using $(( )) for arithmetic
echo "a=$a, b=$b"
echo "a + b  = $(( a + b ))"
echo "a - b  = $(( a - b ))"
echo "a * b  = $(( a * b ))"
echo "a / b  = $(( a / b ))   (integer division)"
echo "a % b  = $(( a % b ))   (modulus/remainder)"
echo "a ** b = $(( a ** b ))  (exponentiation: 10^3)"

# Increment & decrement
(( a++ ))
echo "a++ → a is now $a"
(( a-- ))
echo "a-- → a is back to $a"

# Compound assignment
(( a += 5 ))
echo "a += 5 → a is now $a"
(( a -= 5 ))
echo "a -= 5 → a is back to $a"

echo ""
echo "============================================"
echo "  2. COMPARISON EXPRESSIONS (Numbers)"
echo "============================================"

x=10
y=20

echo "x=$x, y=$y"
echo ""

# Integer comparison operators (used inside [ ] or test)
cat << 'EOF'
Operator   Meaning                Example
────────   ───────────────────    ──────────────
 -eq       Equal                  [ $x -eq $y ]
 -ne       Not equal              [ $x -ne $y ]
 -gt       Greater than           [ $x -gt $y ]
 -ge       Greater or equal       [ $x -ge $y ]
 -lt       Less than              [ $x -lt $y ]
 -le       Less or equal          [ $x -le $y ]
EOF

echo ""
echo "Live tests:"
[ $x -eq $y ] && echo "$x -eq $y → TRUE" || echo "$x -eq $y → FALSE"
[ $x -ne $y ] && echo "$x -ne $y → TRUE" || echo "$x -ne $y → FALSE"
[ $x -gt $y ] && echo "$x -gt $y → TRUE" || echo "$x -gt $y → FALSE"
[ $x -lt $y ] && echo "$x -lt $y → TRUE" || echo "$x -lt $y → FALSE"

echo ""
echo "============================================"
echo "  3. STRING EXPRESSIONS"
echo "============================================"

str1="hello"
str2="world"
str3=""

cat << 'EOF'
Operator    Meaning                   Example
────────    ────────────────────      ──────────────────────
 =          Strings are equal         [ "$s1" = "$s2" ]
 !=         Strings are not equal     [ "$s1" != "$s2" ]
 -z         String is empty           [ -z "$s" ]
 -n         String is NOT empty       [ -n "$s" ]
 <          Alphabetically before     [[ "$s1" < "$s2" ]]
 >          Alphabetically after      [[ "$s1" > "$s2" ]]
EOF

echo ""
echo "Live tests (str1='$str1', str2='$str2', str3='$str3'):"
[ "$str1" = "$str2" ]  && echo "'$str1' = '$str2'  → TRUE" || echo "'$str1' = '$str2'  → FALSE"
[ "$str1" != "$str2" ] && echo "'$str1' != '$str2' → TRUE" || echo "'$str1' != '$str2' → FALSE"
[ -z "$str3" ]         && echo "-z '$str3'          → TRUE (empty)"  || echo "-z '$str3' → FALSE"
[ -n "$str1" ]         && echo "-n '$str1'       → TRUE (not empty)" || echo "-n '$str1' → FALSE"

echo ""
echo "============================================"
echo "  4. FILE TEST EXPRESSIONS"
echo "============================================"

cat << 'EOF'
Operator    Meaning                         Example
────────    ─────────────────────────       ────────────────────
 -f         Is a regular file               [ -f file.txt ]
 -d         Is a directory                  [ -d /tmp ]
 -e         File/dir exists                 [ -e /etc/passwd ]
 -r         File is readable                [ -r file.txt ]
 -w         File is writable                [ -w file.txt ]
 -x         File is executable              [ -x script.sh ]
 -s         File is NOT empty (size > 0)    [ -s file.txt ]
 -L         Is a symbolic link              [ -L /usr/bin/python ]
 -nt        File1 is newer than File2       [ f1 -nt f2 ]
 -ot        File1 is older than File2       [ f1 -ot f2 ]
EOF

echo ""
echo "Live tests:"
[ -f /etc/passwd ] && echo "-f /etc/passwd → TRUE (is a file)"    || echo "-f /etc/passwd → FALSE"
[ -d /tmp ]        && echo "-d /tmp        → TRUE (is a dir)"     || echo "-d /tmp        → FALSE"
[ -e /nonexist ]   && echo "-e /nonexist   → TRUE (exists)"       || echo "-e /nonexist   → FALSE (doesn't exist)"
[ -r /etc/passwd ] && echo "-r /etc/passwd → TRUE (readable)"     || echo "-r /etc/passwd → FALSE"
[ -x /bin/bash ]   && echo "-x /bin/bash   → TRUE (executable)"   || echo "-x /bin/bash   → FALSE"
[ -s /etc/passwd ] && echo "-s /etc/passwd → TRUE (not empty)"    || echo "-s /etc/passwd → FALSE"

echo ""
echo "============================================"
echo "  5. LOGICAL EXPRESSIONS"
echo "============================================"

cat << 'EOF'
Operator       Meaning     Where to use
───────────    ────────    ────────────────────────────
 -a / &&       AND         [ ] uses -a, [[ ]] uses &&
 -o / ||       OR          [ ] uses -o, [[ ]] uses ||
 !             NOT         Both [ ] and [[ ]]
EOF

echo ""
echo "Live tests (x=$x, y=$y):"

# Using [ ] with -a (AND) and -o (OR)
[ $x -gt 5 -a $y -gt 10 ] && echo "[ -a ] x>5 AND y>10 → TRUE" || echo "[ -a ] → FALSE"
[ $x -gt 50 -o $y -gt 10 ] && echo "[ -o ] x>50 OR y>10 → TRUE" || echo "[ -o ] → FALSE"

# Using [[ ]] with && and ||
[[ $x -gt 5 && $y -gt 10 ]] && echo "[[ && ]] x>5 AND y>10 → TRUE" || echo "[[ && ]] → FALSE"
[[ $x -gt 50 || $y -gt 10 ]] && echo "[[ || ]] x>50 OR y>10 → TRUE" || echo "[[ || ]] → FALSE"

# NOT
[ ! $x -eq $y ] && echo "[ ! ] x NOT equal y → TRUE" || echo "[ ! ] → FALSE"

echo ""
echo "============================================"
echo "  6. REDIRECTION EXPRESSIONS"
echo "============================================"

cat << 'EOF'
Expression              Meaning
──────────────────      ────────────────────────────────────────
 cmd > file             Redirect stdout to file (overwrite)
 cmd >> file            Redirect stdout to file (append)
 cmd 2> file            Redirect stderr to file
 cmd 2>&1               Redirect stderr to same place as stdout
 cmd > /dev/null        Discard stdout (send to black hole)
 cmd > /dev/null 2>&1   Discard ALL output (stdout + stderr)
 cmd < file             Read input from file
 cmd1 | cmd2            Pipe: stdout of cmd1 → stdin of cmd2
EOF

echo ""
echo "Examples:"
echo "hello" > /tmp/redir_test.txt
echo "'echo hello > /tmp/redir_test.txt' → wrote to file"
cat /tmp/redir_test.txt

echo "world" >> /tmp/redir_test.txt
echo "'echo world >> /tmp/redir_test.txt' → appended to file"
cat /tmp/redir_test.txt

ls /nonexistent 2> /dev/null
echo "'ls /nonexistent 2> /dev/null' → error hidden (exit: $?)"

rm -f /tmp/redir_test.txt

echo ""
echo "============================================"
echo "  7. PATTERN MATCHING (inside [[ ]])"
echo "============================================"

file="report_2024.csv"
echo "file='$file'"

# Glob pattern matching with ==
[[ "$file" == *.csv ]]   && echo "== *.csv   → TRUE (ends with .csv)"   || echo "→ FALSE"
[[ "$file" == report* ]] && echo "== report* → TRUE (starts with report)" || echo "→ FALSE"
[[ "$file" == *.pdf ]]   && echo "== *.pdf   → TRUE"                      || echo "== *.pdf   → FALSE"

# Regex matching with =~
[[ "$file" =~ ^report_[0-9]{4} ]] && echo "=~ regex   → TRUE (matches report_YYYY)" || echo "→ FALSE"

echo ""
echo "============================================"
echo "  8. TERNARY-LIKE EXPRESSIONS"
echo "============================================"

echo "Bash doesn't have a ternary operator (? :) but you can mimic it:"
echo ""

age=20

# Method 1: && and ||
[[ $age -ge 18 ]] && status="adult" || status="minor"
echo "Method 1 (&&/||): age=$age → $status"

# Method 2: Arithmetic ternary
result=$(( age >= 18 ? 1 : 0 ))
echo "Method 2 (arithmetic): age=$age → result=$result"

echo ""
echo "============================================"
echo "  9. QUICK REFERENCE CHEAT SHEET"
echo "============================================"

cat << 'EOF'
┌────────────────────────────────────────────────────────────┐
│  NUMBERS:   -eq  -ne  -gt  -ge  -lt  -le                   │
│  STRINGS:   =  !=  -z  -n  <  >                            │
│  FILES:     -f  -d  -e  -r  -w  -x  -s  -L  -nt  -ot       │
│  LOGIC:     -a(AND)  -o(OR)  !(NOT)  &&  ||                │
│  MATH:      $(( ))  +  -  *  /  %  **  ++  --              │
│  REDIRECT:  >  >>  2>  2>&1  <  |  /dev/null               │
│  PATTERN:   == (glob)   =~ (regex)   inside [[ ]]          │
└────────────────────────────────────────────────────────────┘
EOF

echo ""
echo "✅ Script complete! Now you know all Bash expressions."
