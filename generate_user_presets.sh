#!/bin/bash

main() {
    # Stop if any command fails inside main
    set -e

    echo "Build with editor? (y/n)"
    read with_editor
    echo

    if [[ "$with_editor" == "y" ]]; then
        EDITOR="ON"
    else
        EDITOR="OFF"
    fi

    echo "Kotono Engine path :"
    read -r engine_path
    echo

    if [[ "$engine_path" == "" ]]; then
        echo "The Kotono Engine path must not be empty"
        return
    fi

    ENGINE_PATH="${engine_path//\\//}"

    echo "Selected options :"
    echo "- WITH_EDITOR=$EDITOR"
    echo "- ENGINE_PATH=$ENGINE_PATH"
    echo

    # Define the filename
    FILENAME="CMakeUserPresets.json"

    # Write the content to the file
    cat <<EOF > $FILENAME
{
    "version": 3,
    "configurePresets": [
        {
            "name": "user-default",
            "displayName": "My Kotono Dev Config",
            "inherits": "base-config",
            "cacheVariables": {
                "WITH_EDITOR": "$EDITOR",
                "ENGINE_PATH": "$ENGINE_PATH"
            }
        }
    ],
    "buildPresets": [
        {
            "name": "debug",
            "configurePreset": "user-default",
            "configuration": "Debug"
        },
        {
            "name": "release",
            "configurePreset": "user-default",
            "configuration": "Release"
        }
    ]
}
EOF

    echo "$FILENAME has been generated successfully."
}

# Run the script and catch errors
if ! main; then
    echo
    echo "The script failed. Press Enter to exit."
    read
fi