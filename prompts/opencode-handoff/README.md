# Direct Chat → OpenCode handoff

## Use

Open [opencode-handoff-prompt.md](opencode-handoff-prompt.md), copy its single fenced text block, and paste it at the end of the **same Chat conversation** containing the work to transfer. The requested output is the actual downloadable OpenCode handoff, not a Work continuation prompt.

No skill invocation, installation, Work transition, build step, or access to this repository is required to interpret the pasted instructions. File creation still depends on the tools available in the Chat; the prompt requires an honest inline fallback when they are unavailable. It does not guarantee recovery of inaccessible conversation history or identical outputs across model runs.

## Source and deliberate differences

Prompt revision: **1.0.0**. Reviewed on **2026-09-20** against the current skill **v2.0.1** at repository commit `f2f289d0cce482ea56bdfea5a372d36a29e0bce5`:

- [SKILL.md](../../plugins/opencode-handoff/skills/opencode-handoff/SKILL.md): output contract, conversation reconciliation, technical precision, incremental scope, implementation plan, validation, and execution protocol.
- [handoff-template.md](../../plugins/opencode-handoff/skills/opencode-handoff/references/handoff-template.md): all fourteen handoff sections, in the same order.
- [agents/openai.yaml](../../plugins/opencode-handoff/skills/opencode-handoff/agents/openai.yaml): inspected for the current invocation configuration; not needed in a pasted prompt.

This is a **self-contained adaptation with documented corrections**, not a byte-for-byte export or a claim of identical behavior. It preserves the functional handoff contract and embeds its structure, while adding the safeguards described below. Skill discovery metadata, installation instructions, and the `status` response are deliberately not reproduced as execution behavior. The artifact identifies itself as generated through a standalone prompt; it does not claim that a skill was activated.

The skill source, template, invocation policy, and plugin version are **unchanged by this addition**. Installing or using the existing skill does not automatically gain these new controls. Future maintenance must reconcile substantive rule changes explicitly rather than assuming the prompt and skill are synchronized. No generator or synchronization framework was added for this single adaptation.

## Validation of the reported failure

### Evidence boundary

The review basis was the user-provided `analisis-incidente-handoff-configuracion.md` and the three source files above. The report is not copied into this public repository. Its sections 2, 9, 10, 12, and 13 distinguish the evidence available, the missing authoring control, proposed changes, and suggested behavioral checks.

The incident report describes specification inflation before implementation. It explicitly says it did not inspect the external ChatGPT handoff skill and did not reopen the original downloadable handoff. This review inspected the **current** external skill; it did not establish which skill revision, if any, ran during the earlier incident. The original handoff-generation trace and a controlled reproduction are not available here. The underlying implementation and its tests were not rerun as part of this prompt change.

### Activation and adequacy are separate questions

Whether the skill loaded during the incident remains **unknown**. A generated sentence such as `OpenCode Handoff v2.0.1 active.` or a version marker in a document is not independent runtime evidence: the same wording can be produced from conversation context. Current repository settings also do not establish historical installed settings or execution.

The current `agents/openai.yaml` contains `allow_implicit_invocation: true`. This states the source configuration, not proof that a particular Chat session received or used the skill. OpenAI documents skill metadata and the loading of instructions separately; see [Build skills](https://developers.openai.com/codex/skills). Documentation about the intended mechanism does not diagnose a particular invocation.

### What the existing skill already gets right

The v2.0.1 skill requires reconciliation of final decisions, prohibits fabricated repository details and promotion of brainstorming into requirements, preserves incremental scope, and tells OpenCode to reuse existing patterns. It does **not** instruct the author to build a universal configuration representation, enforce arbitrary-precision values, or implement deep immutability.

Consequently, the incident is not evidence that those mechanisms were directly prescribed by the skill. If an author promoted unapproved suggestions, it would already violate the existing instruction against doing that. Stronger controls can improve specificity but cannot prove or guarantee instruction adherence.

### Gaps in the authoring control

| Gap in the current skill/template | Correction in the standalone prompt |
| --- | --- |
| Final decisions are classified, but the origin of each material obligation need not be shown. | Section B requires a recognizable basis for obligations that affect scope, cost, guarantees, contracts, or acceptance. |
| A prior assistant summary can be mistaken for approval; "latest decision wins" does not explicitly distinguish speaker/authority. | Section B separates later explicit user decisions from later assistant statements, and rejects silence or repetition as specific approval. |
| Incremental scope is protected mainly against new features, not stronger interpretations of existing properties. | Section C checks guarantee strength and boundaries, including usage discipline versus technical enforcement. |
| Reuse guidance mainly addresses the executor. | Section C applies the direct-solution comparison during handoff authoring, with focused verification or an explicit unverified status. |
| The quality bar checks completeness but does not explicitly audit added obligations against the original need. | Sections C and F check both omissions and unjustified additions, including obligations consolidated through tests. |
| The template permits the "smallest safe adaptation" to a conflict without fully distinguishing routine choices from contract changes. | Sections B, C, and E require an owner decision for material amendments while leaving routine reversible choices unblocked. |
| The diagnostic/version text is described as verification of skill selection. | The prompt makes no activation claim; its marker identifies the generation method only. |

**Conclusion:** the available evidence cannot select an activation failure as the incident's cause. It does show concrete precision gaps in the current authoring instructions relative to the failure described. Bypassing skill discovery alone does not address those gaps, so simply concatenating the old files would be insufficient as a corrective measure.

## Coverage and checks

The adaptation retains the original self-contained downloadable-file requirement, filename pattern, exact technical identifiers, distinction between requirements and guidance, scope/non-goals, dependency ordering, documentation-first sequencing when requested, focused validation, acceptance criteria, and final OpenCode execution protocol. The fourteen section names and their order are preserved.

Additional controls concern source provenance, strength of guarantees, evidence status, proportionate use of dependencies, honest simplification trade-offs, amendment authority, historical SHA handling, and unavailable context. These controls apply during authoring and do not mandate another reviewer, a new scoring system, a universal traceability matrix, or extra implementation phases.

The following are regression scenarios adapted from the report, **not results of executed model evaluations**:

| Scenario | Expected behavior |
| --- | --- |
| Load a configuration file and let owners interpret their known sections. | Prefer the existing dependency and a small integration; do not invent a parser, dialect, generic document model, or query API without a real requirement. |
| The user explicitly requires that the API prevent consumers from mutating shared data. | Preserve technical enforcement; do not weaken it to a convention in the name of simplicity. |
| The accepted contract needs numeric exactness beyond ordinary types. | Retain that requirement and investigate appropriate support rather than dismissing it. |
| Build proposes format-specific syntax nodes, while runtime excludes that format. | Identify the unresolved representation boundary; do not call the two contracts equivalent. |
| A previous assistant summary introduced providers with no verifiable approval. | Keep them out of active acceptance; if already part of an approved task, request the appropriate amendment. |
| A refactor touches sensitive data with verified safeguards. | Retain necessary controls and errors; do not optimize for smallness at their expense. |
| An approved task requires disproportionate infrastructure for a bounded operation. | Explain the mismatch and smallest proposed contract change; do not silently edit acceptance or call the affected phase ready. |
| A small correction has no material contract conflict. | Produce a proportionate plan without inventing approval rounds, frameworks, or test catalogues. |

Static checks can confirm source-section coverage, well-formed copy/paste fencing, absence of external instruction dependencies, and the existence of the saved file. They cannot establish model behavior. A meaningful behavioral comparison would use the same synthetic conversations and model settings for the old contract and this prompt, preserving outputs and recording both omissions and unjustified additions. Include cases where complexity is explicitly justified to detect over-simplification as well as overengineering.

Do not treat these scenarios as a required test suite for every generated implementation handoff. They are maintenance checks for the authoring prompt itself.
