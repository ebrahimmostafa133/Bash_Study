#!/bin/bash

#=============================================================
#  Bash Case Statement (Switch/Case) — A Complete Guide
#=============================================================
#  The 'case' statement is Bash's version of switch/case
#  found in other languages like C, Java, Python (match).
#=============================================================

echo "============================================"
echo "  1. BASIC SYNTAX"
echo "============================================"

cat << 'EOF'
Syntax:
────────────────────────────────────
  case $variable in
      pattern1)
          commands
          ;;
      pattern2)
          commands
          ;;
      *)
          default commands
          ;;
  esac

  - Each pattern ends with )
  - Each block ends with ;;
  - *) is the default (like 'default:' in C)
  - 'esac' closes the case ('case' backwards!)
EOF

echo ""
echo "============================================"
echo "  2. SIMPLE EXAMPLE — Day of the Week"
echo "============================================"

day=$(date +%A)
echo "Today is: $day"

case $day in
    Monday)
        echo "→ Start of the work week 😴"
        ;;
    Tuesday|Wednesday|Thursday)
        echo "→ Midweek, keep going! 💪"
        ;;
    Friday)
        echo "→ TGIF! Almost weekend! 🎉"
        ;;
    Saturday|Sunday)
        echo "→ Weekend! Time to relax 🏖️"
        ;;
    *)
        echo "→ Unknown day: $day"
        ;;
esac

echo ""
echo "============================================"
echo "  3. MATCHING NUMBERS"
echo "============================================"

score=85
echo "Score: $score"

case $score in
    100)
        echo "→ Perfect score! 🏆"
        ;;
    9[0-9])
        echo "→ Grade: A (Excellent)"
        ;;
    8[0-9])
        echo "→ Grade: B (Very Good)"
        ;;
    7[0-9])
        echo "→ Grade: C (Good)"
        ;;
    6[0-9])
        echo "→ Grade: D (Pass)"
        ;;
    *)
        echo "→ Grade: F (Fail)"
        ;;
esac

echo ""
echo "============================================"
echo "  4. MATCHING STRINGS"
echo "============================================"

fruit="Apple"
echo "Fruit: $fruit"

case $fruit in
    [Aa]pple)
        echo "→ 🍎 It's an apple (matched upper or lower 'a')"
        ;;
    [Bb]anana)
        echo "→ 🍌 It's a banana"
        ;;
    [Oo]range)
        echo "→ 🍊 It's an orange"
        ;;
    *)
        echo "→ Unknown fruit: $fruit"
        ;;
esac

echo ""
echo "============================================"
echo "  5. WILDCARD / GLOB PATTERNS"
echo "============================================"

file="photo_2024.jpg"
echo "File: $file"

case $file in
    *.jpg|*.jpeg|*.png|*.gif)
        echo "→ 🖼️  Image file"
        ;;
    *.mp4|*.avi|*.mkv)
        echo "→ 🎬 Video file"
        ;;
    *.mp3|*.wav|*.flac)
        echo "→ 🎵 Audio file"
        ;;
    *.txt|*.md|*.log)
        echo "→ 📄 Text file"
        ;;
    *.sh)
        echo "→ ⚙️  Shell script"
        ;;
    *)
        echo "→ ❓ Unknown file type"
        ;;
esac

echo ""
echo "============================================"
echo "  6. MULTIPLE PATTERNS (OR)"
echo "============================================"

cat << 'EOF'
Use | (pipe) to match multiple patterns:

  case $var in
      yes|Yes|YES|y|Y)    ← matches any of these
          echo "You said yes"
          ;;
  esac
EOF

echo ""
echo "Example:"

answer="Y"
echo "Answer: $answer"

case $answer in
    [yY]|[yY][eE][sS])
        echo "→ ✅ You said YES"
        ;;
    [nN]|[nN][oO])
        echo "→ ❌ You said NO"
        ;;
    *)
        echo "→ ❓ Invalid answer"
        ;;
esac

echo ""
echo "============================================"
echo "  7. CASE WITH USER INPUT"
echo "============================================"

cat << 'EOF'
Interactive menu example (not running, just showing):
────────────────────────────────────────────────────
  echo "Choose an option:"
  echo "1) List files"
  echo "2) Show date"
  echo "3) Show uptime"
  echo "4) Exit"
  read -p "Enter choice: " choice

  case $choice in
      1) ls -la ;;
      2) date ;;
      3) uptime ;;
      4) echo "Bye!"; exit 0 ;;
      *) echo "Invalid option" ;;
  esac
EOF

echo ""
echo "============================================"
echo "  8. CASE vs IF — When to Use Which?"
echo "============================================"

cat << 'EOF'
┌──────────────────────────────────────────────────────────────┐
│                    case                                      │
├──────────────────────────────────────────────────────────────┤
│ ✅ Best for matching ONE variable against MANY values        │
│ ✅ Supports glob patterns (*, ?, [a-z])                      │
│ ✅ Cleaner & more readable for menus/options                 │
│ ❌ Cannot do numeric comparisons (-gt, -lt, etc.)            │
│ ❌ Cannot combine multiple conditions (&&, ||)               │
├──────────────────────────────────────────────────────────────┤
│                    if/elif                                   │
├──────────────────────────────────────────────────────────────┤
│ ✅ Best for complex conditions & comparisons                 │
│ ✅ Supports numeric comparisons (-gt, -lt, -eq)              │
│ ✅ Can combine conditions with && and ||                     │
│ ❌ Gets messy with many elif branches                        │
│ ❌ More verbose for simple value matching                    │
└──────────────────────────────────────────────────────────────┘
EOF

echo ""
echo "Side-by-side comparison:"
echo ""

color="red"
echo "color='$color'"
echo ""

# Using case
echo "--- Using case ---"
case $color in
    red)   echo "  🔴 Red"   ;;
    green) echo "  🟢 Green" ;;
    blue)  echo "  🔵 Blue"  ;;
    *)     echo "  ❓ Unknown" ;;
esac

# Same thing with if/elif — more verbose!
echo ""
echo "--- Using if/elif (same result, more code) ---"
if [ "$color" = "red" ]; then
    echo "  🔴 Red"
elif [ "$color" = "green" ]; then
    echo "  🟢 Green"
elif [ "$color" = "blue" ]; then
    echo "  🔵 Blue"
else
    echo "  ❓ Unknown"
fi

echo ""
echo "============================================"
echo "  9. ADVANCED: ;; vs ;& vs ;;& "
echo "============================================"

cat << 'EOF'
Terminator   Meaning
──────────   ─────────────────────────────────────────
  ;;         Stop (normal, like 'break' in C)
  ;&         Fall through to NEXT block (like no break in C)
  ;;&        Continue checking remaining patterns
EOF

echo ""
echo "Example with ;& (fall through):"

level=2
echo "Level: $level"
echo "Permissions granted:"

case $level in
    3)
        echo "  → Admin access"
        ;&
    2)
        echo "  → Write access"
        ;&
    1)
        echo "  → Read access"
        ;;
    *)
        echo "  → No access"
        ;;
esac

echo ""
echo "(Level 2 falls through to also get level 1 permissions)"

echo ""
echo "============================================"
echo "  10. QUICK REFERENCE"
echo "============================================"

cat << 'EOF'
┌────────────────────────────────────────────────────────────┐
│  BASIC:      case $var in pattern) cmd ;; esac             │
│  DEFAULT:    *)  (matches anything not matched above)      │
│  OR:         pattern1|pattern2)                            │
│  GLOB:       *.txt   [a-z]*   ???                          │
│  CHAR CLASS: [yY]  [0-9]  [a-zA-Z]                         │
│  STOP:       ;;  (break)                                   │
│  FALLTHRU:   ;&  (continue to next block)                  │
│  CONTINUE:   ;;&  (keep checking patterns)                 │
│  CLOSE:      esac  ('case' spelled backwards)              │
└────────────────────────────────────────────────────────────┘
EOF

echo ""
echo "✅ Script complete! Now you know all about case/switch in Bash."
