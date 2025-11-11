# MenuQuickLink

A lightweight macOS menu bar application that lets you quickly access your favorite websites from the menu bar.

![Screenshot](https://img.shields.io/badge/macOS-11.0+-blue)

## Features

- **Quick Access**: Click the menu bar icon to open your website list
- **Easy Management**: Add, view, and delete websites from the popover menu
- **Persistent Storage**: Your links are automatically saved between sessions
- **One-Click Launch**: Open any website directly from the menu bar
- **Clean UI**: Minimal, distraction-free interface
- **No Dock Icon**: Runs purely as a menu bar utility

## Installation

### Option 1: DMG Installer
1. Download the latest `MenuQuickLink.dmg` from [Releases](https://github.com/gl-aarav/MenuQuickLink/releases)
2. Open the DMG file
3. Drag `MenuQuickLink` to the Applications folder
4. Launch from Applications or Spotlight (Cmd + Space)

### Option 2: Direct Build
1. Clone the repository
2. Compile:
```bash
swiftc -parse-as-library main.swift -o MenuQuickLink -framework Cocoa -framework SwiftUI
```
3. Create app bundle and run DMG creation script:
```bash
mkdir -p MenuQuickLink.app/Contents/MacOS
cp MenuQuickLink MenuQuickLink.app/Contents/MacOS/
./scripts/create_dmg.sh
```

## Usage

1. **Open the App**: Launch from Applications, Launchpad, or Spotlight
2. **Add a Link**: Click the `+` button in the menu and enter:
   - Site name (e.g., "GitHub")
   - URL (e.g., "github.com")
3. **Open a Link**: Click the arrow icon next to any link
4. **Delete a Link**: Click the trash icon
5. **Quit**: Click the X button (or Cmd + Q)

## System Requirements

- macOS 11.0 or later
- Apple Silicon (M1+) or Intel Mac

## Data Storage

Your bookmarks are stored locally in UserDefaults and persist between app launches. No cloud sync, no tracking.

## Support

For issues, questions, or suggestions, please open an [issue](https://github.com/gl-aarav/MenuQuickLink/issues) on GitHub.

---

Made with ❤️ for macOS
