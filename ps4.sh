#!/bin/bash

# ==========================================
# PS4 Variable in Debugging
# ==========================================
# The PS4 variable determines the prompt printed before the command output is echoed 
# when debugging is enabled (set -x).
#
# By default, PS4 is set to '+ '. We can customize it to show the script name, 
# line number, and function name for better debugging.

# Customize PS4 to show: File Name, Line Number, and a custom arrow
export PS4='[${BASH_SOURCE[0]}:$LINENO] 🚀 '

# Enable debugging
set -x

echo "Starting the PS4 demonstration..."

num=10
if [ $num -gt 5 ]; then
    echo "Number is greater than 5"
fi

function calculate() {
    local a=$1
    local b=$2
    echo "Calculating sum..."
    echo $((a + b))
}

calculate 5 15

# Disable debugging
set +x

echo "Execution finished."

# ==========================================
# Advanced PS4 Customization
# ==========================================

echo -e "\n--- Advanced PS4 Usage ---"

# Let's save the original PS4
ORIG_PS4=$PS4

# 1. Including Date and Time in PS4
# You can evaluate commands within PS4 using command substitution
export PS4='+ [$(date "+%Y-%m-%d %H:%M:%S")] [${BASH_SOURCE[0]}:$LINENO] '
echo "Debugging with Time stamp:"
set -x
echo "This log has a timestamp"
date
set +x

# 2. Including the depth of execution (SHLVL) and shell level (BASH_SUBSHELL)
export PS4='+ [Level:$SHLVL Subshell:$BASH_SUBSHELL] '
echo -e "\nDebugging with Shell Levels:"
set -x
echo "Main shell"
(
  echo "Inside a subshell"
  (
    echo "Inside a nested subshell"
  )
)
set +x

# 3. Using colors in PS4 for better readability
# Red text for the debug prompt
RED='\033[0;31m'
NC='\033[0m' # No Color
export PS4="${RED}+ [\${BASH_SOURCE[0]}:\${LINENO}]${NC} "

echo -e "\nDebugging with Colors:"
set -x
echo "This debug prompt should be red (if your terminal supports colors)"
set +x

# Restore original
export PS4=$ORIG_PS4
