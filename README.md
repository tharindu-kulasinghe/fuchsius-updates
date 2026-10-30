# Fuchsius desktop downloads

Download the latest installers from [Releases](https://github.com/tharindu-kulasinghe/fuchsius-updates/releases/latest).

- **Windows:** `Fuchsius-Setup-<version>-x64.exe`.
- **Mac with Apple Silicon:** `Fuchsius-<version>-arm64.dmg`.
- **Mac with Intel:** `Fuchsius-<version>-x64.dmg`.
- **Linux:** choose the AppImage or DEB for your architecture.

Windows and Linux AppImage installations check for updates automatically and download them in the background. Closing the app when an update is ready installs it and reopens the updated version. No GitHub login or update token is required.

Mac updates are disabled in current ad-hoc builds while Apple Developer approval is pending. Install Mac releases manually. The first Apple Developer ID signed and notarized release will also require one manual installation; subsequent signed releases can update automatically.

This repository contains the installer publishing workflow and release downloads. Application source is maintained in a separate private repository. Installers include the bundled code needed to run the application.

The workflow checks for new source versions approximately every 15 minutes; GitHub schedules can be delayed. Existing installations from the old private update feed need one manual installation of a release from this repository.
