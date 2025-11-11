#!/bin/bash

# Script to create a clean DMG with only the app and Applications folder

set -e

# Configuration
APP_NAME="MenuQuickLink"
DMG_NAME="${APP_NAME}.dmg"
TEMP_DIR="/tmp/${APP_NAME}_dmg_build"
DMG_VOLUME_NAME="${APP_NAME}"
DMG_SIZE="200m"

# Clean up any previous builds
rm -rf "$TEMP_DIR"
rm -f "$DMG_NAME"

# Create temporary directory
mkdir -p "$TEMP_DIR"

# Copy the app to the temporary directory
if [ -d "${APP_NAME}.app" ]; then
    cp -r "${APP_NAME}.app" "$TEMP_DIR/"
else
    echo "Error: ${APP_NAME}.app not found. Please build the app first."
    exit 1
fi

# Create a symbolic link to Applications folder
ln -s /Applications "$TEMP_DIR/Applications"

# Create the DMG
hdiutil create -volname "$DMG_VOLUME_NAME" \
    -srcfolder "$TEMP_DIR" \
    -ov \
    -format UDZO \
    "$DMG_NAME"

# Optional: Set up the DMG appearance (requires hdiutil and custom settings)
# This requires macOS and AppleScript, but DMG is now created

# Clean up temporary directory
rm -rf "$TEMP_DIR"

echo "DMG created successfully: $DMG_NAME"
echo "Contents: ${APP_NAME}.app and Applications shortcut"
