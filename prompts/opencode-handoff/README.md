# Direct Chat → OpenCode handoff

## Use

Open [opencode-handoff-prompt.md](opencode-handoff-prompt.md), copy its single fenced text block, and paste it at the end of the **same Chat conversation** containing the work to transfer. The requested output is the actual downloadable OpenCode handoff, not a Work continuation prompt.

The immediate consumer is now **`/increment-analyze`**. The generated file is an input brief for analysis and task decomposition, not a prepared per-task implementation plan. Save the downloaded handoff inside the target repository, for example as `tmp/opencode-handoff.md` (a suggested placement, not an existing file), then invoke this from OpenCode in that repository:

```text
/increment-analyze tmp/opencode-handoff.md
```

Supply refinement or review-only instructions when that is the intended operation. The invocation controls authority; analysis does not start implementation. Backlog records must retain all necessary requirements so they do not depend on this temporary input later.

No skill invocation, installation, Work transition, build step, or access to this repository is required to interpret the pasted instructions. Read access to the workflow repository lets the author verify the current consumer contract; without it, the prompt uses its embedded reviewed baseline and must disclose that live compatibility is unverified. File creation still depends on the tools available in the Chat; the prompt requires an honest inline fallback when they are unavailable. It does not guarantee recovery of inaccessible conversation history or identical outputs across model runs.

## Source and deliberate differences

Prompt revision: **1.1.0**. The original adaptation was reviewed on **2026-09-20** against skill **v2.0.1** at repository commit `f2f289d0cce482ea56bdfea5a372d36a29e0bce5`:

- [SKILL.md](../../plugins/opencode-handoff/skills/opencode-handoff/SKILL.md): output contract, conversation reconciliation, technical precision, incremental scope, implementation plan, validation, and execution protocol.
- [handoff-template.md](../../plugins/opencode-handoff/skills/opencode-handoff/references/handoff-template.md): all fourteen handoff sections, in the same order.
- [agents/openai.yaml](../../plugins/opencode-handoff/skills/opencode-handoff/agents/openai.yaml): inspected for the current invocation configuration; not needed in a pasted prompt.

This is a **self-contained adaptation with documented corrections**, not a byte-for-byte export or a claim of identical behavior. It preserves the functional handoff contract and embeds its structure, while adding the safeguards described below. Skill discovery metadata, installation instructions, and the `status` response are deliberately not reproduced as execution behavior. The artifact identifies itself as generated through a standalone prompt; it does not claim that a skill was activated.

The skill source, template, invocation policy, and plugin version are **unchanged by these prompt revisions**. Installing or using the existing skill does not automatically gain these new controls. Future maintenance must reconcile substantive rule changes explicitly rather than assuming the prompt and skill are synchronized. No generator or synchronization framework was added for this adaptation.

## Consumer contract: increment-analyze

Revision 1.1.0 was checked against `simplexportal/saastemplate` on **2026-09-20**, at the observed `main` commit `5aa448c097c28faa4d4348aaf4727bd3e76e88f6`. This identifies the review evidence, not a required checkout or a claim about the user's installed workspace. SaaSTemplate currently hosts the workflow; a handoff must still identify its actual product repository from the conversation.

### Sources inspected

All links below fix the reviewed snapshot. Operational use must read the current applicable instructions rather than pinning execution to this snapshot.

- [Command](https://github.com/simplexportal/saastemplate/blob/5aa448c097c28faa4d4348aaf4727bd3e76e88f6/.opencode/commands/increment-analyze.md) and [functional analyst](https://github.com/simplexportal/saastemplate/blob/5aa448c097c28faa4d4348aaf4727bd3e76e88f6/.opencode/agents/functional-analyst.md): entry point, scope and delegation.
- [Functional increment analysis](https://github.com/simplexportal/saastemplate/blob/5aa448c097c28faa4d4348aaf4727bd3e76e88f6/.agents/skills/functional-increment-analysis/SKILL.md) and [Backlog task structure](https://github.com/simplexportal/saastemplate/blob/5aa448c097c28faa4d4348aaf4727bd3e76e88f6/docs/development/backlog-task-structure.md): extraction, task content, boundaries, prerequisites and both fidelity checks.
- [Backlog agent](https://github.com/simplexportal/saastemplate/blob/5aa448c097c28faa4d4348aaf4727bd3e76e88f6/.opencode/agents/backlog-management.md) and [Backlog skill](https://github.com/simplexportal/saastemplate/blob/5aa448c097c28faa4d4348aaf4727bd3e76e88f6/.agents/skills/backlog-management/SKILL.md): complete payloads, CLI authority, write verification and actual record readback.
- [AGENTS.md](https://github.com/simplexportal/saastemplate/blob/5aa448c097c28faa4d4348aaf4727bd3e76e88f6/AGENTS.md) and [invariants](https://github.com/simplexportal/saastemplate/blob/5aa448c097c28faa4d4348aaf4727bd3e76e88f6/docs/architecture/invariants.md): mandatory rules, English documentation, project-local `tmp/`, and analysis/environment boundaries.
- [Documentation skill](https://github.com/simplexportal/saastemplate/blob/5aa448c097c28faa4d4348aaf4727bd3e76e88f6/.agents/skills/documentation-quality/SKILL.md), [documentation policy](https://github.com/simplexportal/saastemplate/blob/5aa448c097c28faa4d4348aaf4727bd3e76e88f6/docs/development/documentation.md) and [testing policy](https://github.com/simplexportal/saastemplate/blob/5aa448c097c28faa4d4348aaf4727bd3e76e88f6/docs/development/testing.md): precise models, readable local criteria, proportionate validation and truthful evidence.
- [Implementation planning](https://github.com/simplexportal/saastemplate/blob/5aa448c097c28faa4d4348aaf4727bd3e76e88f6/.agents/skills/implementation-planning/SKILL.md): later preparation of one existing executable task, not analysis-time planning of the entire increment.
- [Human workflow guide, opening/public-workflow sections](https://github.com/simplexportal/saastemplate/blob/5aa448c097c28faa4d4348aaf4727bd3e76e88f6/docs/development/functional-increment-workflow.md): inspected for the documented invocation syntax, not treated as a second routine agent procedure.

### Findings and adaptation

The existing workflow already requires both an extraction check before decomposition and a second comparison after reading the saved records. It also requires an independent read-only audit for substantial inputs when a permitted reviewer is available, and disclosure when that audit cannot run. These are not new workflow stages introduced by this prompt.

The gap in prompt 1.0.0 was its assumed immediate implementation consumer: its final protocol told OpenCode to execute changes, whereas `increment-analyze` explicitly does not implement, create branches, start application infrastructure, or write `backlog/plans/`. Revision 1.1.0 makes the phase boundary explicit without discarding any implementation details already decided by the user.

Section **E** adds a consumer-contract and input-readiness check. It checks actual observable rules, shared decisions and ownership, conditions/bounds/exceptions, requirement-bearing models, future versus immediate scope, expected prerequisite outputs, and acceptance. Material missing product decisions are distinguished from facts to discover in the repository and legitimate deferred local design.

The brief now preserves relevant original source excerpts separately from its reconciled requirement inventory. This lets the analyst and an independent reviewer compare against more than another assistant summary. If original material is unavailable, the prompt must state the limit rather than invent quotes or claim complete source verification.

**Ready for increment analysis**, **live consumer contract verified**, and **task Ready for implementation** are deliberately different claims. The Chat author can check the first two with the evidence available; it cannot certify future extraction, registration, local tool availability, or agent execution. Required downstream checks remain with their existing owners.

Sections **9** and **14** preserve the agreed delivery sequence but route the next operation through analysis, registration when authorized, readback and fidelity review. Detailed task preparation happens later. A small task remains small by bounded outcome and relevant context, not by deleting requirements, splitting every technical edit, or imposing an Epic.

### Additional regression scenarios

These are review/evaluation cases for this prompt, not executed OpenCode runs or mandatory extra tests for every handoff:

- **Detailed ERD plus an early exception:** preserve exact bounds, nullability and the original correction; a documentation task receives the model itself, and relevant executable tasks receive their applicable rules locally.
- **Incomplete business rule:** report the focused decision and affected scope instead of marking the brief ready or inventing an answer. Missing discoverable file paths remain inspection work, not arbitrary user-question blockers.
- **Small correction:** permit a standalone task or reuse of existing work, with no forced Epic, per-layer task list or extra reviewer.
- **Unimplemented prerequisite:** describe its exact expected output and a real dependency; allow analysis while deferring dependent technical preparation and Ready status.
- **Review-only invocation:** no Backlog mutation or product changes. An analysis-only restriction must not become a durable ban on future implementation.
- **Truncated registration output:** require bounded readback and comparison to original sources, not a claim that successful registration proves full coverage.
- **Unavailable source/runtime:** distinguish embedded baseline, live repository inspection and actual agent execution. Do not infer an installed skill or available tool from source files alone.
- **Substantial multi-group input:** preserve the workflow's conditional independent source-to-record audit, while disclosing an unavailable reviewer instead of asserting that it ran.

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
| The quality bar checks completeness but does not explicitly audit added obligations against the original need. | Sections C and G check both omissions and unjustified additions, including obligations consolidated through tests. |
| The template permits the "smallest safe adaptation" to a conflict without fully distinguishing routine choices from contract changes. | Sections B, C, and F require an owner decision for material amendments while leaving routine reversible choices unblocked. |
| The diagnostic/version text is described as verification of skill selection. | The prompt makes no activation claim; its marker identifies the generation method only. |

**Conclusion:** the available evidence cannot select an activation failure as the incident's cause. It does show concrete precision gaps in the current authoring instructions relative to the failure described. Bypassing skill discovery alone does not address those gaps, so simply concatenating the old files would be insufficient as a corrective measure.

## Coverage and checks

The adaptation retains the original self-contained downloadable-file requirement, filename pattern, exact technical identifiers, distinction between requirements and guidance, scope/non-goals, dependency ordering, documentation-first sequencing when requested, focused validation, acceptance criteria, and final OpenCode execution protocol. The fourteen section names and their order are preserved. Revision 1.1.0 explicitly distinguishes analysis input from later per-task technical plans in sections 9 and 14.

Additional controls concern source provenance, strength of guarantees, evidence status, proportionate use of dependencies, honest simplification trade-offs, amendment authority, historical SHA handling, and unavailable context. These controls apply during authoring and do not introduce a universal reviewer, new scoring system, traceability matrix, or extra implementation phase. The consumer's existing conditional independent audit remains applicable.

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

For revision 1.1.0, validation is source-based compatibility review and local structural checks, not an end-to-end `/increment-analyze` run. No SaaSTemplate tasks, skills, agents, commands, plans or implementation files were modified, and no downstream application validation or independent agent audit was executed for this change.

Do not treat these scenarios as a required test suite for every generated implementation handoff. They are maintenance checks for the authoring prompt itself.
