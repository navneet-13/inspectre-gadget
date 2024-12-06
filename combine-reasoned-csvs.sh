#!/bin/bash

# Check if correct number of arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_directory> <output_file>"
    exit 1
fi

input_dir=$1
output_file=$2

# Ensure input directory exists
if [ ! -d "$input_dir" ]; then
    echo "Error: Input directory '$input_dir' does not exist."
    exit 1
fi

# Initialize an empty output file
> "$output_file"

# Track whether the header has been added
header_added=false

# Loop through all files ending with "_reasoned.csv" in the input directory
for file in "$input_dir"/*_reasoned.csv; do
    # Check if there are no matching files
    if [ ! -e "$file" ]; then
        echo "No files ending with '_reasoned.csv' found in $input_dir."
        exit 0
    fi

    # Add header from the first file only
    if ! $header_added; then
        head -n 1 "$file" >> "$output_file"
        header_added=true
    fi

    # Skip the header line and append the rest of the file
    tail -n +2 "$file" >> "$output_file"
done

mkdir "$input_dir"/combined_asm
for dir in "$input_dir"/asm_*; do 
    for file in $dir/*.asm; do
        cp $file "$input_dir"/combined_asm
    done
done

echo "Concatenation completed. Output saved to '$output_file'."

sqlite3 $output_file.db -cmd '.mode csv' -cmd '.separator ;' -cmd ".import $output_file gadgets" -cmd '.mode table'

echo "Database created from $output_file"

sqlite3 $output_file.db < queries/exploitable_list.sql