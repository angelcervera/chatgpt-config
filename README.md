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
│       └── plugin.json
│       └── skills/
│           └── <skill-name>/
│               ├── SKILL.md
│               ├── references/   # optional
│               ├── scripts/      # optional
│               └── assets/       # optional
├── gpts/
├── scripts/
│   ├── validate-plugin.sh
│   ├── package-plugin.sh
│   └── package-all.sh
├── dist/                          # generated, gitignored
└── Makefile
```

The layout follows OpenAI's repository marketplace convention: repository-local plugins live under `plugins/`, and `.agents/plugins/marketplace.json` references them by paths relative to the repository root.

## Current plugins

### `opencode-handoff`

Generates a self-contained implementation handoff from the current ChatGPT conversation for execution in OpenCode.

Source:

```text
plugins/opencode-handoff/
```

Diagnostic after installation:

```text
@OpenCode Handoff status
```

Expected response:

```text
OpenCode Handoff v2.0.0 active.
```

## Validate

Validate one plugin:

```bash
./scripts/validate-plugin.sh opencode-handoff
```

or:

```bash
make validate PLUGIN=opencode-handoff
```

Validation checks the portable Agent Plugins manifest, skill frontmatter, and marketplace registration.

## Build ZIP packages

Build one plugin:

```bash
./scripts/package-plugin.sh opencode-handoff
```

or:

```bash
make package PLUGIN=opencode-handoff
```

Build all plugins:

```bash
./scripts/package-all.sh
```

or:

```bash
make package-all
```

Artifacts are created under `dist/`, for example:

```text
dist/opencode-handoff-2.0.0.zip
```

Each ZIP contains exactly one top-level plugin directory. This is accepted by OpenAI's plugin archive rules and avoids ambiguous archive roots.

## Adding another plugin

1. Create `plugins/<plugin-name>/plugin.json` using the portable Agent Plugins schema.
2. Add one or more skills under `plugins/<plugin-name>/skills/<skill-name>/SKILL.md`.
3. Register the plugin in `.agents/plugins/marketplace.json`.
4. Run `./scripts/validate-plugin.sh <plugin-name>`.
5. Run `./scripts/package-plugin.sh <plugin-name>`.

Do not place generated ZIP files in source control.

## Custom GPTs

`gpts/` is intentionally separate. Custom GPT configuration is not an Agent Plugin package and should not be included in plugin ZIPs. Store source definitions there and add a dedicated export/build mechanism only when a supported target format exists.

## OpenAI references

- Agent Plugin packaging: https://developers.openai.com/plugins/build/plugins
- Skills: https://developers.openai.com/docs/build-skills
- Plugin archive validation: https://developers.openai.com/plugins/deploy/submission-errors
