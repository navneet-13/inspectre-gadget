#!/bin/bash

# Define the parameters
ADDRESS_LIST="/home/navneet/kernel_addresses_list.csv" # Path to the kernel addresses file
CONFIG_FILE="config_all.yaml"                          # Configuration file
OUTPUT_DIR="out"                                       # Output directory for files
BATCH_SIZE=$1                                          # Batch size passed as the first argument
MEM_THRESHOLD=80
CORES=$(($(nproc) - 5))          # Subtract 5 from the total number of cores
CORES=$((CORES > 0 ? CORES : 1)) # Ensure at least 1 core is used

current_date=$(date +'%Y-%m-%d')
ADDED_BATCH_LIST="analyze-batch-log_${current_date}.log"

TIMEOUT_LOG="timeout_${current_date}.log"

CUR_DIR=$(pwd) # Temporary directory for storing batches
BATCH_START_NUMBER=${2:-1}

# Check if batch size is provided
if [ -z "$BATCH_SIZE" ]; then
  echo "Please provide a batch size."
  exit 1
fi

# Check if the address list file exists
if [ ! -f "$ADDRESS_LIST" ]; then
  echo "Address list file not found at $ADDRESS_LIST"
  exit 1
fi

# Create output directories if they don't exist
mkdir -p "$OUTPUT_DIR"
# mkdir -p "$CUR_DIR/out"
mkdir -p "$CUR_DIR/output"

check_memory_usage() {
  # Get the current memory usage percentage using free command
  used_memory=$(free | grep Mem | awk '{print $3}')
  total_memory=$(free | grep Mem | awk '{print $2}')

  # Calculate the memory usage percentage
  memory_usage=$((100 * used_memory / total_memory))

  # Return the memory usage value
  echo $memory_usage
}

# Function to process a batch of addresses
process_batch() {
  local batch_start=$1
  local batch_end=$2
  local batch_output_file="$OUTPUT_DIR/batch_addresses_${batch_start}_${batch_end}.csv"
  local batch_number=$(((batch_start - 1) / 50 + 1))
  local batch_number_padded=$(printf "%06d" $batch_number)
  local timeout_duration=$((5 * 3600))

  local current_datetime=$(date +"%Y-%m-%d %H:%M:%S %Z")

  echo "batch_number_added: ${batch_number_padded}, ${current_datetime}" | tee -a "$ADDED_BATCH_LIST"

  # Extract the batch of addresses from the main address list
  sed -n "${batch_start},${batch_end}p" "$ADDRESS_LIST" >"$batch_output_file"

  # Run the inspectre command on the current batch
  timeout "$timeout_duration" ./inspectre analyze /home/navneet/vmlinux \
    --address-list "$batch_output_file" \
    --config "$CONFIG_FILE" \
    --output "$OUTPUT_DIR/gadgets_${batch_number_padded}.csv" \
    --tfp-output "$CUR_DIR/output/tfp_${batch_number_padded}.csv" \
    --asm "$OUTPUT_DIR/asm_${batch_number_padded}" >"$OUTPUT_DIR/out_log_${batch_number_padded}.txt"

  if [ $? -eq 124 ]; then
    echo "Processing for batch ${batch_number_padded} timed out and was killed." | tee -a "$TIMEOUT_LOG"
    timeout_datetime=$(date +"%Y-%m-%d %H:%M:%S %Z")
    echo "Batch_${batch_start}_${batch_end}.csv timed out at ${timeout_datetime}" >>"$TIMEOUT_LOG"
  fi
}

# Split the addresses into batches
total_addresses=$(wc -l <"$ADDRESS_LIST")                                # Total number of addresses in the file
addresses_per_batch=$(((total_addresses + BATCH_SIZE - 1) / BATCH_SIZE)) # Calculate the number of batches

# Start processing the batches in parallel, dynamically assign work to available cores
batch_start=$(((BATCH_START_NUMBER - 1) * 50 + 1))
batch_end=$((batch_start + BATCH_SIZE - 1))

# Function to dynamically assign batches
assign_batches() {
  while [ "$batch_start" -le "$total_addresses" ]; do
    process_batch "$batch_start" "$batch_end" & # Run batch processing in the background

    # Move to the next batch
    batch_start=$((batch_end + 1))
    batch_end=$((batch_start + BATCH_SIZE - 1))

    if [ "$batch_end" -gt "$total_addresses" ]; then
      batch_end=$total_addresses

      echo "All batches added." | tee -a "$ADDED_BATCH_LIST"

    fi

    # Limit the number of concurrent jobs based on available cores
    while [ "$(jobs -r | wc -l)" -ge "$CORES" ]; do
      sleep 0.1 # Wait for a free core
    done

    memory_usage=$(check_memory_usage)
    while [ "$memory_usage" -ge "$MEM_THRESHOLD" ]; do
      sleep 0.1
    done

  done
}

# Start the batch assignment
assign_batches

# Wait for all background processes to finish
wait

echo "Batch processing complete."
