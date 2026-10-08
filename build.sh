#!/bin/bash

set -e
cd "$(dirname "$0")"

PROJECT_NAME="Love2D-Game-Template"
LOVE_APPIMAGE="../tools/love-11.5-x86_64.AppImage"

BUILD_DIR="build"
LINUX_DIR="$BUILD_DIR/linux"

echo "=== Building $PROJECT_NAME ==="

# Clean previous build
rm -rf "$BUILD_DIR"
mkdir -p "$LINUX_DIR"

# Create .love file
echo "Creating .love..."
zip -9 -r "$BUILD_DIR/$PROJECT_NAME.love" . \
    -x ".git/*" \
       "build/*" \
       ".vscode/*.log"

# Extract LÖVE runtime
echo "Extracting LÖVE runtime..."
"$LOVE_APPIMAGE" --appimage-extract >/dev/null

# Copy LÖVE binary
echo "Preparing Linux build..."
cp squashfs-root/bin/love "$LINUX_DIR/$PROJECT_NAME"

# Copy required library
mkdir -p "$BUILD_DIR/lib"
cp squashfs-root/lib/liblove-11.5.so "$BUILD_DIR/lib/"

# Append game to LÖVE binary
cat "$BUILD_DIR/$PROJECT_NAME.love" >> "$LINUX_DIR/$PROJECT_NAME"

# Make executable
chmod +x "$LINUX_DIR/$PROJECT_NAME"

# Remove temporary runtime
rm -rf squashfs-root

echo
echo "=== Build complete ==="
echo "Linux: $LINUX_DIR/$PROJECT_NAME"