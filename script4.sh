#!/bin/bash
# Script 4: Log File Scanner with Retry
# Author: Jivanshi Rajput | Reg: 24BCE10609

LOGFILE=${1:-"/var/log/syslog"}
KEYWORD=${2:-"error"}
MAX_ATTEMPTS=3
ATTEMPTS=0
COUNT=0

while true; do
  ATTEMPTS=$((ATTEMPTS + 1))
  if [ ! -f "$LOGFILE" ]; then
    echo "Attempt $ATTEMPTS: File not found."
  elif [ ! -s "$LOGFILE" ]; then
    echo "Attempt $ATTEMPTS: File is empty."
  else
    break
  fi
  [ $ATTEMPTS -ge $MAX_ATTEMPTS ] && { echo "Max attempts reached."; exit 1; }
  sleep 1
done

echo "Scanning $LOGFILE for: '$KEYWORD'"
while IFS= read -r LINE; do
  if echo "$LINE" | grep -iq "$KEYWORD"; then
    COUNT=$((COUNT + 1))
  fi
done < "$LOGFILE"

echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo "--- Last 5 matching lines ---"
grep -i "$KEYWORD" "$LOGFILE" | tail -5
