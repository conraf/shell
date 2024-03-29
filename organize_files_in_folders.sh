#!/bin/bash

# Iterate over all files in the current directory
for file in *; do
    # Check if the item is a file (not a directory)
    if [ -f "$file" ]; then
        # Extract the file name without the extension
        dir_name=$(basename "$file" .${file##*.})
        
        # Create a directory with the file name (if it doesn't already exist)
        mkdir -p "$dir_name"
        
        # Move the file into the newly created directory
        mv "$file" "$dir_name"
    fi
done
