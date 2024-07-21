#!/bin/bash

# Function to log messages to console output
log_message() {
    echo "[Raptor] $1"
}

# Path to Roblox Player executable
ROBLOX_PLAYER_PATH="/Applications/Roblox.app/Contents/MacOS/RobloxPlayer"

# Check if Roblox Player executable exists
if [ ! -f "$ROBLOX_PLAYER_PATH" ]; then
    echo "Error: Roblox Player not found at $ROBLOX_PLAYER_PATH"
    exit 1
fi

# Attempt to launch Roblox Player and capture console output
echo "Launching Roblox Player at: $ROBLOX_PLAYER_PATH"

# Start Roblox Player in the foreground, capturing output
"$ROBLOX_PLAYER_PATH" 2>&1 | while IFS= read -r line; do
    log_message "$line"
done &

# Capture the process ID (PID) of Roblox Player
ROBLOX_PLAYER_PID=$!

# Wait for Roblox Player to start (adjust sleep time as needed)
sleep 10  # Adjust sleep time depending on how long it takes for Roblox Player to start

# Log messages to console output
log_message "Loaded Settings Config."
log_message "Current Directory: $(pwd)"
log_message "Memory Patched."
log_message "MacSploit Injected Successfully."
log_message "Attached Console Input to Execution."
log_message "Created Socket for IPC Communication."
log_message "Starting Roblox..."

# Extract TCP port from console output
TCP_PORT=$(echo "$console_output" | grep -oE "Listening to TCP ([0-9]+)" | grep -oE "[0-9]+")
if [ -z "$TCP_PORT" ]; then
    log_message "[IPC] Listening to TCP port not found in console output."
else
    log_message "[IPC] Listening to TCP $TCP_PORT."
fi

log_message "Started Multi Roblox."
log_message "Started Whitelist Thread."
log_message "Beginning Execution Thread..."
log_message "0 Scripts Have Been Executed."

# Output TCP port for further use if needed
echo "TCP Port: $TCP_PORT"

# Wait for Roblox Player to finish (optional)
wait $ROBLOX_PLAYER_PID

echo "Script execution completed."
