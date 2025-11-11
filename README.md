# Menu Bar App

A lightweight macOS menu bar application that lets you quickly access your favorite websites from the menu bar.

![Screenshot](https://img.shields.io/badge/macOS-11.0+-blue)
![License](https://img.shields.io/badge/license-MIT-green)

## Features

- **Quick Access**: Click the menu bar icon to open your website list
- **Easy Management**: Add, view, and delete websites from the popover menu
- **Persistent Storage**: Your links are automatically saved between sessions
- **One-Click Launch**: Open any website directly from the menu bar
- **Clean UI**: Minimal, distraction-free interface
- **No Dock Icon**: Runs purely as a menu bar utility

## Installation

### Option 1: DMG Installer
1. Download the latest `MenuBarApp.dmg` from [Releases](https://github.com/yourusername/MenuBarApp/releases)
2. Open the DMG file
3. Drag MenuBarApp to your Applications folder
4. Launch from Applications or Spotlight (Cmd + Space)

### Option 2: Direct Build
1. Clone the repository
2. Compile: `swiftc -parse-as-library main.swift -o MenuBarApp -framework Cocoa -framework SwiftUI`
3. Create app bundle: `mkdir -p MenuBarApp.app/Contents/MacOS && cp MenuBarApp MenuBarApp.app/Contents/MacOS/`
4. Copy to Applications: `cp -r MenuBarApp.app ~/Applications/`

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
- Swift 6.0+
- macOS 11.0+

### Build Steps
```bash
git clone https://github.com/yourusername/MenuBarApp.git
cd MenuBarApp
swiftc -parse-as-library main.swift -o MenuBarApp -framework Cocoa -framework SwiftUI
mkdir -p MenuBarApp.app/Contents/MacOS
cp MenuBarApp MenuBarApp.app/Contents/MacOS/
```

## File Structure

```
MenuBarApp/
├── main.swift          # Complete app source code
├── MenuBarApp.app/     # Compiled application bundle
├── MenuBarApp.dmg      # Installer file
├── README.md           # This file
└── LICENSE             # MIT License
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

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

For issues, questions, or suggestions, please open an [issue](https://github.com/yourusername/MenuBarApp/issues) on GitHub.

---

Made with ❤️ for macOS
