#!/bin/zsh

###################################################################################################
# Created by David Marks | support@kandji.io | Kandji, Inc.
###################################################################################################
# Created - 2022-03-25
###################################################################################################
# Tested macOS Versions
###################################################################################################
#
#	12.2.1
#	12.3
#	11.6.3
#	10.15.7
#
###################################################################################################
# Software Information
###################################################################################################
#
# This script will enable Remote Management on end-points using the Kandji API.
#
# Access to the Kandji API is required for this script to function.
#
###################################################################################################
# License Information
###################################################################################################
# Copyright 2022 Kandji, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this
# software and associated documentation files (the "Software"), to deal in the Software
# without restriction, including without limitation the rights to use, copy, modify, merge,
# publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons
# to whom the Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or
# substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
# PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
# FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
# OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.
###################################################################################################
###################################################################################################
###################################### VARIABLES ##################################################
###################################################################################################
#Specify your Kandji subdomain, i.e. if your subdomain is applovin.kandji.io specify applovin
subDomain="applovin.kandji.io"
#Specify the API Token to be used for this script, this can be found when creating a new API Token from Settings > Access > API Token in the Kandji WebApp
apiToken="API TOKEN"
###################################################################################################
##################################### MAIN LOGIC ##################################################
###################################################################################################
# All of the main logic be here ... modify at your own risk.
/bin/echo " > Checking for presense of io.kandji.Kandji.plist"
if [[ -e "/Library/Preferences/io.kandji.Kandji.plist" ]]; then
	deviceID=$(/usr/bin/defaults read '/Library/Preferences/io.kandji.Kandji.plist' ComputerURL | /usr/bin/cut -d'/' -f 5)
	deviceURL="https://${subDomain}.clients.us-1.kandji.io/api/v1/devices/${deviceID}/action/remotedesktop"
else
	/bin/echo " > Error - Kandji Plist could not be located."
	exit 1
fi
/bin/echo " > Attempting to enable Remote Management for Device ID: ${deviceID} ."
cURL=$(/usr/bin/curl -s --location --request POST "${deviceURL}" \
--header "Content-Type: application/json" \
--header "Authorization: Bearer ${apiToken}" \
--data-raw '{
    "EnableRemoteDesktop": true
}')
if [[ -z "${cURL}" ]]; then
	/bin/echo " > Success - Remote Management command send successfully."
	exit 0
else
	/bin/echo " > Error - ${curl}"
	exit 1
fi