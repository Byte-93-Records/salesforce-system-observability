#!/bin/bash

# Define the path to the SnowSQL configuration file
CONFIG_FILE="$HOME/.snowsql/config"

# Function to check if the connection 'snowsql_sso' already exists in the config file
check_connection_exists() {
    # Search for the 'snowsql_sso' connection in the config file
    if grep -q "\[connections.snowsql_sso\]" "$CONFIG_FILE"; then
        echo -n "The connection 'snowsql_sso' already exists in the config file. Do you want to overwrite it? (yes/no): "
        read answer
        # If the user does not want to overwrite, exit the script
        [[ "$answer" != "yes" ]] && echo "Exiting without changes." && exit 0
    fi
}

# Function to prompt the user for Snowflake parameters
prompt_for_parameters() {
    # Prompt for the Snowflake account name
    echo -n "Enter your Snowflake account name (e.g., xy12345.snowflakecomputing.com): "
    read accountname

    # Prompt for the Snowflake username
    echo -n "Enter your Snowflake username: "
    read username
}

# Function to write the connection details to the config file
write_to_config() {
    # Append the connection details to the config file
    cat <<EOL >> "$CONFIG_FILE"

[connections.snowsql_okta_sso]
accountname = $accountname
username = $username
authenticator = https://meraki.okta.com
EOL
    echo "The connection 'snowsql_sso' has been added/updated in the SnowSQL config file."
}

# Main script execution

# Ensure the config file exists; create it if it does not
[ ! -f "$CONFIG_FILE" ] && touch "$CONFIG_FILE"

check_connection_exists  # Check if the connection already exists
prompt_for_parameters    # Prompt the user for necessary parameters
write_to_config          # Write the parameters to the config file