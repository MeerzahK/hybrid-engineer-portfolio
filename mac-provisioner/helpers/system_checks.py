import os
import platform
import shutil
import time

def run_checks():
    print("macOS Version:", platform.mac_ver()[0])
    print("Uptime:", time.time() - os.stat('/').st_ctime)
    total, used, free = shutil.disk_usage("/")
    print("Disk Free Space:", free // (2**30), "GB")