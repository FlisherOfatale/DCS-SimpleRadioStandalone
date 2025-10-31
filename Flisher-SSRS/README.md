## Description
This folder is intended to create a simpler version of the basic client

## Stripped content
### Removed Auto Updater code, but kept the class
UpdaterChecker Class Simplified:
- Removed all GitHub API integration
- Removed CheckForUpdate method completely
- Removed LaunchUpdater method
- Removed UpdateCallback delegate and related classes
- Kept only version display functionality with VERSION and MINIMUM_PROTOCOL_VERSION constants
- All CheckForUpdate References Removed:

Removed installer Original code
