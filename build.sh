#!/bin/bash

set -e

PROJECT_NAME="Love2D-Game-Template"

mkdir -p build

echo "Creating ${PROJECT_NAME}.love..."

cd "$(dirname "$0")"

zip -9 -r "build/${PROJECT_NAME}.love" . \
    -x ".git/*" \
       "build/*" \
       ".vscode/*.log"

echo "Build complete:"
echo "build/${PROJECT_NAME}.love"