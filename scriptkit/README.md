# ScriptKit – macOS Automation Scripts

A collection of beginner-friendly Bash scripts for automating common IT support tasks on macOS.

## Scripts Included

- `rename_computer.sh` – Set computer name, hostname, and local hostname
- `audit_apps.sh` – List all installed apps in /Applications and save to log
- `clean_disk.sh` – Clean temporary files and report free disk space
- `schedule_cleaning.sh` – Schedule the clean_disk script with launchd

## How to Use

Make scripts executable:
```bash
chmod +x scripts/*.sh