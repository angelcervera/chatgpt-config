#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 <plugin-name> <skill-name>" >&2
  exit 2
}

[[ $# -eq 2 ]] || usage

PLUGIN_NAME="$1"
SKILL_NAME="$2"

for name in "$PLUGIN_NAME" "$SKILL_NAME"; do
  [[ "$name" =~ ^[a-z0-9][a-z0-9-]*$ ]] || {
    echo "Invalid name: $name" >&2
    exit 1
  }
done

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"
PLUGIN_DIR="$REPO_ROOT/plugins/$PLUGIN_NAME"
SKILL_DIR="$PLUGIN_DIR/skills/$SKILL_NAME"
MANIFEST="$PLUGIN_DIR/plugin.json"
DIST_DIR="$REPO_ROOT/dist/skills"

for cmd in jq zip unzip mktemp grep awk sort; do
  command -v "$cmd" >/dev/null 2>&1 || {
    echo "Missing required command: $cmd" >&2
    exit 1
  }
done

[[ -f "$SKILL_DIR/SKILL.md" ]] || {
  echo "Missing skill: $SKILL_DIR/SKILL.md" >&2
  exit 1
}

[[ -f "$MANIFEST" ]] || {
  echo "Missing plugin manifest: $MANIFEST" >&2
  exit 1
}

first_line="$(head -n 1 "$SKILL_DIR/SKILL.md")"
[[ "$first_line" == "---" ]] || {
  echo "SKILL.md must start with YAML frontmatter" >&2
  exit 1
}

frontmatter="$(awk 'NR==1 {next} /^---$/ {exit} {print}' "$SKILL_DIR/SKILL.md")"
grep -Eq '^name:[[:space:]]*[^[:space:]].*$' <<<"$frontmatter" || {
  echo "Missing skill name in SKILL.md frontmatter" >&2
  exit 1
}
grep -Eq '^description:[[:space:]]*[^[:space:]].*$' <<<"$frontmatter" || {
  echo "Missing skill description in SKILL.md frontmatter" >&2
  exit 1
}

VERSION="$(jq -r '.version' "$MANIFEST")"
[[ -n "$VERSION" && "$VERSION" != "null" ]] || {
  echo "plugin.json has no version" >&2
  exit 1
}

mkdir -p "$DIST_DIR"
OUTPUT="$DIST_DIR/${SKILL_NAME}-${VERSION}.zip"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

mkdir -p "$TMP_DIR/$SKILL_NAME"
cp -a "$SKILL_DIR/." "$TMP_DIR/$SKILL_NAME/"
find "$TMP_DIR/$SKILL_NAME" -name '.DS_Store' -delete
rm -rf "$TMP_DIR/$SKILL_NAME/.git"

rm -f "$OUTPUT"
(
  cd "$TMP_DIR"
  zip -q -r "$OUTPUT" "$SKILL_NAME"
)

mapfile -t TOP_LEVEL < <(unzip -Z1 "$OUTPUT" | awk -F/ 'NF {print $1}' | sort -u)
[[ ${#TOP_LEVEL[@]} -eq 1 && "${TOP_LEVEL[0]}" == "$SKILL_NAME" ]] || {
  echo "Archive must contain exactly one top-level skill directory" >&2
  exit 1
}

unzip -Z1 "$OUTPUT" | grep -Fxq "$SKILL_NAME/SKILL.md" || {
  echo "Archive is missing $SKILL_NAME/SKILL.md" >&2
  exit 1
}

echo "$OUTPUT"
