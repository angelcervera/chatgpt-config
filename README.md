# chatgpt-config

Source-controlled ChatGPT configuration: Agent Plugins, reusable Skills, and future custom GPT source definitions.

## Repository layout

```text
.
├── .agents/
│   └── plugins/
│       └── marketplace.json
├── plugins/
│   └── <plugin-name>/
│       ├── plugin.json
│       └── skills/
│           └── <skill-name>/
│               ├── SKILL.md
│               ├── agents/
│               │   └── openai.yaml   # optional ChatGPT/Codex UI metadata
│               ├── references/       # optional
│               ├── scripts/          # optional
│               └── assets/           # optional
├── gpts/
├── scripts/
│   ├── validate-plugin.sh
│   ├── package-plugin.sh
│   ├── package-skill.sh
│   └── package-all.sh
├── dist/                              # generated, gitignored
└── Makefile
```

The layout supports both reusable standalone Skills and portable Agent Plugins. The same skill source is used for both artifacts.

## Current plugin / skill

### `opencode-handoff`

Generates a self-contained implementation handoff from the current ChatGPT conversation for execution in OpenCode.

Canonical skill source:

```text
plugins/opencode-handoff/skills/opencode-handoff/
```

The skill includes `agents/openai.yaml` so ChatGPT Desktop presents it as **OpenCode Handoff**. Implicit invocation is disabled intentionally; select it explicitly when you want a handoff.

Diagnostic after installation:

```text
@OpenCode Handoff status
```

Expected response:

```text
OpenCode Handoff v2.0.0 active.
```

## Validate plugin

```bash
./scripts/validate-plugin.sh opencode-handoff
```

or:

```bash
make validate PLUGIN=opencode-handoff
```

## Build standalone Skill for ChatGPT Desktop

```bash
./scripts/package-skill.sh opencode-handoff opencode-handoff
```

or:

```bash
make package-skill PLUGIN=opencode-handoff SKILL=opencode-handoff
```

Artifact:

```text
dist/skills/opencode-handoff-2.0.0.zip
```

The ZIP contains exactly one top-level `opencode-handoff/` directory with `SKILL.md` and its supporting resources. Upload this ZIP from **Plugins → Skills → Create → Upload from your computer** in ChatGPT Desktop.

## Build portable Plugin

```bash
./scripts/package-plugin.sh opencode-handoff
```

or:

```bash
make package PLUGIN=opencode-handoff
```

Artifact:

```text
dist/opencode-handoff-2.0.0.zip
```

Build all plugins:

```bash
./scripts/package-all.sh
```

Generated ZIP files are never committed.

## Adding another plugin / skill

1. Create `plugins/<plugin-name>/plugin.json`.
2. Add skills under `plugins/<plugin-name>/skills/<skill-name>/SKILL.md`.
3. Optionally add `agents/openai.yaml` for ChatGPT/Codex UI metadata and invocation policy.
4. Register the plugin in `.agents/plugins/marketplace.json`.
5. Validate the plugin.
6. Build either the standalone skill ZIP, the portable plugin ZIP, or both.

## Custom GPTs

`gpts/` is intentionally separate. Custom GPT configuration is not an Agent Plugin package and should not be included in plugin ZIPs.

## OpenAI references

- Skills: https://developers.openai.com/docs/build-skills
- Skills in ChatGPT: https://help.openai.com/en/articles/20001066
- Agent Plugin packaging: https://developers.openai.com/plugins/build/plugins
- Plugin archive validation: https://developers.openai.com/plugins/deploy/submission-errors
