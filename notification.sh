#!/bin/bash

# --- Bash Desktop Notifications ---

# Linux environments typically support sending desktop notifications via
# the 'notify-send' command (part of the libnotify-bin package).

echo "Sending standard notifications..."

# 1. Basic Notification
# Syntax: notify-send "Summary/Title" "Body/Message"
notify-send "Script Execution" "The automated backup task has started."

# Wait a moment
sleep 2

# 2. Notification with an Icon
# You can use standard icon names (like 'info', 'error', 'face-smile', etc.)
# or provide an absolute path to an image file.
notify-send -i error "Task Failed" "Unable to connect to the database server."
notify-send -i document-save "Save Complete" "Your files have been saved successfully."

sleep 2

# 3. Urgency Levels
# Options are 'low', 'normal', or 'critical'. Critical notifications often
# stay on the screen until the user dismisses them manually.
notify-send -u critical "System Alert" "This is a high priority notification."

# 4. Expiration Time (Milliseconds)
# Note: Many modern desktop environments ignore the expiration time parameter (-t),
# but it is good to know it exists.
notify-send -t 1000 "Fleeting Message" "I will try to disappear in 1 second."

echo "----------------------------------------"
echo "Checking Battery Percentage..."

# 5. Dynamic/Conditional Notification (Battery Warning)
# Ensure you have 'upower' installed. This extracts the percentage as a number.
battery_path=$(upower -e | grep 'BAT' | head -n 1)

if [[ -n "$battery_path" ]]; then
    # Parse the percentage (e.g., "100%" -> "100")
    battery_pct=$(upower -i "$battery_path" | grep -E 'percentage:' | awk '{print $2}' | tr -d '%')
    
    echo "Current Battery: $battery_pct%"

    if [ "$battery_pct" -lt 50 ]; then
        notify-send -u critical -i battery-empty "Battery Warning" "Your battery is currently at $battery_pct%. Please plug in!"
        echo "Sent a low battery notification!"
    else
        echo "Battery is healthy (> 50%). No warning sent."
    fi
else
    echo "No battery found on this system using upower."
fi

echo "Done."
