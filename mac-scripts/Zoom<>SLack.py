import requests
import time

# Your Slack Webhook URL
SLACK_WEBHOOK_URL = 'https://hooks.slack.com/services/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'

# Zoom API token (for this example, we'll use JWT token)
ZOOM_JWT_TOKEN = 'your_zoom_jwt_token'

# Function to check Zoom Rooms status
def check_zoom_rooms_status():
    headers = {
        'Authorization': f'Bearer {ZOOM_JWT_TOKEN}',
        'Content-Type': 'application/json'
    }
    # Example endpoint (you'll need to replace this with the actual Zoom API endpoint for checking room status)
    zoom_rooms_status_url = 'https://api.zoom.us/v2/.../status'
    
    response = requests.get(zoom_rooms_status_url, headers=headers)
    if response.status_code == 200:
        data = response.json()
        # You'll need to parse the response to determine if any rooms are down
        # This is a placeholder logic
        rooms_down = any(room['status'] != 'online' for room in data['rooms'])
        return rooms_down
    else:
        print(f"Failed to fetch Zoom Rooms status: {response.text}")
        return False

# Function to send a notification to Slack
def send_slack_notification(message):
    payload = {'text': message}
    response = requests.post(SLACK_WEBHOOK_URL, json=payload)
    print(f"Notification sent to Slack: {response.status_code}, {response.text}")

# Main monitoring function
def monitor_zoom_rooms():
    try:
        while True:
            if check_zoom_rooms_status():
                send_slack_notification("Alert: A Zoom Room is down!")
            else:
                print("All Zoom Rooms are operational.")
            # Check every 5 minutes
            time.sleep(300)
    except KeyboardInterrupt:
        print("Monitoring interrupted.")

if __name__ == "__main__":
    monitor_zoom_rooms()
