#!/bin/bash

# Function to check if SnowSQL is installed
check_snowsql_installed() {
    # Check if the 'snowsql' command is available
    if ! command -v snowsql &> /dev/null; then
        echo "SnowSQL is not installed on your machine. Please install it first."
        exit 1  # Exit the script if SnowSQL is not installed
    fi
}

# Function to prompt for connection name and connect to Snowflake
connect_to_snowflake() {
    # Prompt the user to enter the connection name
    echo -n "Enter the connection name from your SnowSQL config file: "
    read connection_name

    # Inform the user of the connection attempt
    echo "Connecting to Snowflake using the '$connection_name' connection..."

    # Attempt to connect to Snowflake using the provided connection name
    snowsql -c "$connection_name" -o log_level=DEBUG
}

# Main script execution
check_snowsql_installed  # Verify SnowSQL installation
connect_to_snowflake     # Connect to Snowflake