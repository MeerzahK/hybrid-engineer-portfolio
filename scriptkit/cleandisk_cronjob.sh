#!/bin/bash

# Deploy clean_disk.sh and wrapper to system path
echo "📦 Deploying clean_disk.sh and run_clean_disk.sh to /usr/local/bin/scriptkit..."

# Create target folder if it doesn't exist
sudo mkdir -p /usr/local/bin/scriptkit

# Copy scripts
sudo cp scripts/clean_disk.sh /usr/local/bin/scriptkit/
sudo cp scripts/run_clean_disk.sh /usr/local/bin/scriptkit/

# Set permissions
sudo chmod +x /usr/local/bin/scriptkit/*.sh

echo "✅ Deployment complete. Scripts are ready for launchd."

