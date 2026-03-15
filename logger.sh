#!/bin/bash

# ==========================================
# logger Example
# ==========================================
# The `logger` command in Linux provides an easy way to add messages to the system log (/var/log/syslog or /var/log/messages).
# It's highly useful for tracking script executions, errors, and system events.

echo "Starting the script..."

# Basic logging
logger "This is a basic log message from logger.sh"

# Logging with a specific tag (-t) to easily find it later
logger -t MyBashScript "Script is currently processing data..."

# Simulating an error and logging it with an error priority (-p)
# Priorities can be: user.err, user.info, user.warn, etc.
if [ ! -f "non_existent_file.txt" ]; then
echo "Script finished. You can check the logs using: journalctl -t MyBashScript"

# ==========================================
# Advanced logger Examples
# ==========================================

echo -e "\n--- Advanced logger usage ---"

# 1. Logging command output directly
# You can pipe the output of a command directly into logger
echo "This output is piped to logger" | logger -t MyBashScriptPipe -p user.notice

# 2. Logging with PID (-i)
# It's useful to know the Process ID (PID) of the script that generated the log
logger -i -t MyScriptWithPID "This log entry includes the script's PID"

# 3. Logging to a specific facility and priority
# syslog uses facilities (auth, cron, daemon, kern, user, local0-local7, etc.)
# and priorities (emerg, alert, crit, err, warning, notice, info, debug)
# Example: Logging to the local0 facility with 'info' priority
logger -p local0.info -t CustomScript "Processing user data complete."

# 4. Creating a custom logging function for your script
log_msg() {
    local level=$1
    local msg=$2
    # Also print to screen
    echo "[$level] $msg"
    # Send to system log
    logger -t MyBashApp -p "user.$level" "$msg"
}

log_msg "info" "Starting backup process..."
# Simulate some work
sleep 1
log_msg "warning" "Disk space is running low (85% full)."
log_msg "err" "Backup failed: Network connection lost."
