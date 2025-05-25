#!/bin/bash


#This command will set Terminal’s working directory to the system folder that stores information about the available pluggable authentication modules (PAMs) in macOS.
cd/etc/pam.d

#Next, copy sudo_local.template to a new file named sudo_local by running the Terminal command below. You’ll need to type your administrator password to authorize the command because we’re making changes to the protected system file.
sudo cp sudo_local.template sudo_local

#Finally, edit the sudo_local configuration file with the Pico command-line text editor, which is built into macOS Monterey 12.3 and later:
sudo pico sudo_local