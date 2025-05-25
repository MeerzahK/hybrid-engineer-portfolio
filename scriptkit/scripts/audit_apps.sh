#!/bin/bash

# Script to list all applications in /Applications and log them

LOG_DIR="/Users/kamaal.mirza/code/CPE-Projects/scriptkit/logs"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="$LOG_DIR/app_audit_$TIMESTAMP.log"

echo "📋 Starting app audit!!"
echo "Audit date: $(date)" > "$LOG_FILE"
echo "Applications found in /Applications:" >> "$LOG_FILE"
echo "-----------------------------------" >> "$LOG_FILE"

# Loop through all apps in /Applications
for APP in /Applications/*.app; do
  echo "$(basename "$APP")" >> "$LOG_FILE"
done

echo "✅ App audit saved to $LOG_FILE"