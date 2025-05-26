#!/bin/bash

# Script to clean up temporary files and show disk space

LOG_DIR="$(dirname "$0")/../logs"
mkdir -p "$LOG_DIR"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="$LOG_DIR/disk_cleanup_$TIMESTAMP.log"

echo "🧼 Starting disk cleanup..." | tee "$LOG_FILE"

# Get free space before cleanup
FREE_BEFORE=$(df -h / | awk 'NR==2 {print $4}')
echo "Free space before: $FREE_BEFORE" | tee -a "$LOG_FILE"

# Clean system and user caches (skip protected files silently)
sudo rm -rf /Library/Caches/* 2>/dev/null
sudo rm -rf ~/Library/Caches/* 2>/dev/null

# Empty Trash
rm -rf ~/.Trash/* 2>/dev/null

# Clear system logs (non-essential)
sudo rm -rf /private/var/log/asl/*.asl 2>/dev/null
sudo rm -rf /private/var/log/*.log 2>/dev/null

# Get free space after cleanup
FREE_AFTER=$(df -h / | awk 'NR==2 {print $4}')
echo "Free space after: $FREE_AFTER" | tee -a "$LOG_FILE"

echo "✅ Cleanup complete. Log saved to $LOG_FILE"