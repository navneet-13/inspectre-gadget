#!/bin/bash

# Define the output file where all logs will be combined
combined_log="combined_inspectre_logs.log"

# Initialize the output file by clearing it (or creating if it doesn't exist)
>"$combined_log"

# Loop through all files ending with "inspectre.log" in the "out" directory
for log_file in out/gadgets*inspectre.log; do
    # Check if the file exists to prevent errors if no files match
    if [[ -f "$log_file" ]]; then
        echo -e "\n--- Start of $log_file ---\n" >>"$combined_log"
        echo "Appending content from $log_file"
        # Append the content of the current log file to the combined log file
        cat "$log_file" >>"$combined_log"
        # Optionally add a separator between files for clarity

    fi
done

echo "All logs have been combined into $combined_log."
