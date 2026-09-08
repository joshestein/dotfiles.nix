#!/bin/bash
# Read-only check: confirms every package listed in ../pacman/packages.txt
# is still installed. This is a curated, hand-picked list (not everything
# `pacman -Qe` reports — most of that is base-system/driver/toolchain noise),
# so this only checks presence in one direction: manifest -> installed.
# It never installs, removes, or modifies anything, so it never needs sudo
# (unlike the old aur-packages service this replaces).

set -euo pipefail

manifest="$HOME/.config/nix/pacman/packages.txt"

if [ ! -f "$manifest" ]; then
    echo "pacman-audit: manifest not found at $manifest" >&2
    exit 2
fi

missing=()
while IFS= read -r pkg; do
    # skip blank lines and comments
    [ -z "$pkg" ] && continue
    case "$pkg" in \#*) continue ;; esac

    pacman -Qi "$pkg" >/dev/null 2>&1 || missing+=("$pkg")
done < "$manifest"

if [ "${#missing[@]}" -eq 0 ]; then
    echo "pacman-audit: all tracked packages present"
    exit 0
fi

echo "Tracked in $manifest but not installed:"
printf '  - %s\n' "${missing[@]}"

if command -v notify-send >/dev/null 2>&1; then
    notify-send "pacman-audit" "${#missing[@]} tracked package(s) missing: ${missing[*]}" || true
fi

exit 1
