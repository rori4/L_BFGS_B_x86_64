#!/bin/bash

# Generate checksums for files in ./products directory

# Check if products directory exists
if [ ! -d "./products" ]; then
    echo "Error: ./products directory not found"
    exit 1
fi

# Change to products directory
cd ./products

# Delete the contents of checksums.txt before starting
> ../checksums.txt

# Generate SHA256 checksums for all files in the specified format
for file in *; do
    if [ -f "$file" ]; then
        checksum=$(sha256sum "$file" | awk '{print $1}')
        echo "$checksum  ./products/$file" >> ../checksums.txt
    fi
done

echo "Checksums generated in checksums.txt"
