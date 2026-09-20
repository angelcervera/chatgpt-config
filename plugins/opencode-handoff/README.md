# OpenCode Handoff

Portable Agent Plugin containing the `opencode-handoff` skill.

## Purpose

Turn the final state of a ChatGPT conversation into a self-contained Markdown handoff that OpenCode can execute without access to the original chat.

## Structure

```text
opencode-handoff/
├── plugin.json
└── skills/
    └── opencode-handoff/
        ├── SKILL.md
        └── references/
            └── handoff-template.md
```

Portable Agent Plugins discover skills from the root `skills/` directory. The root `plugin.json` is the portable Agent Plugins 1.0 manifest.

## Diagnostic

After installation, invoke:

```text
@OpenCode Handoff status
```

Expected response:

```text
OpenCode Handoff v2.0.0 active.
```

## Packaging

From the repository root:

```bash
./scripts/package-plugin.sh opencode-handoff
```

The archive is written to `dist/opencode-handoff-<version>.zip` and contains exactly one top-level plugin directory.

## References

- https://developers.openai.com/plugins/build/plugins
- https://developers.openai.com/docs/build-skills
