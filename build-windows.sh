#!/usr/bin/env bash

# Cross-compile the desktop app to Windows (x86_64) from macOS.
#
# `--no-default-features` drops the `self-update` feature, which removes the
# ehttp/ureq/rustls/ring TLS stack. `ring` needs a C/asm toolchain to build,
# so dropping it leaves a pure-Rust dependency tree that links with the
# mingw-w64 cross-linker (x86_64-w64-mingw32-gcc, e.g. from Homebrew).
#
# Note: these builds ship without the in-app self-updater.
#
# Prerequisites:
#   rustup target add x86_64-pc-windows-gnu
#   brew install mingw-w64
#
# Output: target/x86_64-pc-windows-gnu/release/raphael-xiv.exe

set -euxo pipefail

cargo build --release --no-default-features --target x86_64-pc-windows-gnu
