#!/bin/bash

# Remove toxic characters in filenames
detox *
for filename in *; do
    # Check if the item is a file
    if [ -f "$filename" ]; then
        # Extract the file extension
        extension="${filename##*.}"
        # Remove the last 14 characters from the filename, excluding the extension
        newname="${filename%??????????????????}.$extension"
        # Rename the file
        mv "$filename" "$newname"
    fi
done
