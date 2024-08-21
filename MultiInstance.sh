#!/bin/bash

# Configurable variables
COOKIE_FILE="cookies.json"
COOKIE_UPDATE_INTERVAL=1  # Time in seconds between cookie changes

# Function to read cookies from a file and return as an array
get_cookies() {
    local file="$1"
    local cookies
    cookies=$(jq -r '.cookies[]' "$file")
    echo "$cookies"
}

# Function to update the Roblox session file with a new cookie
update_cookie() {
    local cookie="$1"
    echo "$cookie" > roblox-session.txt
    echo "Changed Cookie - $(date +'%I:%M %p') 🛡 Made by Your fellow skid ChatGPT"
}

# Function to start Roblox and wait for it to be ready
start_roblox() {
    echo "Starting Roblox..."
    open -a "Roblox Player" --args --placeId=YOUR_PLACE_ID --gameInstanceId=YOUR_GAME_INSTANCE_ID
    sleep 10  # Wait for Roblox to start
}

# Function to change cookies at intervals
change_cookies() {
    local cookies
    cookies=$(get_cookies "$COOKIE_FILE")
    
    while true; do
        for cookie in $cookies; do
            update_cookie "$cookie"
            sleep "$COOKIE_UPDATE_INTERVAL"
        done
    done
}

# Main script
if [ ! -f "$COOKIE_FILE" ]; then
    echo "Cookie file '$COOKIE_FILE' not found!"
    exit 1
fi

# Start Roblox
start_roblox

# Start changing cookies
change_cookies
