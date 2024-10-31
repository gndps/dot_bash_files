#!/bin/bash

# 1. source .bfinit inside the repo_path passed to this function
# 2. calls bfinit function inside repo_path/.bfinit once and create .init_restore_state file
init_repo() {
    # Check if the correct number of arguments is provided
    if [[ $# -lt 1 ]]; then
        echo "Usage: init_repo <repo_path>"
        return 1
    fi

    # Store the repo path argument
    local REPO_PATH=$1

    # Define the path to the .bfinit file inside the repo
    local BFINIT_FILE="$REPO_PATH/.bfinit"

    # Check if the repo path exists and is a directory
    if [[ ! -d $REPO_PATH ]]; then
        echo "Error: Directory '$REPO_PATH' does not exist."
        return 1
    fi

    # Check if the .bfinit file exists and is readable
    if [[ ! -f $BFINIT_FILE ]]; then
        echo "Error: '.bfinit' file not found in '$REPO_PATH'."
        return 1
    fi

    if [[ ! -r $BFINIT_FILE ]]; then
        echo "Error: '.bfinit' file in '$REPO_PATH' is not readable."
        return 1
    fi

    # Source the .bfinit file
    source "$BFINIT_FILE"

    # Define the initialization tracking file
    local INIT_TRACKING_FILE="$REPO_PATH/.init_tracking_file"

    # Perform initialization tracking
    if [[ ! -f $INIT_TRACKING_FILE ]]; then
        (
            # Move to the repo directory
            cd "$REPO_PATH" || return 1
            
            # Call bfinit function if declared
            if declare -F bfinit > /dev/null; then
                bfinit  # Execute individual repo logic
            else
                echo "Error: 'bfinit' function not implemented in '$BFINIT_FILE'."
                return 1
            fi
            
            # Mark as initialized
            echo "true" > "$INIT_TRACKING_FILE"
        )
    else
        echo "Initialization already done for '$REPO_PATH'."
    fi

    # Unset the bfinit function to avoid conflicts in future calls
    unset -f bfinit
}