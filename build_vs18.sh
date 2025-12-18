#!/bin/bash

main() {
    # Stop if any command fails inside main
    set -e

    echo "🛠️ Build with editor? (y/n)"
    read -n 1 with_editor
    echo

    echo "Kotono Engine path :"
    read -r engine_path
    echo

    if [[ "$with_editor" == "y" ]]; then
        EDITOR="-DWITH_EDITOR=ON"
    else
        EDITOR="-DWITH_EDITOR=OFF"
    fi

    ENGINE_PATH="-DENGINE_PATH:PATH=$engine_path"

    echo "Selected definitions :"
    echo "$EDITOR"
    echo "$ENGINE_PATH"
    echo

    BUILD_DIR="build"

    echo "📁 Creating build folder at: $BUILD_DIR"
    rm -rf "$BUILD_DIR"
    mkdir "$BUILD_DIR"
    cd "$BUILD_DIR"

    echo "⚙️ Running CMake from project root..."
    cmake .. -G "Visual Studio 18 2026" -A x64 $EDITOR "$ENGINE_PATH"
    echo "✅ CMake generation complete!"
}

# Run the script and catch errors
if ! main; then
    echo
    echo "❌ The script failed. Press Enter to exit."
    read
fi