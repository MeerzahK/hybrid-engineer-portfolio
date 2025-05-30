# 🧼 Python App Audit Script (macOS)

This project audits installed macOS apps and removes any that are on a non-approved list. It also sends Slack alerts when unauthorized apps are removed.

## 📦 Setup

1. Clone the repo and navigate to `app_audit/`
2. Create `.env` and add your `SLACK_WEBHOOK_URL`
3. List unapproved app names in `unapproved_apps.txt`
4. Install dependencies:

```bash
pip install -r requirements.txt