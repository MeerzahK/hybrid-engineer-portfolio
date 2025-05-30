import os
import subprocess
import logging

try:
    from dotenv import load_dotenv
    # Load .env
    load_dotenv(dotenv_path=os.path.join(os.path.dirname(__file__), '.env'))
except ImportError:
    # Handle case where python-dotenv is not installed
    print("Warning: python-dotenv package not found. Environment variables from .env file will not be loaded.")
    
    def load_dotenv(*args, **kwargs):
        """Dummy function when dotenv is not available"""
        print("Warning: Attempted to load .env file but python-dotenv is not installed.")
        return False

# Setup logging
log_file = "/var/log/app_audit.log"
logging.basicConfig(filename=log_file, level=logging.INFO, format='%(asctime)s %(message)s')
logging.info("App audit and enforcement started")

# Non-approved apps
non_approved_apps = [
    "Screens 5"
]

# Slack Webhook
slack_webhook = os.getenv("SLACK_WEBHOOK")

if not slack_webhook:
    logging.error("SLACK_WEBHOOK not found in .env")
    exit(1)

app_dir = "/Applications"

for app in non_approved_apps:
    app_path = os.path.join(app_dir, f"{app}.app")
    if os.path.exists(app_path):
        logging.info(f"Unauthorized app found: {app} — removing...")
        subprocess.run(["rm", "-rf", app_path], check=False)
        logging.info(f"{app} removed.")

        # Send Slack alert
        subprocess.run([
            "curl", "-X", "POST",
            "-H", "Content-type: application/json",
            "--data", f'{{"text":"🚫 Removed unauthorized app: {app} from {os.uname().nodename}"}}',
            slack_webhook
        ], check=False)
    else:
        logging.info(f"{app} not found — OK")

logging.info("App audit and enforcement completed")
