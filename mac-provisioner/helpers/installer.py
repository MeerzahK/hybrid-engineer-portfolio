import subprocess

def install_apps(file_path):
    with open(file_path, 'r') as file:
        apps = [line.strip() for line in file.readlines() if line.strip()]

    for app in apps:
        print(f"Installing {app}...")
        subprocess.run(['brew', 'install', '--cask', app], check=False)