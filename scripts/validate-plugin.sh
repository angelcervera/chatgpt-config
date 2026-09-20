#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 <plugin-name>" >&2
  exit 2
}

[[ $# -eq 1 ]] || usage

PLUGIN_NAME="$1"
[[ "$PLUGIN_NAME" =~ ^[a-z0-9][a-z0-9-]*$ ]] || {
  echo "Invalid plugin name: $PLUGIN_NAME" >&2
  exit 1
}

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"
PLUGIN_DIR="$REPO_ROOT/plugins/$PLUGIN_NAME"
MANIFEST="$PLUGIN_DIR/plugin.json"
MARKETPLACE="$REPO_ROOT/.agents/plugins/marketplace.json"

for cmd in jq find grep; do
  command -v "$cmd" >/dev/null 2>&1 || {
    echo "Missing required command: $cmd" >&2
    exit 1
  }
done

[[ -d "$PLUGIN_DIR" ]] || {
  echo "Plugin directory not found: $PLUGIN_DIR" >&2
  exit 1
}

[[ -f "$MANIFEST" ]] || {
  echo "Missing plugin manifest: $MANIFEST" >&2
  exit 1
}

jq -e . "$MANIFEST" >/dev/null

jq -e --arg expected "$PLUGIN_NAME" '
  .["$schema"] == "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json" and
  .name == $expected and
  (.version | type == "string" and length > 0) and
  (.description | type == "string" and length > 0)
' "$MANIFEST" >/dev/null || {
  echo "Invalid portable plugin manifest: $MANIFEST" >&2
  exit 1
}

mapfile -t SKILLS < <(find "$PLUGIN_DIR/skills" -mindepth 2 -maxdepth 2 -type f -name SKILL.md -print 2>/dev/null | sort)
[[ ${#SKILLS[@]} -gt 0 ]] || {
  echo "No skills/*/SKILL.md found in $PLUGIN_DIR" >&2
  exit 1
}

for skill in "${SKILLS[@]}"; do
  first_line="$(head -n 1 "$skill")"
  [[ "$first_line" == "---" ]] || {
    echo "SKILL.md must start with YAML frontmatter: $skill" >&2
    exit 1
  }

  frontmatter="$(awk 'NR==1 {next} /^---$/ {exit} {print}' "$skill")"
  grep -Eq '^name:[[:space:]]*[^[:space:]].*$' <<<"$frontmatter" || {
    echo "Missing skill name in frontmatter: $skill" >&2
    exit 1
  }
  grep -Eq '^description:[[:space:]]*[^[:space:]].*$' <<<"$frontmatter" || {
    echo "Missing skill description in frontmatter: $skill" >&2
    exit 1
  }
done

if [[ -f "$MARKETPLACE" ]]; then
  jq -e . "$MARKETPLACE" >/dev/null
  jq -e --arg name "$PLUGIN_NAME" --arg path "./plugins/$PLUGIN_NAME" '
    any(.plugins[]?; .name == $name and .source.source == "local" and .source.path == $path)
  ' "$MARKETPLACE" >/dev/null || {
    echo "Plugin is not registered correctly in $MARKETPLACE" >&2
    exit 1
  }
fi

echo "OK: $PLUGIN_NAME"
