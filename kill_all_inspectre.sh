#!/bin/bash

# Define the pattern to search for
PATTERN="./inspectre"

# Find processes matching the pattern and extract their PIDs
PIDS=$(ps aux | grep "$PATTERN" | grep -v grep | awk '{print $2}')

# Check if any PIDs were found
if [ -z "$PIDS" ]; then
  echo "No processes matching pattern '$PATTERN' found."
  exit 0
fi

# Kill each process
for PID in $PIDS; do
  echo "Killing process with PID: $PID"
  kill -9 $PID
done

echo "All processes matching pattern '$PATTERN' have been killed."