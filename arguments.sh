#!/bin/bash

#=============================================================
#  Bash Arguments — A Complete Guide
#=============================================================
#  Run this script with arguments to see them in action:
#    bash arguments.sh hello world 42
#=============================================================

echo "============================================"
echo "  1. POSITIONAL ARGUMENTS"
echo "============================================"

cat << 'EOF'
Variable    Meaning
────────    ──────────────────────────────────────
 $0         Name of the script itself
 $1         First argument
 $2         Second argument
 $3         Third argument  ... and so on
 $#         Total number of arguments
 $@         All arguments (as separate words)
 $*         All arguments (as one string)
 $$         Process ID (PID) of the script
 $!         PID of last background process
 $?         Exit status of last command
EOF

echo ""
echo "Live values (you passed $# arguments):"
echo "──────────────────────────────────────"
echo "\$0  = $0        (script name)"
echo "\$1  = $1        (1st argument)"
echo "\$2  = $2        (2nd argument)"
echo "\$3  = $3        (3rd argument)"
echo "\$#  = $#         (total count)"
echo "\$@  = $@    (all, separate words)"
echo "\$*  = $*    (all, single string)"
echo "\$\$ = $$      (script PID)"
echo "\$?  = $?         (last exit code)"

echo ""
echo "============================================"
echo "  2. \$@ vs \$* — The Key Difference"
echo "============================================"

echo "When QUOTED, they behave differently:"
echo ""
echo '--- "$@" (preserves each argument separately) ---'
count=1
for arg in "$@"; do
    echo "  arg $count: '$arg'"
    (( count++ ))
done

echo ""
echo '--- "$*" (merges all into one single string) ---'
count=1
for arg in "$*"; do
    echo "  arg $count: '$arg'"
    (( count++ ))
done

echo ""
cat << 'EOF'
┌─────────────────────────────────────────────────────────┐
│ TIP: Always use "$@" (quoted) when passing arguments    │
│ to other commands. It preserves spaces in arguments.    │
│                                                         │
│ Example: if you pass "hello world" as ONE argument,     │
│   "$@" keeps it as ONE argument                         │
│   "$*" keeps it as ONE argument                         │
│   $@   splits it into TWO arguments (hello, world)      │
│   $*   splits it into TWO arguments (hello, world)      │
└─────────────────────────────────────────────────────────┘
EOF

echo ""
echo "============================================"
echo "  3. DEFAULT VALUES"
echo "============================================"

cat << 'EOF'
Syntax                    Meaning
──────────────────────    ────────────────────────────────
 ${var:-default}          Use 'default' if var is unset/empty
 ${var:=default}          Set var to 'default' if unset/empty
 ${var:+alternate}        Use 'alternate' if var IS set
 ${var:?error msg}        Show error & exit if var is unset
EOF

echo ""
echo "Examples:"

name=${1:-"no_name_given"}
echo "\${1:-\"no_name_given\"} → '$name'"

greeting=${UNDEFINED_VAR:-"Hello!"}
echo "\${UNDEFINED_VAR:-\"Hello!\"} → '$greeting'"

myvar="exists"
result=${myvar:+"var is set"}
echo "\${myvar:+\"var is set\"} → '$result'"

empty_result=${UNDEFINED:+"var is set"}
echo "\${UNDEFINED:+\"var is set\"} → '$empty_result' (empty, var not set)"

echo ""
echo "============================================"
echo "  4. THE 'shift' COMMAND"
echo "============================================"

cat << 'EOF'
'shift' removes the first argument and shifts all others down:

  Before shift:  $1=hello  $2=world  $3=42
  After shift:   $1=world  $2=42     $3=(empty)

'shift N' shifts by N positions.
EOF

echo ""
echo "Before shift: \$1='$1' \$2='$2' \$3='$3' (total: $#)"

if [ $# -gt 0 ]; then
    shift
    echo "After shift:  \$1='$1' \$2='$2' \$3='$3' (total: $#)"
else
    echo "(No arguments to shift)"
fi

echo ""
echo "============================================"
echo "  5. LOOPING THROUGH ARGUMENTS"
echo "============================================"

# Restore args for demo (using set --)
set -- "apple" "banana" "cherry with spaces" "date"
echo "Demo arguments: $@"
echo ""

echo "--- Method 1: for loop with \$@ ---"
for arg in "$@"; do
    echo "  → $arg"
done

echo ""
echo "--- Method 2: while + shift ---"
set -- "red" "green" "blue"
while [ $# -gt 0 ]; do
    echo "  → $1"
    shift
done

echo ""
echo "--- Method 3: C-style indexed loop ---"
set -- "one" "two" "three"
args=("$@")
for (( i=0; i<${#args[@]}; i++ )); do
    echo "  args[$i] = '${args[$i]}'"
done

echo ""
echo "============================================"
echo "  6. QUICK REFERENCE CHEAT SHEET"
echo "============================================"

cat << 'EOF'
┌────────────────────────────────────────────────────────────┐
│  POSITIONAL:   $0  $1  $2 ... $9  ${10}  ${11} ...         │
│  COUNT:        $#                                          │
│  ALL ARGS:     "$@" (separate)   "$*" (joined)             │
│  DEFAULTS:     ${v:-def}  ${v:=def}  ${v:+alt}  ${v:?e}    │
│  SHIFTING:     shift   shift N                             │
│  OPTIONS:      getopts "ab:c:" opt                         │
│  PROCESS:      $$  $!  $?                                  │
│  BEST PRACTICE: Always quote "$@" and "$1" etc.            │
└────────────────────────────────────────────────────────────┘
EOF

echo ""
echo "✅ Script complete! Now you know all about Bash arguments."
echo ""
echo "💡 Try running this script with different arguments:"
echo "   bash arguments.sh hello world 42"
echo "   bash arguments.sh \"hello world\" test"
