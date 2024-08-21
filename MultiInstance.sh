#!/bin/bash

# Path to the file to be updated
FILE_PATH="/Users/abdifatah/Downloads/roblox_session.txt"

# Prompt user for input
read -p "Enter your account cookie: " COOKIE

# Update the file with the provided cookie
echo "$COOKIE" > "$FILE_PATH"

# Print a confirmation message
echo "The file has been updated with the new cookie."
