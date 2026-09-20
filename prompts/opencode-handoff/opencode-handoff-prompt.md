# OpenCode handoff — standalone Chat prompt

Prompt revision: 1.0.0  
Based on: OpenCode Handoff skill and handoff template v2.0.1  
Source snapshot: `angelcervera/chatgpt-config@f2f289d0cce482ea56bdfea5a372d36a29e0bce5`

Copy the entire block below into the **same Chat conversation** that contains the work to hand off. It requests the downloadable OpenCode handoff directly; it does not require a Skill, Work, or a second conversation. The maintenance README documents the additional scope-fidelity controls compared with the source skill. This prompt cannot recover conversation content that is no longer available to the model.

```text
Generate the final OpenCode implementation handoff for the work discussed in this conversation, now.

Execute these instructions directly in this Chat. Do not invoke, install, or depend on a Skill. Do not ask me to move to Work. Produce the handoff itself, not another prompt, a generic template, or a handoff about these instructions.

Use all relevant conversation context and source material actually available to you. The result must be a standalone, downloadable Markdown document from which a new OpenCode session can continue without access to this Chat.

Preserve the agreed outcomes with maximum useful implementation detail. Detail means completeness and precision about the accepted work, not additional scope, stronger guarantees, speculative infrastructure, or a transcript padded with repetition.

A. DELIVERABLE AND AUTHORITY

1. Create a real, non-empty UTF-8 Markdown file, using the file-creation tools available in this Chat:
   opencode-handoff-<short-kebab-case-topic>-YYYY-MM-DD.md
   Use the actual generation date. Confirm that the file exists and inspect its contents before linking it. Do not fabricate a sandbox path, download link, file, or successful validation.

2. Return a working download link, not just a Markdown code block presented as a file. If file creation is unavailable or fails, say so explicitly and provide the complete document in one fenced Markdown block as the fallback. Use an outer fence longer than any fence inside the document. Do not claim that fallback text is a downloadable artifact or automatically redirect me to another product.

3. This request authorizes preparing the handoff, not carrying out its implementation. Do not modify a target repository, create implementation tasks, change task status, install anything, commit, push, deploy, or merge as a side effect of writing it. Preserve any separately established implementation permissions and limits in the handoff; do not add new ones.

4. The handoff transfers the accepted task; it does not become evidence that every statement inside it was approved. Applicable repository instructions and accepted contracts must be respected. Where a newly requested change conflicts with them, describe the intended change and the amendment or decision required. Do not silently overrule either the user's intent or the existing contract.

5. Generate the document in the language explicitly requested for the handoff in this conversation; otherwise use English. Preserve exact technical identifiers in their original form.

B. RECONSTRUCT THE ACCEPTED TASK, NOT MERELY THE LATEST SUMMARY

1. Review the entire available conversation, including relevant attachments, corrections, examples, and actual tool results. Reconcile the final state rather than copying the last assistant recap. Use only accessible content: do not claim to have read missing messages, attachments, repository files, or hidden history.

2. Later explicit user decisions supersede earlier decisions about the same matter. Recency alone does not turn a later assistant proposal into an approved decision. A previous assistant summary, handoff, task draft, or statement that something was agreed is not independent evidence of the user's approval.

3. Preserve the distinction between:
   - explicit user decisions and proposals the user actually approved;
   - user-reported current facts;
   - verified repository constraints or behavior, with their evidence;
   - necessary derived requirements;
   - implementation guidance and routine choices left to OpenCode;
   - assistant proposals that remain unapproved;
   - rejected or superseded alternatives;
   - deferred work and non-goals;
   - genuinely unresolved questions.

4. For every material obligation that changes scope, cost, a public contract, a guarantee, or acceptance, state its basis briefly where the obligation appears. Use an inline label or short rationale, not a mandatory traceability matrix for every sentence. A source locator may be a known file/section, actual tool result, or identifiable user request; do not invent message IDs, quotations, citations, or approvals.

5. A necessary derived requirement must explain which accepted outcome or verified constraint makes it necessary and why a smaller alternative is insufficient. It must not hide a discretionary architectural choice. If the derivation introduces a material trade-off not yet decided, label it as a proposal or open decision rather than quietly adding it to MUST or acceptance.

6. Silence, repetition in generated documents, and a vague instruction to continue do not establish specific approval for guarantees the assistant added. Preserve genuine approval where it exists; do not erase an inconvenient approved requirement by relabeling it as a suggestion.

7. When an earlier assistant-added obligation has no traceable basis, exclude it from active acceptance and record it as unapproved when its history matters. If it has already become part of an approved task or contract, report the conflict and proposed amendment instead of deleting it unilaterally. An already-written implementation or test is not, by itself, proof that the obligation was needed.

8. If context is unavailable, disclose the limitation precisely. If a missing decision prevents a reliable plan, produce a clearly marked review-needed handoff and identify the question that blocks the affected work. Do not fill the gap from generic best practices or claim lossless reconstruction. Keep unaffected work usable when it can safely proceed.

C. SCOPE FIDELITY AND PROPORTIONALITY

Apply these controls to the handoff you are writing, not only as advice to the eventual implementer.

1. Start from the smallest direct solution that satisfies the accepted outcomes and verified constraints. Before prescribing custom infrastructure, inspect relevant existing code or the selected dependency's supported API when that evidence is available. Explain a material departure through a concrete required behavior the direct solution cannot meet.

   When the required evidence is inaccessible, mark the approach as unverified and give OpenCode a focused inspection step. Do not assert that a library lacks a feature you have not checked. Do not launch broad research, compare many libraries, or require prototypes merely to fill the handoff.

2. Do not turn a bounded operation into a generic framework merely for theoretical reuse or completeness. Generic document representations, query APIs, validators, registries, provider systems, custom parsers, and diagnostic frameworks need a concrete current requirement or established project convention. Necessary domain models, security boundaries, and legitimate architectural constraints remain valid; simplicity is not a reason to discard them.

3. State the exact strength and boundary of each guarantee. In particular, do not silently transform:
   - a contract that consumers do not modify data into technical enforcement of deep immutability;
   - an immutable release artifact into an immutable in-memory API;
   - domain-agnostic loading into independence from every data format;
   - a replaceable input source into a universal representation or provider architecture;
   - preserving the application's supported numeric values into arbitrary-precision numeric support;
   - useful errors into a general diagnostics framework;
   - not implementing a feature into rejecting every library syntax construct related to that feature.

   These are distinctions to check, not blanket prohibitions. If the stronger guarantee was explicitly required or is justified by verified behavior, retain it and explain the needed mechanism and cost. Do not silently weaken real safety, compatibility, precision, or isolation requirements.

4. Reuse supported dependency behavior rather than prescribing a stricter dialect, custom traversal, or replacement decoding layer without a concrete requirement. Distinguish responsibilities for reading/syntax, shared structure, owner-specific interpretation/validation, and artifact delivery where relevant. Do not move every validation into a loader; do not remove necessary read, decode, structural, or safety errors in the name of simplicity.

5. Keep the present increment, later integration, and explicit non-goals separate. Preserve an agreed future boundary without implementing hypothetical consumers. A small first delivery does not have to solve the whole subsystem. Conversely, do not hide a known incompatibility under "later": identify which downstream boundary or contract still needs resolution.

6. Describe simplifications honestly. A design that exposes a library's mutable syntax nodes cannot be called format-independent or deeply immutable merely because it is wrapped or renamed. More generally, state which guarantees a simplification preserves, relaxes, or leaves unresolved. Do not select a case-specific technology merely because this prompt uses it as an example.

7. Review both directions of fidelity before declaring the document ready:
   - Did any accepted behavior, constraint, correction, or necessary protection disappear?
   - Did any new or strengthened obligation enter without an identifiable basis?
   - Does a proposed component exist only to satisfy a guarantee introduced by the handoff itself?
   - Does each material test protect accepted behavior or a concrete integration risk, rather than cement an unnecessary abstraction?

8. If an approved requirement makes a simple operation materially disproportionate, retain its current status, describe the conflict, and propose the smallest contract or guarantee change. Use the project's existing amendment authority. Do not silently weaken acceptance or present the affected implementation as ready before the conflict is resolved. Ordinary reversible implementation choices within the accepted contract do not need another approval cycle.

9. Do not add compulsory reviewers, scoring systems, line-count limits, new committees, or extra workflow stages as a universal response to risk. Apply these checks during authoring and use the project's existing process. Keep detail proportional to the actual task without omitting necessary information.

D. TECHNICAL PRECISION AND EVIDENCE

1. Preserve established repository names, branches, task/issue/epic IDs, paths, versions, commands and flags, configuration keys, schemas, routes, interfaces, entity names, database objects, environment names, and relevant source URLs. Do not silently rename or normalize them. Do not copy credentials, tokens, or unrelated private information into a portable handoff; identify secure references instead.

2. Never invent repository facts, current implementation status, API behavior, validation results, file locations, or commands. Proposed new identifiers may appear only when explicitly approved, or clearly labeled as proposals rather than existing artifacts. Otherwise describe what OpenCode must locate in the actual repository.

3. Separate inspected evidence from reported state and unverified assumptions. A source file that reports passing tests is not a test execution performed in this Chat. Record known results with their actual scope; mark unrun checks as not run. Do not promote assistant assertions to verified facts.

4. Record inspected commits and branches as evidence snapshots unless the user explicitly fixed them as implementation bases. A historical SHA must not silently become an instruction to check out an obsolete revision. Tell OpenCode to verify the intended current branch, HEAD, and local changes before editing, without discarding the user's work.

5. Include the relevant content of decisions, contracts, examples, and source excerpts inside the handoff. Known paths and links provide traceability but must not substitute for essential context. Do not use "as discussed above", "see earlier messages", or "use the approach from the chat". Mark unavailable source material and access requirements rather than assuming OpenCode can open private chat attachments or sandbox links.

6. Where a command is established, preserve it and state its execution context when material: repository directory, host, VM/container, application, environment, and required privileges. When these are unknown, require discovery rather than guessing. Do not add scripts or automation merely to make an unspecified command appear executable.

E. DOCUMENT STRUCTURE

Use the following fourteen top-level sections, preserving their names and order. Fill them with the actual task, not template placeholders. Briefly mark irrelevant sections "Not applicable" and empty open questions "None". Do not invent work to fill a section; a small task can have short sections and a single implementation phase.

# OpenCode Handoff — <Task / Topic>

Include a short metadata block with:
- Generation date.
- Target: OpenCode.
- Generation method: standalone Chat prompt, revision 1.0.0.
- Readiness: Ready for the stated increment, or Needs a specified decision/verification before the affected phase.
- Material source/context limitations, if any.

This metadata identifies the document; it is not proof that a Skill ran or that its content was validated by another agent. Do not print "skill active" or pretend to have invoked OpenCode Handoff.

## 1. Objective

State the original problem and the concrete desired outcome in terms of the user's need. Distinguish that outcome from an optional implementation mechanism. An engineer without the original conversation must understand why this work exists.

## 2. Current Context

Describe the relevant current architecture, behavior, environment, and work already completed. Separate user-reported state, inspected facts, and assumptions. Include enough context to understand the next increment, not unrelated conversation history.

## 3. Final Decisions

List accepted decisions and useful rationale. For material decisions, identify their basis briefly. Preserve later explicit corrections and agreed ownership. Do not place unapproved assistant proposals in this section as though they were final.

## 4. Requirements and Invariants

Use MUST/MUST NOT for binding constraints, SHOULD/SHOULD NOT for strong guidance, and MAY for optional choices within the agreed contract. Make material derived requirements and their justification recognizable. State guarantees at their actual strength. Keep unapproved material proposals outside binding requirements and acceptance.

## 5. Scope

Separate Included from Explicitly Deferred / Non-goals. Distinguish current acceptance from context about later phases. Preserve any known downstream boundary affected by the current decision without implementing that later phase now.

## 6. Relevant Existing Artifacts

Identify known repositories, files, tasks, contracts, prior artifacts, and source references with their location, relevance, and evidence status. Use a small table only when helpful. Identify unknown locations for repository discovery. Historical references are evidence, not automatic checkout instructions.

## 7. Architecture / Design

Describe the agreed design at implementation level: applicable boundaries, ownership, data/control flow, contracts, lifecycle, configuration, error handling, and compatibility. Describe the smallest direct approach and explain any materially more complex requirement. Keep undecided mechanisms labeled as undecided. Include Mermaid text only where it materially clarifies a known design; do not manufacture a diagram for completeness.

## 8. Data / API / Configuration Changes

Preserve the exact agreed schemas, structures, routes, semantics, examples, and persistence changes where available. Distinguish existing interfaces from approved new ones and proposals. State who interprets and validates which data. Do not invent schemas, validation rules, numeric guarantees, migration behavior, or unsupported syntax restrictions.

## 9. Implementation Plan

Order phases by dependencies and preserve the user's explicit sequence and incremental boundaries.

Phase 0 is read-only repository reconnaissance: read applicable local instructions, inspect current implementation and task state, locate canonical commands, check relevant dependency APIs, and reconcile evidence with the intended branch/working tree. Reuse prior verified observations but do not assume the repository has remained unchanged.

If the user required documentation first, it is the first mutation step after reconnaissance, not an excuse to implement the whole design before loading or integration work.

For each meaningful implementation phase state its objective, actions or area to inspect/change, constraints, focused validation, and observable completion condition. Include only as many phases as the task needs. Mark any phase blocked by an unresolved scope or contract decision; do not silently choose that decision for OpenCode.

## 10. Testing and Validation

Specify the automated, static, build, behavioral, regression, and documentation checks relevant to accepted behavior. Discover unknown command names from the repository. Prefer focused integration tests for the wrapper and its actual consumers over reproducing a dependency's whole test catalogue. Add edge cases for explicit contracts or concrete risks, not speculative completeness. Preserve existing necessary protections.

Separate checks already executed, checks only reported by others, and checks still required. If requirements are legitimately amended, reconcile their tests rather than deleting tests just to make an incompatible simplification pass.

## 11. Acceptance Criteria

Use observable completion criteria for this increment, traceable to accepted outcomes and constraints. Do not use acceptance to introduce new infrastructure, stronger guarantees, future features, or an unapproved proposal. Identify unresolved conditions that prevent declaring the affected work ready or complete.

## 12. Rejected / Superseded Alternatives

Include only history useful to prevent rework or architectural regression. State each alternative's actual status and why it was rejected or superseded. An assistant proposal never approved is "unapproved", not a user decision later reversed. Historical requirements remain identifiable as history, not active obligations.

## 13. Open Questions

List only genuinely unresolved matters. Distinguish repository/environment discovery, routine choices within existing conventions, and material user decisions or contract amendments. Keep unapproved material proposals here with their trade-offs and affected phases. State the precise missing decision instead of fabricating a solution. If none remain, write "None".

## 14. OpenCode Execution Protocol

End the document with task-specific instructions that require OpenCode to:

1. Read the whole handoff and applicable repository-local instructions before changing files.
2. Verify the intended branch, current HEAD, local changes, task state, and relevant implementation. Do not treat an inspected historical SHA as the starting point unless explicitly required.
3. Respect accepted requirements and existing project contracts. Trace a material obligation back to its basis rather than treating this generated document as independent proof of approval.
4. Inspect existing project code and dependency APIs before creating parallel mechanisms. Prefer the smallest direct implementation that satisfies the actual contract.
5. Follow the documented dependency order, scope, ownership, and first mutation step. Keep future work deferred while preserving agreed boundaries.
6. Stop before an affected change when a material guarantee, scope, or architectural conflict needs an owner decision. Explain the conflict and smallest proposed amendment; do not silently weaken acceptance. Continue routine reversible choices within the approved contract without unnecessary approval loops.
7. Run canonical validation after meaningful stages and report failures honestly. Do not claim unexecuted checks passed or remove protections to make tests green.
8. Update documentation, task records, contracts, and generated artifacts only as the change and repository conventions require. Keep general rules in their canonical owner and execution history in task records. Do not rewrite historical evidence to make old requirements disappear.
9. Preserve the user's explicit authorization limits for commits, pushes, deployments, task-state changes, and merges. The handoff itself does not grant additional permissions.
10. Finish with a concise report of changed files/components, implementation decisions, actual validation results, approved deviations and reasons, and remaining issues.

F. FINAL AUTHORING CHECK AND RESPONSE

Before saving the file, check that a new OpenCode session can determine the objective, accepted decisions and their basis, current state, exact important identifiers, non-goals, next action, dependencies, validation, completion criteria, and unresolved issues without this Chat.

Then check what should NOT be in the document: obligations derived only from an assistant's previous wording, silently strengthened guarantees, speculative abstractions, premature future work, invented evidence, and tests that exist only to defend those additions. Remove unsupported additions from the proposed scope without silently changing an already-approved contract; flag the latter for amendment.

Resolve inconsistencies between requirements, architecture, plan, tests, acceptance, and the execution protocol. Do not mark the handoff ready just because these sections agree with each other; also check them against the original accepted need.

Keep all useful detail. Do not expose private chain-of-thought, impose an arbitrary length target, or claim that a detailed prompt guarantees flawless execution or complete recovery of inaccessible context.

Create and inspect the Markdown file now. Reply with its download link and, only when material, a brief note about missing context, blocked decisions, or file-creation limitations. Do not repeat the complete handoff in Chat unless file creation failed or I explicitly asked for inline output.
```
