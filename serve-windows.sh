#!/usr/bin/env bash

# Serve the Windows build output folder over a local HTTP server so the .exe
# can be downloaded from a Windows machine on the same network.
#
# Binds to all interfaces (0.0.0.0) for LAN access. Browse to
# http://<this-machine-ip>:8000/ from the Windows box and grab raphael-xiv.exe.

set -euo pipefail

python3 -m http.server 8000 --directory target/x86_64-pc-windows-gnu/release
