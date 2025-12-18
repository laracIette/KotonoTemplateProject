#!/bin/bash

main() {
    # Stop if any command fails inside main
    set -e

    echo "🛠️ Build with editor? (y/n)"
    read -n 1 with_editor
    echo

    if [[ "$with_editor" == "y" ]]; then
        EDITOR="-DWITH_EDITOR=ON"
    else
        EDITOR="-DWITH_EDITOR=OFF"
    fi

    echo "Kotono Engine path :"
    read -r engine_path
    echo

    if [[ "$engine_path" == "" ]]; then
        echo "The Kotono Engine path must not be empty"
        return
    fi

    ENGINE_PATH="-DENGINE_PATH:PATH=$engine_path"

    echo "Generator :"
    read -r generator
    echo

    if [[ "$generator" == "" ]]; then
        echo "The generator must not be empty"
        return
    fi

    GENERATOR="$generator"

    echo "Selected options :"
    echo "  $EDITOR"
    echo "  $ENGINE_PATH"
    echo "  $GENERATOR"
    echo

    BUILD_DIR="build"

    echo "📁 Creating build folder at: $BUILD_DIR"
    rm -rf "$BUILD_DIR"
    mkdir "$BUILD_DIR"
    cd "$BUILD_DIR"

    echo "⚙️ Running CMake from project root..."
    cmake .. -G "$GENERATOR" -A x64 $EDITOR "$ENGINE_PATH"
    echo "✅ CMake generation complete!"
}

# Run the script and catch errors
if ! main; then
    echo
    echo "❌ The script failed. Press Enter to exit."
    read
fi