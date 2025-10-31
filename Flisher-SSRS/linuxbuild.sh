#!/bin/bash

# Simple script to build Flisher-SSRS-Client for Windows from Linux

set -e

OUTPUT_PATH=${1:-"./install-build"}

echo "Building SuperSimpleRadio Client for Windows..."

# Check dotnet
if ! command -v dotnet &> /dev/null; then
    echo "Error: dotnet CLI not found"
    exit 1
fi

# Navigate to project root
cd ..

# Clean and build
rm -rf "$OUTPUT_PATH/Client"
dotnet clean "./Flisher-SSRS-Client/Flisher-SSRS-Client.csproj" /p:EnableWindowsTargeting=true
dotnet publish "./Flisher-SSRS-Client/Flisher-SSRS-Client.csproj" \
    --runtime win-x64 \
    --output "$OUTPUT_PATH/Client" \
    --self-contained false \
    --configuration Release \
    -p:PublishSingleFile=true \
    -p:DebugType=None \
    -p:DebugSymbols=false \
    -p:EnableWindowsTargeting=true

# Clean up
rm -f "$OUTPUT_PATH/Client"/*.so
rm -f "$OUTPUT_PATH/Client"/*.config

# Copy Windows native libs if they exist
if [ -d "$OUTPUT_PATH/Client/runtimes/win-x64/native" ]; then
    cp "$OUTPUT_PATH/Client/runtimes/win-x64/native"/*.dll "$OUTPUT_PATH/Client/"
    rm -rf "$OUTPUT_PATH/Client/runtimes"
fi

echo "Done! SuperSimpleRadio Client built to: $OUTPUT_PATH/Client"
