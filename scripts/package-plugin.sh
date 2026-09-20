#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 <plugin-name>" >&2
  exit 2
}

[[ $# -eq 1 ]] || usage

PLUGIN_NAME="$1"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"
PLUGIN_DIR="$REPO_ROOT/plugins/$PLUGIN_NAME"
DIST_DIR="$REPO_ROOT/dist"

"$SCRIPT_DIR/validate-plugin.sh" "$PLUGIN_NAME"

for cmd in jq zip unzip mktemp; do
  command -v "$cmd" >/dev/null 2>&1 || {
    echo "Missing required command: $cmd" >&2
    exit 1
  }
done

VERSION="$(jq -r '.version' "$PLUGIN_DIR/plugin.json")"
[[ -n "$VERSION" && "$VERSION" != "null" ]] || {
  echo "plugin.json has no version" >&2
  exit 1
}

mkdir -p "$DIST_DIR"
OUTPUT="$DIST_DIR/${PLUGIN_NAME}-${VERSION}.zip"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

mkdir -p "$TMP_DIR/$PLUGIN_NAME"
cp -a "$PLUGIN_DIR/." "$TMP_DIR/$PLUGIN_NAME/"
find "$TMP_DIR/$PLUGIN_NAME" -name '.DS_Store' -delete
rm -rf "$TMP_DIR/$PLUGIN_NAME/.git"

rm -f "$OUTPUT"
(
  cd "$TMP_DIR"
  zip -q -r "$OUTPUT" "$PLUGIN_NAME"
)

mapfile -t TOP_LEVEL < <(unzip -Z1 "$OUTPUT" | awk -F/ 'NF {print $1}' | sort -u)
[[ ${#TOP_LEVEL[@]} -eq 1 && "${TOP_LEVEL[0]}" == "$PLUGIN_NAME" ]] || {
  echo "Archive must contain exactly one top-level plugin directory" >&2
  exit 1
}

unzip -Z1 "$OUTPUT" | grep -Fxq "$PLUGIN_NAME/plugin.json" || {
  echo "Archive is missing $PLUGIN_NAME/plugin.json" >&2
  exit 1
}

unzip -Z1 "$OUTPUT" | grep -Eq "^${PLUGIN_NAME}/skills/[^/]+/SKILL\.md$" || {
  echo "Archive contains no valid skill entry" >&2
  exit 1
}

echo "$OUTPUT"
