#!/bin/bash

# Function to log messages to console output
log_message() {
    echo "[Raptor] $1"
}

# Function to display hacker-style ASCII art
display_hacker_art() {
    echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣷⣶⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⡿⠟⠛⠛⠛⠛⠻⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣁⠀⠀⠀⠀⣀⣤⣶⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⠛⠉⠛⠶⠀⠀⢐⠿⠋⠀⢨⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⢷⣿⣿⣶⠀⠀⠉⢶⣿⣿⠿⢿⣿⣿⣿⡄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⡇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣶⡶⠂⠀⣀⠀⢀⡄⠐⢲⡾⣻⣿⣿⣿⠇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣯⢿⡶⣶⣿⣟⣿⡶⠶⣿⢣⣿⣿⣿⣿⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⣾⣿⣿⣿⣿⣧⠛⠒⠠⣤⣤⠶⠾⢣⣿⣿⣿⣿⣿⣤⣀⠀⠀⠀
⢀⣠⣤⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⢿⣿⠀⣰⣿⣿⣿⣿⣿⣿⣷⣶
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
}


ROBLOX_PLAYER_PATH="/Applications/Roblox.app/Contents/MacOS/RobloxPlayer"


if [ ! -f "$ROBLOX_PLAYER_PATH" ]; then
    echo "Error: Roblox Player not found at $ROBLOX_PLAYER_PATH"
    exit 1
fi


echo "Launching Roblox Player at: $ROBLOX_PLAYER_PATH"


"$ROBLOX_PLAYER_PATH" 2>&1 | while IFS= read -r line; do
    if [[ $line == \[Raptor\] \[IPC\] Listening to TCP [0-9]+ ]]; then
        log_message "$line"
    fi
done &


ROBLOX_PLAYER_PID=$!


sleep 10  


display_hacker_art


wait $ROBLOX_PLAYER_PID

echo "Script execution completed."
