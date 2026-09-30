#!/usr/bin/env bash
# Symlink bin/* into $1 (default: ~/.local/bin).
set -euo pipefail

dest="${1:-$HOME/.local/bin}"
mkdir -p "$dest"

dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

for script in "$dir"/bin/*; do
  ln -sf "$script" "$dest/$(basename "$script")"
  echo "linked $(basename "$script") -> $dest/$(basename "$script")"
done
