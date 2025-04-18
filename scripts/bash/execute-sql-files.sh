#!/bin/bash

# Function to trim leading and trailing whitespaces from a given string
trim() {
    local var="$*"
    var="${var#"${var%%[![:space:]]*}"}"  # Remove leading spaces
    var="${var%"${var##*[![:space:]]}"}"  # Remove trailing spaces
    printf '%s' "$var"
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <connection_name> <directory_path> <file1.sql,file2.sql,...,fileN.sql>"
    exit 1
fi

# Assigning the arguments to variables
SNOWSQL_CONNECTION="$1"
SQL_DIR="$2"
SQL_FILES="$3"

# Convert the comma-separated list into an array of file names
IFS=',' read -ra FILES <<< "$SQL_FILES"

# Loop through each file in the list and execute it
for SQL_FILE in "${FILES[@]}"; do
    # Trim any leading or trailing whitespace from the file name
    SQL_FILE_TRIMMED=$(trim "$SQL_FILE")
    
    # Construct the full path to the SQL file
    FULL_PATH="${SQL_DIR}/${SQL_FILE_TRIMMED}"
    
    # Check if the file exists before attempting to execute it
    if [ -f "$FULL_PATH" ]; then
        echo "Executing: ${FULL_PATH}"
        
        # Execute the SQL file using SnowSQL and check for errors
        snowsql -c "${SNOWSQL_CONNECTION}" -f "${FULL_PATH}"
        if [ $? -ne 0 ]; then
            echo "Error executing ${FULL_PATH}"
            exit 1
        fi
    else
        echo "File not found: ${FULL_PATH}"
    fi
done

echo "All specified SQL files executed successfully."