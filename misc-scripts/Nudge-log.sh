#!/bin/bash

# Example: Capture the last 24 hours of Nudge logs
/var/log/nudge.log show \
  --predicate 'process == "Nudge"' \
  --style syslog \
  --last 1d
