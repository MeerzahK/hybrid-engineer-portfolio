#!/bin/bash

# 1. Define a temporary log file for collecting Nudge events
TEMP_LOG="/tmp/nudge_interactions.log"

# 2. Use unified log to retrieve Nudge user-interaction events from the last hour
#    Filtering by Nudge's subsystem and looking for "User " in the message to capture deferrals/dismissals.
#    The --last 60m flag limits to the past 60 minutes for efficiency&#8203;:contentReference[oaicite:0]{index=0}.
#    The --info flag includes informational messages (which Nudge uses for user clicks)&#8203;:contentReference[oaicite:1]{index=1}.
#/usr/bin/log show --predicate 'subsystem == "com.github.macadmins.Nudge" AND eventMessage CONTAINS "User "' --last 60m --info --style syslog > "$TEMP_LOG" 2>/dev/null

/usr/bin/log show --predicate 'subsystem == "com.github.macadmins.Nudge" AND eventMessage contains "User "' --last 60m --info --style syslog > "$TEMP_LOG" 2>/dev/null

# 3. Check if any relevant log entries were found
if [[ -s "$TEMP_LOG" ]]; then
    # If the file is not empty, output its contents (each line is a Nudge interaction event)
    cat "$TEMP_LOG"
else
    # If no Nudge interactions were logged in the past hour, print a placeholder message
    echo "No Nudge interactions in the past hour."
fi

# 4. Clean up the temporary log file
rm -f "$TEMP_LOG"
