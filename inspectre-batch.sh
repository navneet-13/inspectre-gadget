#!/bin/bash

# Define the parameters
ADDRESS_LIST="/home/navneet/kernel_addresses_list.csv"  # Path to the kernel addresses file
CONFIG_FILE="config_all.yaml"  # Configuration file
OUTPUT_DIR="out"  # Output directory for files
BATCH_SIZE=$1  # Batch size passed as the first argument
CORES=$(nproc)  # Get the number of available cores
CUR_DIR=$(pwd)  # Temporary directory for storing batches

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

# Function to process a batch of addresses
process_batch() {
  local batch_start=$1
  local batch_end=$2
  local batch_output_file="$OUTPUT_DIR/batch_addresses_${batch_start}_${batch_end}.csv"

  # Extract the batch of addresses from the main address list
  sed -n "${batch_start},${batch_end}p" "$ADDRESS_LIST" > "$batch_output_file"

  # Run the inspectre command on the current batch
  ./inspectre analyze /tmp/vmlinux \
    --address-list "$batch_output_file" \
    --config "$CONFIG_FILE" \
    --output "$OUTPUT_DIR/gadgets_${batch_start}_${batch_end}.csv" \
    --tfp-output "$CUR_DIR/output/tfp_${batch_start}_${batch_end}.csv" \
    --asm "$OUTPUT_DIR/asm_${batch_start}_${batch_end}" > "$OUTPUT_DIR/out_log_${batch_start}_${batch_end}.txt" 
}

# Split the addresses into batches
total_addresses=$(wc -l < "$ADDRESS_LIST")  # Total number of addresses in the file
addresses_per_batch=$(( (total_addresses + BATCH_SIZE - 1) / BATCH_SIZE ))  # Calculate the number of batches

# Start processing the batches in parallel, dynamically assign work to available cores
batch_start=1
batch_end=$BATCH_SIZE

# Function to dynamically assign batches
assign_batches() {
  while [ "$batch_start" -le "$total_addresses" ]; do
    process_batch "$batch_start" "$batch_end" &  # Run batch processing in the background
    
    # Move to the next batch
    batch_start=$((batch_end + 1))
    batch_end=$((batch_start + BATCH_SIZE - 1))

    if [ "$batch_end" -gt "$total_addresses" ]; then
      batch_end=$total_addresses
    fi

    # Limit the number of concurrent jobs based on available cores
    while [ "$(jobs -r | wc -l)" -ge "$CORES" ]; do
      sleep 0.1  # Wait for a free core
    done
  done
}

# Start the batch assignment
assign_batches

# Wait for all background processes to finish
wait

echo "Batch processing complete."