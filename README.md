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

## Building from Source

### Prerequisites
- Swift 5.5+
- macOS 11.0+

### Build Steps
```bash
git clone https://github.com/gl-aarav/MenuQuickLink.git
cd MenuQuickLink
swiftc -parse-as-library main.swift -o MenuQuickLink -framework Cocoa -framework SwiftUI
mkdir -p MenuQuickLink.app/Contents/MacOS
cp MenuQuickLink MenuQuickLink.app/Contents/MacOS/
./scripts/create_dmg.sh
```

## File Structure

```
MenuQuickLink/
├── main.swift          # Complete app source code
├── scripts/
│   └── create_dmg.sh  # DMG creation script
├── MenuQuickLink.app/  # Compiled application bundle
├── MenuQuickLink.dmg   # Installer file (app + Applications shortcut)
└── README.md           # This file
```

## Source Code Usage

This source code is provided for educational and reference purposes only. You are welcome to view, study, and learn from the code, but you may not:

- Redistribute the source code or compiled application as your own
- Use this code to create a competing product or service
- Remove or modify copyright notices
- Use this code for commercial purposes without explicit written permission

For permissions or inquiries, please contact Aarav Goyal directly.

## Contributing

Contributions are welcome! Feel free to open issues or pull requests.

## Future Enhancements

- [ ] Edit existing links
- [ ] Categorize links into folders
- [ ] Import/Export bookmarks
- [ ] Custom menu bar icon
- [ ] Website preview on hover
- [ ] Search functionality

## Support

For issues, questions, or suggestions, please open an [issue](https://github.com/gl-aarav/MenuQuickLink/issues) on GitHub.

---

Made with ❤️ for macOS
