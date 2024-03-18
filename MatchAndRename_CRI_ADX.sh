#!/bin/bash

# Define the string to search for
search_string="(c)CRI"

# Loop through all files in the current directory
for file in *; do
    # Skip this script
    if [ "$file" = "MatchAndRename_CRI_ADX.sh" ]; then
        continue
    fi

    # Check if the file is a regular file
    if [ -f "$file" ]; then
        # Check if the file contains the search string
        if grep -q "$search_string" "$file"; then
            # Extract the filename without extension
            filename=$(basename -- "$file")
            filename_no_ext="${filename%.*}"
            # Rename the file to include the .adx extension
            mv "$file" "$filename_no_ext.adx"
            echo "File '$file' renamed to '$filename_no_ext.adx'"
        fi
    fi
done
