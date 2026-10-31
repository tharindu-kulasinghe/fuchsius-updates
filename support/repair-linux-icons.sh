#!/bin/sh
# Repair the installed v1.0.0 icon lookup using user-owned theme files only.
set -eu
if [ "$(uname -s)" != Linux ]; then
  echo 'Run this repair on the Linux computer with Fuchsius installed.' >&2
  exit 1
fi
if ! command -v gdk-pixbuf-thumbnailer >/dev/null 2>&1; then
  echo 'Install the image utility, then run this script again:' >&2
  echo 'sudo apt install libgdk-pixbuf2.0-bin' >&2
  exit 1
fi
source_icon=''
for candidate in \
  /usr/share/icons/hicolor/1024x1024/apps/fuchsius.png \
  /usr/share/icons/hicolor/512x512/apps/fuchsius.png \
  /opt/Fuchsius/resources/icons/512x512.png; do
  if [ -f "$candidate" ]; then source_icon="$candidate"; break; fi
done
if [ -z "$source_icon" ]; then
  echo 'The installed Fuchsius icon is missing. Reinstall the correct Linux package.' >&2
  exit 1
fi
icon_home="${XDG_DATA_HOME:-$HOME/.local/share}/icons/hicolor"
repair_temp=$(mktemp -d)
trap 'rm -rf "$repair_temp"' EXIT HUP INT TERM
for size in 16 24 32 48 64 128 256 512; do
  destination="$icon_home/${size}x${size}/apps"
  mkdir -p "$destination"
  gdk-pixbuf-thumbnailer -s "$size" "$source_icon" "$repair_temp/${size}.png"
  install -m 644 "$repair_temp/${size}.png" "$destination/fuchsius.png"
done
if command -v gtk-update-icon-cache >/dev/null 2>&1; then
  gtk-update-icon-cache --force --ignore-theme-index "$icon_home" || true
fi
printf '%s\n' 'Fuchsius menu and taskbar icons repaired for this user.' \
  'Quit Fuchsius and reopen it from the application menu. Re-pin it if the old taskbar shortcut keeps its cached icon.'
