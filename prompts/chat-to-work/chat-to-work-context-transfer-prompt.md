# Chat → Work Context Transfer Prompt

Use this prompt immediately after choosing **Continue in Work** from an existing Chat conversation.

```text
This Work thread was created from an existing Chat conversation using “Continue in Work”. Treat the complete inherited Chat conversation as authoritative context for this Work thread.

Before doing any work, silently reconstruct the current state of the conversation from the full inherited context.

Requirements:

- Read and use the entire inherited conversation, not only the most recent messages.
- Do not ask me to repeat information that already exists in the inherited Chat context.
- Preserve all final decisions, constraints, corrections, rejected alternatives, deferred scope, and implementation details already established.
- When the conversation contains conflicting statements, later explicit decisions override earlier proposals or assumptions.
- Preserve exact technical details when known: repository names, branches, task/issue IDs, file paths, commands, configuration keys, API names, versions, URLs, schemas, and identifiers.
- Distinguish internally between final decisions, current facts, implementation guidance, rejected/superseded alternatives, and genuinely unresolved questions.
- Do not reopen settled decisions unless the inherited conversation contains a real contradiction that prevents continuing safely.
- Do not invent missing context. If part of the inherited conversation appears unavailable, truncated, or ambiguous in a way that materially affects the task, tell me exactly what is missing before proceeding.
- Do not generate a recap unless I explicitly ask for one. Use the inherited conversation directly as working context.
- Continue from the exact point where the Chat conversation stopped.
- Treat this Work thread as a continuation of the original Chat, not as a new independent task.

After applying these rules, wait for my next instruction. If no clarification is required, reply only:

Context loaded. Ready.
```
