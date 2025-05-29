#!/bin/bash

# -------------------------------
# Client App Audit & Enforcement Script (macOS)
# -------------------------------
# Description: Removes apps listed in a non-approved list if they exist on the system.
# Includes: Application scan, enforcement, logging, Slack alert

# 📌 SETUP INSTRUCTIONS (Beginner Friendly):
# 1. Save this file as 'audit_apps.sh'
# 2. Make it executable: chmod +x audit_apps.sh
# 3. Set your Slack Webhook URL below
# 4. Run it with sudo: sudo ./audit_apps.sh
# 5. View logs: cat /var/log/app_audit.log

log_file="/var/log/app_audit.log"
echo "App audit and enforcement started: $(date)" | tee -a $log_file

# 🚫 Define the list of non-approved applications
non_approved_apps=(
  "Screens 5"
)

# 📍 Path where macOS stores Applications
app_dir="/Applications"

# 🔔 Slack Webhook URL (replace with your actual webhook URL)
slack_webhook="https://hooks.slack.com/services/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"

# 🔍 Step 1: Scan for presence of non-approved apps and remove them
for app in "${non_approved_apps[@]}"; do
  app_path="$app_dir/$app.app"
  if [ -d "$app_path" ]; then
    echo "Unauthorized app found: $app — removing..." | tee -a $log_file
    sudo rm -rf "$app_path"
    echo "$app removed." | tee -a $log_file

    # 📢 Send alert to Slack
    curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"🚫 Removed unauthorized app: $app from $(hostname)\"}" "$slack_webhook"
  else
    echo "$app not found — OK" | tee -a $log_file
  fi
done

# ✅ Final report
echo "App audit and enforcement completed: $(date)" | tee -a $log_file
exit 0