#!/bin/bash

# Function to check connected USB devices
check_usb_devices() {
    # Get the list of connected USB devices using system_profiler
    devices=$(system_profiler SPUSBDataType)

    # Loop through all the connected devices and check for mass storage devices
    echo "$devices" | while IFS= read -r line; do
        # Check if the device is a USB mass storage device (e.g., flash drive, external hard drive)
        if echo "$line" | grep -q "Mass Storage"; then
            # This is a mass storage device; block it by unmounting it
            echo "Blocking USB storage device (Mass Storage): $line"
            
            # Find the device name (e.g., diskXsY) to unmount the external storage device
            device_name=$(echo "$line" | grep -oE '([A-Za-z0-9]{4}\.[A-Za-z0-9]{4})')
            if [ -n "$device_name" ]; then
                # Unmount the device to block it (replace with actual device path if needed)
                diskutil unmountDisk /dev/$device_name
            fi
        fi

        # Allow all USB-C peripherals (e.g., USB hubs, docks, keyboards, mice)
        if echo "$line" | grep -q "USB-C"; then
            # This is a USB-C device, which is allowed for peripherals like keyboards, mice, and dongles
            echo "Allowing USB-C peripheral: $line"
        fi
    done
}

# Run the USB device check
check_usb_devices

exit 0
