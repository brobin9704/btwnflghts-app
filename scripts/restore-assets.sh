#!/bin/sh
# Restores the app icon/splash PNGs from their base64 text files and
# regenerates all platform icons/splashes.
# The PNGs are stored as base64 text because this repo is pushed through
# a text-only snapshot tool that cannot carry binary files.
# Run: sh scripts/restore-assets.sh
set -e
cd "$(dirname "$0")/.."
# NOTE: `base64 -d` is decode on Linux (GNU) but debug on macOS (BSD) —
# decode there is `-D`. `--decode` works on both, so use it.
base64 --decode assets/icon.png.b64 > assets/icon.png
base64 --decode assets/splash.png.b64 > assets/splash.png
npx @capacitor/assets generate --iconBackgroundColor '#0e091d' --splashBackgroundColor '#0e091d'
