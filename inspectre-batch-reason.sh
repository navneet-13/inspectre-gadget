#!/bin/bash

# Number of cores to utilize (default to the number of available processors)
# NUM_CORES=$(nproc)
OUT_DIR="out"
LOG_FILE="inspectre_reasoner_jobs.log"

NUM_CORES=$(( $(nproc) - 5 ))  # Subtract 5 from the total number of cores
NUM_CORES=$(( NUM_CORES > 0 ? NUM_CORES : 1 ))  # Ensure at least 1 core is used

# Check if the required script exists
if [[ ! -x "./inspectre" ]]; then
    echo "Error: ./inspectre script not found or is not executable."
    exit 1
fi

# Check if the out directory exists
if [[ ! -d "$OUT_DIR" ]]; then
    echo "Error: Directory '$OUT_DIR' does not exist."
    exit 1
fi

# Function to check the number of active processes
active_jobs() {
    jobs -rp | wc -l
}

echo "Started processing ......" > "$LOG_FILE"

# Iterate over all CSV files in the out directory starting with 'gadgets'
for file in "$OUT_DIR"/gadgets*.csv; do

     if [[ "$file" == *reasoned.csv ]]; then
        continue
    fi

    if [[ -f "$file" ]]; then
        # Generate output file and log file names
        output_file="${file%.*}_reasoned.csv"
        log_file="${file%.*}_inspectre.log"

        # Wait until a core is free
        while [ "$(jobs -r | wc -l)" -ge "$NUM_CORES" ]; do
        sleep 0.1  # Wait for a free core
        done

        # Run the inspectre script in the background and save its output to a log file
        echo "Starting $file -> $output_file (Log: $log_file)" | tee -a "$LOG_FILE"
	    (
            ./inspectre reason "$file" "$output_file" > "$log_file"  2>&1 
            if [[ $? -eq 0 ]]; then
                echo "Completed: $file -> $output_file (Log: $log_file)" | tee -a "$LOG_FILE"
            else
                echo "Failed: $file -> $output_file (Log: $log_file)" | tee -a "$LOG_FILE"
            fi
        ) &

        # Capture process ID for tracking
        echo "Started processing $file with PID $!" >> "$LOG_FILE"
    fi
done

# Wait for all background processes to complete
wait

echo "All tasks completed."

