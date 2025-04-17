#!/bin/bash

# Exit immediately if any command fails
set -e

# Function to install SnowSQL via Homebrew
install_snowsql() {
    echo "📦 Installing SnowSQL..."
    if brew install --cask snowflake-snowsql; then
        echo "✅ SnowSQL installed successfully."
        return 0
    else
        echo "❌ Failed to install SnowSQL." >&2
        return 1
    fi
}

# Function to get the path to the SnowSQL executable
get_snowsql_path() {
    local snowsql_path
    snowsql_path=$(command -v snowsql)

    if [[ -n "$snowsql_path" ]]; then
        echo "$snowsql_path"  # Output for capture in main
        return 0
    else
        echo "❌ SnowSQL path not found." >&2
        return 1
    fi
}

# Function to append alias to shell profile, if not already present
append_to_shell_profile() {
    local snowsql_path="$1"
    local alias_command="alias snowsql=\"$snowsql_path\""

    # Determine the appropriate shell profile file
    local shell_rc_file="$HOME/.bash_profile"
    [[ $SHELL == */zsh ]] && shell_rc_file="$HOME/.zshrc"

    # Avoid duplicate aliases
    if grep -Fxq "$alias_command" "$shell_rc_file"; then
        echo "ℹ️ Alias already exists in $shell_rc_file"
        return 0
    fi

    echo "$alias_command" >> "$shell_rc_file"
    echo "✅ Alias added to $shell_rc_file"

    return 0
}

# Main script execution
main() {
    if install_snowsql; then
        local snowsql_path
        snowsql_path=$(get_snowsql_path)

        if [[ -n "$snowsql_path" ]]; then
            echo "🔍 SnowSQL found at: $snowsql_path"
            append_to_shell_profile "$snowsql_path"
        else
            echo "❌ Cannot configure alias: SnowSQL path not found." >&2
            exit 1
        fi
    else
