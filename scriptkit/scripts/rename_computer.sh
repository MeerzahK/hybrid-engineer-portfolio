#!/bin/bash

# Script to rename a Mac's computer name, hostname, and local hostname

echo "🔧 Starting Mac renaming script!"

# Ask the user for the new name
read -p "Enter the new computer name: " NEW_NAME

# Apply the name to all three macOS name settings
sudo scutil --set ComputerName "$NEW_NAME"
sudo scutil --set HostName "$NEW_NAME"
sudo scutil --set LocalHostName "$NEW_NAME"

# Confirm the new names
echo "✅ Computer name changed to:"
scutil --get ComputerName
scutil --get HostName
scutil --get LocalHostName