# Fuchsius desktop downloads

The release stream has been reset to **v1.0.0**. Download installers from [Releases](https://github.com/tharindu-kulasinghe/fuchsius-updates/releases/latest). Earlier installers and release tags are retired after the replacement release is verified; private source history is preserved.

- **Windows x64:** `Fuchsius-Setup-1.0.0-x64.exe`.
- **Linux x64 or ARM64:** choose the matching AppImage for automatic in-app updates, or a DEB for system-managed installation. System packages can require operating-system permissions to update.
- **Mac:** releases and automatic updates are temporarily disabled until Apple Developer ID signing and notarization are configured. No unsigned Mac update feed is published.

Updates download in the background, then install and reopen the app on normal close or Quit. There is no GitHub login, personal access token or update button required. Checks run on startup and hourly; failed checks retry after five minutes. The app does not restart unexpectedly while you are working.

**One-time reset:** install the replacement v1.0.0 manually if you have any previous build, including an older v1.0.0 or a higher version. Automatic updates do not downgrade or replace the same version. Future releases increase to v1.0.1 and onward. The first signed Mac release also needs one manual installation; subsequent verified signed releases can update automatically.

This repository hosts installer assets and publishing automation. Application source stays in a separate private repository; CI credentials are used only for checkout/publishing and are not included in the app.
