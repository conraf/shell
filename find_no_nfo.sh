#!/bin/bash

# Verifica che il numero di argomenti sia corretto
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

SEARCH_DIR="$1"

# Verifica se la directory esiste
if [ ! -d "$SEARCH_DIR" ]; then
    echo "Directory not found!"
    exit 1
fi

# Trova le directory senza file .nfo
find "$SEARCH_DIR" -type d | while read -r dir; do
    if [ "$(find "$dir" -maxdepth 1 -name "*.nfo" | wc -l)" -eq 0 ];
then
        echo "$dir"
    fi
done