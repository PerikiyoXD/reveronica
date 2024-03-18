#!/bin/bash

# Define the string to search for
search_string="IECSsreV"

# Loop through all files in the current directory
for file in *; do
    # Skip this script
    if [ "$file" = "MatchAndRename_PSX_VAG.sh" ]; then
        continue
    fi

    # Check if the file is a regular file
    if [ -f "$file" ]; then
        # Check if the file contains the search string
        if grep -q "$search_string" "$file"; then
            # Extract the filename without extension
            filename=$(basename -- "$file")
            filename_no_ext="${filename%.*}"
            # Rename the file to include the .vag extension
            mv "$file" "$filename_no_ext.vag"
            echo "File '$file' renamed to '$filename_no_ext.vag'"
        fi
    fi
done
