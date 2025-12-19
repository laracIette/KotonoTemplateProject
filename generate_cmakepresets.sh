#!/bin/bash

main() {
    # Stop if any command fails inside main
    set -e

    echo "Build with editor? (y/n)"
    read -n 1 with_editor
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

    ENGINE_PATH="$engine_path"

    echo "Selected options :"
    echo "- WITH_EDITOR=$EDITOR"
    echo "- ENGINE_PATH=$ENGINE_PATH"
    echo

    # Define the filename
    FILENAME="CMakePresets.json"

    # Write the content to the file
    cat <<EOF > $FILENAME
{
    "version": 3,
    "configurePresets": [
        {
            "name": "default",
            "displayName": "Kotono Engine Config",
            "description": "Ninja Multi-Config with Editor enabled",
            "generator": "Ninja Multi-Config",
            "binaryDir": "\${sourceDir}/build",
            "cacheVariables": {
                "WITH_EDITOR": "$EDITOR",
                "ENGINE_PATH": "$ENGINE_PATH",
                "CMAKE_EXPORT_COMPILE_COMMANDS": "ON"
            }
        }
    ],
    "buildPresets": [
        {
            "name": "debug",
            "configurePreset": "default",
            "configuration": "Debug"
        },
        {
            "name": "release",
            "configurePreset": "default",
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