#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

found=0
while IFS= read -r manifest; do
  found=1
  plugin_dir="$(dirname -- "$manifest")"
  plugin_name="$(basename -- "$plugin_dir")"
  "$SCRIPT_DIR/package-plugin.sh" "$plugin_name"
done < <(find "$REPO_ROOT/plugins" -mindepth 2 -maxdepth 2 -type f -name plugin.json -print | sort)

[[ $found -eq 1 ]] || {
  echo "No plugins found under $REPO_ROOT/plugins" >&2
  exit 1
}
