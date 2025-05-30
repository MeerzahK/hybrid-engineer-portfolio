# 🩺 Self-Healing Scripts

This folder contains platform-specific scripts to detect and automatically remediate issues on client endpoints.

### 🎯 Goals
- Improve device reliability and compliance
- Automatically enforce security policies
- Reduce manual IT intervention

### 📁 Subdirectories
- `macos/` – Shell scripts for things like FileVault, system logs
- `windows/` – PowerShell scripts for BitLocker, policy fixes
- `linux/` – Bash scripts for password policy, updates, etc.
- `common/` – Cross-platform helper functions and logging tools