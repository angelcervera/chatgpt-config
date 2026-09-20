---
name: opencode-handoff
description: Generate a self-contained, implementation-ready, downloadable Markdown handoff from the current ChatGPT conversation for execution in OpenCode. Use when the user asks for a handoff, OpenCode handoff, implementation handoff, final implementation document, executable implementation plan, or asks to transfer the decisions from the conversation into OpenCode. Also use when explicitly invoked through the OpenCode Handoff plugin.
---

# OpenCode Handoff

Version: 2.0.0

## Purpose

Convert the useful state of the current conversation into a durable implementation artifact that OpenCode can execute without needing access to the original ChatGPT conversation.

The handoff is not a summary. It is the authoritative implementation transfer document for the work discussed in the conversation.

## Invocation behavior

### Normal handoff request

When the user asks for a handoff, an OpenCode handoff, an implementation document, or equivalent:

1. Review the full available conversation context.
2. Resolve the latest state of every decision. Later explicit decisions override earlier proposals.
3. Generate the handoff using `references/handoff-template.md` as the structural contract.
4. Create a standalone Markdown file that the user can download.
5. Return a short message containing the download link and no duplicate full handoff in chat unless the user explicitly asks to see it inline.

### Diagnostic request

If the user invokes this plugin/skill and asks for `status`, `diagnostic`, `is this active?`, or equivalent, do not generate a handoff. Reply exactly with:

`OpenCode Handoff v2.0.0 active.`

This diagnostic exists so the user can verify that the installed skill was actually selected.

## Mandatory output contract

The generated handoff MUST satisfy all of the following.

### 1. Real file, not chat-only output

Create an actual `.md` artifact using the file/artifact creation capability available in the current ChatGPT surface.

Do not merely render the Markdown inside the conversation and call it a file.

Preferred filename:

`opencode-handoff-<topic>-YYYY-MM-DD.md`

Use a short, stable, kebab-case topic derived from the task.

If the surface cannot create a downloadable file, state that limitation explicitly and provide the complete Markdown as a fallback. Never claim a file exists when one was not actually created.

### 2. Self-contained

OpenCode must be able to execute the handoff without reading the ChatGPT conversation.

Include all context required to understand:

- what problem is being solved;
- the desired end state;
- decisions already made;
- architecture and design constraints;
- important facts discovered during analysis;
- exact names, paths, interfaces, schemas, commands, versions, identifiers, and conventions when known;
- implementation ordering;
- validation expectations;
- unresolved questions that truly remain unresolved.

Do not write references such as:

- "as discussed above";
- "as we said earlier";
- "use the approach from the conversation";
- "see previous messages".

### 3. Latest decision wins

Conversations often contain exploration followed by corrections.

Before writing the handoff, reconcile contradictions and identify the final state.

Classify information internally as:

- final decision;
- current fact;
- implementation guidance;
- rejected alternative;
- superseded decision;
- unresolved question.

Only the final current state should drive the implementation plan.

Rejected or superseded alternatives may be included when they explain an important architectural constraint or prevent OpenCode from repeating already-rejected work.

### 4. No invented repository facts

Never fabricate:

- file paths;
- package names;
- commands;
- APIs;
- database objects;
- branch names;
- tickets;
- implementation status;
- test commands;
- configuration keys.

If a repository-specific detail was not established in the conversation, instruct OpenCode to inspect the repository and identify the correct location before modifying it.

Use wording such as:

"Locate the existing implementation responsible for X and modify it in place; do not introduce a parallel abstraction unless the current architecture requires one."

### 5. Preserve exact technical details

When the conversation establishes exact details, preserve them verbatim where precision matters, including:

- repository names;
- task/issue/epic IDs;
- branches;
- file paths;
- configuration keys;
- command names;
- CLI flags;
- API routes;
- type/interface/entity names;
- database table names;
- version numbers;
- protocol names;
- URLs when they are part of the implementation context.

Do not normalize or "improve" identifiers silently.

### 6. Distinguish requirements from suggestions

OpenCode must be able to tell which statements are binding.

Use explicit language:

- **MUST / MUST NOT** for fixed constraints;
- **SHOULD / SHOULD NOT** for strong implementation guidance;
- **MAY** for optional choices.

Do not turn brainstorming suggestions into requirements.

### 7. Scope and non-goals

State both:

- what this implementation includes;
- what it intentionally does not include yet.

This is particularly important when the conversation deliberately narrowed a larger design into an incremental first iteration.

### 8. Implementation plan must be executable

The plan must be ordered according to dependencies, not merely grouped by topic.

For every significant step, include as applicable:

- objective;
- repository area to inspect or modify;
- expected design change;
- invariants to preserve;
- tests or checks to add/update;
- completion condition.

If the conversation explicitly defined the first implementation step, preserve that ordering.

### 9. Repository inspection before mutation

Unless the conversation already provides sufficient repository state, the first engineering phase SHOULD require OpenCode to inspect the existing codebase before editing.

OpenCode should reuse established architecture, naming, patterns, utilities, and tests rather than creating parallel mechanisms.

If the user explicitly said documentation must be updated first, make documentation the first mutation step after repository inspection.

### 10. Validation and acceptance criteria

The handoff must define how OpenCode knows the task is complete.

Include:

- automated tests expected;
- static checks/lint/type checks if relevant;
- build validation if relevant;
- behavioral checks;
- backward-compatibility checks where relevant;
- documentation consistency checks;
- explicit acceptance criteria.

Do not invent command names. If exact commands are unknown, tell OpenCode to discover and use the repository's canonical commands.

### 11. Preserve incremental design

If the conversation intentionally postpones complexity, keep it postponed.

Do not expand the scope because a more general architecture is theoretically possible.

Examples of things that may need to remain explicitly deferred:

- authorization;
- invitations;
- extra provider integrations;
- generalized abstractions;
- migrations not required for the first iteration;
- speculative future features.

### 12. OpenCode execution protocol

The handoff must end with an execution protocol instructing OpenCode to:

1. Read the complete handoff before changing files.
2. Inspect repository state and relevant local instructions (`AGENTS.md`, contribution docs, ADR conventions, task files, etc.).
3. Compare repository reality with assumptions in the handoff.
4. Prefer existing project patterns over introducing parallel abstractions.
5. Implement in the documented dependency order.
6. Run the repository's canonical validation after meaningful stages.
7. Update relevant documentation and task status when required.
8. Report deviations if repository reality makes a handoff instruction invalid.
9. Finish with a concise implementation report listing changes, validations run, and any remaining issues.

## Conversation analysis procedure

Before generating the file, perform this reconciliation process silently:

1. Identify the core implementation objective.
2. Extract explicit user decisions.
3. Extract constraints and invariants.
4. Detect decisions that were later changed.
5. Remove superseded requirements from the active plan.
6. Identify intentionally deferred scope.
7. Extract repository-specific facts.
8. Separate known facts from assumptions.
9. Build a dependency-ordered implementation sequence.
10. Define completion and validation criteria.

Do not expose private reasoning or chain-of-thought. The handoff should contain only the resulting decisions, rationale needed for implementation, and actionable plan.

## Handoff quality bar

A good handoff should allow an OpenCode session starting with no conversation history to answer all of these questions from the file alone:

- What are we building or changing?
- Why are we doing it?
- What decisions are already final?
- What must not change?
- What has explicitly been deferred?
- What existing code/configuration should I inspect first?
- In what order should I make changes?
- How should each phase be validated?
- What does done mean?
- Which uncertainties should I resolve from the repository rather than guessing?

If any answer is missing, improve the handoff before delivering it.

## Response after file creation

Keep the ChatGPT response concise.

Preferred form:

`OpenCode handoff generated: [Download the handoff](...)`

Optionally add one short note only when there is a material unresolved issue or a limitation in file generation.
