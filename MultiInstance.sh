#!/bin/bash

# Function to log IPC messages to console output
log_ipc_message() {
    echo "[IPC] $1"
}


# Function to log IPC messages to console output
log_ipc_message() {
    echo "[IPC] $1"
}

# Path to Roblox Player executable
ROBLOX_PLAYER_PATH="/Applications/Roblox.app/Contents/MacOS/RobloxPlayer"

# Launch Roblox Player and capture its console output
echo "Launching Roblox Player..."
"$ROBLOX_PLAYER_PATH" 2>&1 | while IFS= read -r line; do
    if [[ "$line" == \[IPC\]* ]]; then
        log_ipc_message "$(echo "$line" | sed 's/^\[IPC\]//')"
    fi
done
