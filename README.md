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
├── prompts/
│   ├── chat-to-work/
│   │   ├── chat-to-work-context-transfer-prompt.md
│   │   └── chat-to-work-handoff-prompt.md
│   └── opencode-handoff/
│       ├── README.md
│       └── opencode-handoff-prompt.md
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

The skill includes `agents/openai.yaml` with the display name **OpenCode Handoff** and `allow_implicit_invocation: true`. These are source settings, not proof that a particular Chat session loaded the skill. For the direct manual workflow, see [Chat → OpenCode](#chat--opencode).

Diagnostic after installation:

```text
@OpenCode Handoff status
```

Expected response:

```text
OpenCode Handoff v2.0.1 active.
```

This is an output smoke check, not independent evidence of skill activation; the wording can also come from conversation context.

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
dist/skills/opencode-handoff-2.0.1.zip
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
dist/opencode-handoff-2.0.1.zip
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


## Reusable prompts

### Chat → OpenCode

[OpenCode handoff prompt](prompts/opencode-handoff/opencode-handoff-prompt.md): copy the single fenced block into the same Chat conversation to request a self-contained downloadable Markdown handoff directly for OpenCode, without invoking a Skill or moving to Work.

The prompt is based on skill/template v2.0.1, with explicit controls for obligation provenance, guarantee strength, scope fidelity, proportionality, and contract amendments. The [maintenance README](prompts/opencode-handoff/README.md) documents the review, deliberate differences, evidence limits, and regression scenarios. The existing skill remains unchanged; it does not automatically acquire these controls.

### Chat → Work

Two reusable prompts are stored under:

```text
prompts/chat-to-work/
```

- `chat-to-work-handoff-prompt.md`: paste at the end of a normal Chat conversation to generate a self-contained downloadable Markdown handoff for Work without relying on Skills.
- `chat-to-work-context-transfer-prompt.md`: paste at the beginning of a Work continuation when the previous Chat context has already been carried into Work and you want Work to treat it as authoritative continuation context.

These prompts are source-controlled separately from Skills because they are plain reusable conversation instructions and do not depend on Skill invocation support.

## Custom GPTs

`gpts/` is intentionally separate. Custom GPT configuration is not an Agent Plugin package and should not be included in plugin ZIPs.

## OpenAI references

- Skills: https://developers.openai.com/docs/build-skills
- Skills in ChatGPT: https://help.openai.com/en/articles/20001066
- Agent Plugin packaging: https://developers.openai.com/plugins/build/plugins
- Plugin archive validation: https://developers.openai.com/plugins/deploy/submission-errors
