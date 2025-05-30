#!/usr/bin/env bash

set -e

# Variables
GAM_BINARY="/Users/kamaal.mirza/src/al-gam/gam"

retry () {
	n=0
	until [ $n -ge 5 ]
	do
		eval "$1" && break
  		n=$((n+1))
  		sleep 3
	done
}

echo "Enter the email address of the Employee you are Offboarding:"

read -r -p "User's Email: " USER_EMAIL

echo "Enter who their emails should be forwarded to: "
printf "\\n"

read -r -p "Forwarding Address (Enter for none): " USER_FORWARDER

echo
echo "--Resetting User's Password..."
# Suspend the archived user.
retry "${GAM_BINARY} update user ${USER_EMAIL} password random"

echo
echo "--Revoking all App Specific Passwords, OAuth tokens, and 2SV Backups Codes..."
# Suspend the archived user.
retry "${GAM_BINARY} user \"${USER_EMAIL}\" deprovision"

echo
echo "--Suspending User..."
# Suspend the archived user.
retry "${GAM_BINARY} update user \"${USER_EMAIL}\" suspended on"

echo
echo "--Removing User from all Groups..."
retry "${GAM_BINARY} user \"${USER_EMAIL}\" delete groups"

echo
echo "--Moving User to Offboarding OU..."
retry "${GAM_BINARY} update user \"${USER_EMAIL}\" org \"Offboarded Employees\""

if [ ! -z "${USER_FORWARDER}" ]
then 
	echo
	echo "--Transfering all Google Drive files to Forwarding User..."
	retry "${GAM_BINARY} create datatransfer \"${USER_EMAIL}\" gdrive \"${USER_FORWARDER}\" privacy_level shared,private"

    sleep 10

	echo
	echo "--Transfering all Calendar events to Forwarding User and releasing Calendar Resources..."
	retry "${GAM_BINARY} create datatransfer \"${USER_EMAIL}\" calendar \"${USER_FORWARDER}\" release_resources true"
	
fi

sleep 10

echo
echo "--Renaming User..."
# Rename offboarded user to archived- prefix.
retry "${GAM_BINARY} update user \"${USER_EMAIL}\" username archived-'${USER_EMAIL}'"

sleep 10

echo
echo "--Deleting the old Email alias..."
# Ensure an existing email alias doesn't exist.
retry "${GAM_BINARY} delete alias \"${USER_EMAIL}\""

if [ ! -z "${USER_FORWARDER}" ]
then
	echo
	echo "--Creating Group with original Email..."

	#Create a Group as their original email address
	retry "${GAM_BINARY} create group \"${USER_EMAIL}\""
	echo
	echo "--Adding Forwarding Address to new Group..."

	#Add the forwarding address to that Group
	retry "${GAM_BINARY} update group \"${USER_EMAIL}\" add member \"${USER_FORWARDER}\""

	echo
	echo "--Setting Group permissions..."

	# Ensure sane group permissions, don't allow anyone to join.
	retry "${GAM_BINARY} update group \"${USER_EMAIL}\" who_can_join INVITED_CAN_JOIN who_can_post_message anyone_can_post"
fi

echo
echo "--All Done! Confirm changes in GSuite!"