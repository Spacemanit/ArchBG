#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/.local/bin"

mkdir -p "$BIN_DIR"
chmod +x "$REPO_DIR/live-desktop-dashboard" "$REPO_DIR/start-dashboard-wallpaper"

ln -sf "$REPO_DIR/live-desktop-dashboard" "$BIN_DIR/live-desktop-dashboard"
ln -sf "$REPO_DIR/start-dashboard-wallpaper" "$BIN_DIR/start-dashboard-wallpaper"

echo "Installed ArchBG scripts into $BIN_DIR"
echo "Run 'start-dashboard-wallpaper' to launch the live wallpaper."
