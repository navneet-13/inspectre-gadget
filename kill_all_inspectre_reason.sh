#!/bin/bash

# Check if any inspectre processes are running
inspectre_processes=$(pgrep -f "./inspectre reason")

if [[ -z "$inspectre_processes" ]]; then
    echo "No './inspectre reason' processes found."
    exit 0
fi

# Display the processes to be killed
echo "The following './inspectre reason' processes will be killed:"
echo "$inspectre_processes"

# Kill the processes
echo "$inspectre_processes" | xargs kill -9

# Confirm if the processes are terminated
if [[ $? -eq 0 ]]; then
    echo "All './inspectre reason' processes have been successfully killed."
else
    echo "Failed to kill some processes. You may need to check manually."
fi

