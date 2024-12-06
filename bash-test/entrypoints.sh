#!/bin/bash

# Check if a binary file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path_to_elf_binary>"
    exit 1
fi

BINARY="$1"

# Check if the file exists
if [ ! -f "$BINARY" ]; then
    echo "Error: File '$BINARY' does not exist."
    exit 1
fi

# Use readelf to extract symbols and filter for functions (FUNC)
readelf -Ws "$BINARY" | awk '
    $4 == "FUNC" && $7 != "UND" {  # Only FUNC symbols, ignore undefined (UND) ones
        printf "%s,%s\n", $2, $8 # Output in address,name format
    }
'
