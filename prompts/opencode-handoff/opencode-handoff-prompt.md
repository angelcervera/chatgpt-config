# OpenCode handoff — standalone Chat prompt

Prompt revision: 1.1.0  
Based on: OpenCode Handoff skill and handoff template v2.0.1  
Source snapshot: `angelcervera/chatgpt-config@f2f289d0cce482ea56bdfea5a372d36a29e0bce5`  
Consumer reviewed: `simplexportal/saastemplate@5aa448c097c28faa4d4348aaf4727bd3e76e88f6`, `/increment-analyze`

Copy the entire block below into the **same Chat conversation** that contains the work to hand off. It requests the downloadable OpenCode handoff directly; it does not require a Skill, Work, or a second conversation. The maintenance README documents the additional scope-fidelity controls compared with the source skill. This prompt cannot recover conversation content that is no longer available to the model.

```text
Generate the OpenCode handoff for the work discussed in this conversation, now. Its immediate consumer is `/increment-analyze`, defined in `.opencode/commands/increment-analyze.md`, not an implementation agent. Produce an analysis-ready input brief that preserves the information needed to create or refine small, self-contained tasks and useful optional Epics.

Execute these instructions directly in this Chat. Do not invoke, install, or depend on a Skill in this Chat. Reading repository skill files as evidence is allowed and is not invoking them. Do not ask me to move to Work. Produce the handoff itself, not another prompt, a generic template, or a handoff about these instructions.

Use all relevant conversation context and source material actually available to you. The result must be a standalone, downloadable Markdown document from which a new OpenCode session can continue without access to this Chat.

Preserve the agreed outcomes with maximum useful implementation detail. Detail means completeness and precision about the accepted work, not additional scope, stronger guarantees, speculative infrastructure, or a transcript padded with repetition.

A. DELIVERABLE AND AUTHORITY

1. Create a real, non-empty UTF-8 Markdown file, using the file-creation tools available in this Chat:
   opencode-handoff-<short-kebab-case-topic>-YYYY-MM-DD.md
   Use the actual generation date. Confirm that the file exists and inspect its contents before linking it. Do not fabricate a sandbox path, download link, file, or successful validation.

2. Return a working download link, not just a Markdown code block presented as a file. If file creation is unavailable or fails, say so explicitly and provide the complete document in one fenced Markdown block as the fallback. Use an outer fence longer than any fence inside the document. Do not claim that fallback text is a downloadable artifact or automatically redirect me to another product.

3. This request authorizes preparing and checking the input handoff, not running `/increment-analyze`, registering backlog work, or carrying out implementation. Do not modify a target repository, create implementation tasks, change task status, install anything, commit, push, deploy, or merge as a side effect of writing it. Preserve any separately established implementation permissions and limits in the handoff; do not add new ones.

4. The handoff transfers the accepted task; it does not become evidence that every statement inside it was approved. Applicable repository instructions and accepted contracts must be respected. Where a newly requested change conflicts with them, describe the intended change and the amendment or decision required. Do not silently overrule either the user's intent or the existing contract.

5. For the inspected SaaSTemplate workflow, write the handoff and proposed repository content in English, as its invariants require, regardless of conversation language. In a different target, follow its applicable language policy and the explicit request; otherwise use English. Preserve exact identifiers and clearly labeled original-language source excerpts.

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

9. Do not add compulsory reviewers, scoring systems, line-count limits, new committees, or extra workflow stages as a universal response to risk. Apply these checks during authoring and use the project's existing process. Keep detail proportional to the actual task without omitting necessary information. This does not remove the consumer workflow's existing conditional independent audit for substantial inputs; do not turn it into a universal extra reviewer.

D. TECHNICAL PRECISION AND EVIDENCE

1. Preserve established repository names, branches, task/issue/epic IDs, paths, versions, commands and flags, configuration keys, schemas, routes, interfaces, entity names, database objects, environment names, and relevant source URLs. Do not silently rename or normalize them. Do not copy credentials, tokens, or unrelated private information into a portable handoff; identify secure references instead.

2. Never invent repository facts, current implementation status, API behavior, validation results, file locations, or commands. Proposed new identifiers may appear only when explicitly approved, or clearly labeled as proposals rather than existing artifacts. Otherwise describe what OpenCode must locate in the actual repository.

3. Separate inspected evidence from reported state and unverified assumptions. A source file that reports passing tests is not a test execution performed in this Chat. Record known results with their actual scope; mark unrun checks as not run. Do not promote assistant assertions to verified facts.

4. Keep inspected commit hashes in the verification record as historical evidence only, never as durable task-plan references or default implementation bases. Preserve an explicitly user-required pin as a decision and flag any conflict with the target policy. A historical SHA must not silently become an instruction to check out an obsolete revision. Tell OpenCode to verify the intended current branch, HEAD, and local changes before editing, without discarding the user's work.

5. Include the relevant content of decisions, contracts, examples, and source excerpts inside the handoff. Known paths and links provide traceability but must not substitute for essential context. Do not use "as discussed above", "see earlier messages", or "use the approach from the chat". Mark unavailable source material and access requirements rather than assuming OpenCode can open private chat attachments or sandbox links.

6. Where a command is established, preserve it and state its execution context when material: repository directory, host, VM/container, application, environment, and required privileges. When these are unknown, require discovery rather than guessing. Do not add scripts or automation merely to make an unspecified command appear executable.

E. CONSUMER CONTRACT AND INPUT-READINESS CHECK

Perform this check while writing the brief. A polished handoff is not enough: the receiving analyst must be able to extract and distribute its actual requirements without inventing product decisions or returning to this Chat.

1. Identify the receiver and inspect its contract.
   - The workflow source is currently `simplexportal/saastemplate`. The implementation target is the repository established in the conversation; do not assume the workflow host is always the product repository.
   - When repository reads are available, inspect the current `.opencode/commands/increment-analyze.md`, its selected agent and skill, `AGENTS.md`, required invariants, and directly relevant task contracts. Follow their actual references, not a guessed agent graph or every file in the repository. Inspect documentation/testing policies when needed for requirements representation or validation prescriptions. Do not change those files.
   - Reviewed baseline: on 2026-09-20, the command selected `functional-analyst` and loaded `functional-increment-analysis`. The analyst delegated registration to `backlog-management`, used `documentation-quality`, and followed `docs/development/backlog-task-structure.md`. Technical planning belongs later to `implementation-planning`, one executable task at a time. Verify current instructions when accessible; this baseline is not proof of the installed/local version.
   - In the output, record the files actually inspected, the inspection date, material differences from this baseline, and access limits. If repository access is unavailable, apply the embedded baseline below but label live workflow compatibility unverified. Do not claim that an agent was run, that a source file was read, or that source configuration proves local tool availability.

2. Preserve the correct phase and authority.
   - Distinguish new-work analysis, refinement of known work, and assessment/review-only. Carry any supplied IDs and revision context exactly; otherwise let Backlog resolve them. State the intended operation and its actual authorization; do not invent write or closure permission.
   - This file is an input brief, not a prepared `backlog/plans/<TASK-ID>.md`, a final task catalogue, or an instruction to start Build. The downstream invocation controls allowed mutations. Analysis can register/refine records when authorized; review-only changes no records. Analysis must not implement, generate application code, start application infrastructure, create branches, or write task plans.
   - Keep invocation-only limits such as "do not implement during analysis" separate from durable product requirements. They must not become a prohibition on later authorized implementation.

3. Check semantic completeness against the original available sources.
   For each material requirement group, retain only applicable, source-defined information:
   - observable objective, actors/consumers and operation;
   - inputs, conditions, validation, exact values/bounds and exceptions;
   - success result, confirmation conditions, errors and relevant side effects/consistency;
   - domain/business-rule ownership, orchestration, frontend composition and application wiring where relevant;
   - entities, fields, keys, nullability, minimum/maximum cardinalities, lifecycle/transition rules, uniqueness and other complementary constraints;
   - approved decisions, inherited behavior to preserve, their basis, and resolved source conflicts;
   - current delivery, agreed future target, authorized exclusions and open decisions;
   - expected prerequisite outputs, constraints on those outputs, and known delivery ordering;
   - observable acceptance, known validation evidence and actual documentation deliverables.
   Do not replace a defined value with "expected", an exact relationship with "many", or a detailed behavior with a topic label. Do not invent absent values or require every field above for every task. Investigate repository-discoverable facts when practical; unknown implementation-local choices are not automatically missing product requirements.

4. Preserve both the reconciled requirements and their original evidence.
   - Retain supplied requirement-bearing Mermaid/schema/code/example blocks at their useful fidelity, with any explicitly approved changes applied consistently. Do not silently replace them with lossy prose. Explain complementary rules a diagram cannot encode. Do not invent a model or a renderer just to satisfy this checklist.
   - In the same file, include the relevant original request and substantive conversation excerpts needed to verify the requirements independently of your inventory, especially earlier constraints, corrections, exceptions and approvals. Use clearly labeled source excerpts and existing locators, not fabricated quotations or message IDs. A paraphrase is a paraphrase, not an original quote. Do not paste unrelated history or secrets.
   - Provide preserved source material separately from the reconciled requirements so OpenCode can check both. When only a summary survives, disclose that original-source comparison is limited. Source links alone cannot recover private chat context; include essential attachment content when permitted, or identify precisely which file/section must be supplied.
   - Resolve conflicting sources into an explicit rule with its authority/basis, while retaining the material conflict for audit. "Use the proposal and follow repository conventions" is not a resolution.

5. Test whether the brief can support bounded, self-contained decomposition.
   - An Epic is optional. One request may need no new work, standalone tasks, tasks in existing Epics, or one/several new Epics. Do not mandate an Epic for each prompt, domain, layer, or a large document. Preserve a genuinely approved delivery grouping, but flag conflicts instead of guessing IDs or enforcing an unsuitable structure.
   - Small means a coherent outcome with bounded relevant working context and independently checkable acceptance, not fewer requirements or an arbitrary task/line/token count. Split independent useful outcomes; do not make one task per field, requirement, file, schema edit, handler, or test. Keep indivisible complexity visible instead of generating artificial slices.
   - For each known delivery boundary, check that the source supplies the outcome, applicable local/shared rules, exclusions, exact prerequisite output and completion conditions. Record useful candidate boundaries only when supported, clearly provisional until the analyst inspects current work. Do not pre-create a complete Epic/Story hierarchy or technical plans merely to demonstrate readiness.
   - An Epic must retain the complete increment and the distinction between immediate acceptance and a detailed deferred target. A documentation task must receive the actual model and decisions to document, not a topic list. Every executable task must contain its applicable shared rules, examples and conditions locally; a parent/sibling/temporary-brief link is not a substitute.
   - Parentage is grouping, not execution order. Record a dependency only for an actual prerequisite and name its expected output. Avoid cycles, including existing cross-Epic edges, while leaving independent outcomes parallel. An unimplemented prerequisite can be explicit without blocking analysis; it can block that task's later preparation or Ready status.

6. Classify gaps without replacing analysis with speculative implementation design.
   - Needs user decision: a material missing/conflicting scope, behavior, owner or acceptance rule that available evidence cannot resolve. Ask the focused question before presenting affected requirements as settled. A useful draft may still be delivered, clearly marked with the affected work that must not be registered as final or prepared yet.
   - Repository verification pending: a discoverable API, existing task, file, current behavior, tool or dependency output. State what evidence the analyst should inspect. Do not ask the user to repeat discoverable facts or falsely call compatibility verified.
   - Deferred implementation detail: a legitimate local choice or dependency-dependent design. Keep it explicitly deferred; do not block analysis or invent the answer.
   Missing original source or live repository access limits verification claims; it is not by itself proof that otherwise complete requirements are defective. Do not guarantee frictionless execution or no information loss.

7. Record a concrete, proportionate readiness result.
   Include in the handoff's metadata and relevant sections:
   - intended downstream operation and authority;
   - input readiness: Ready for increment analysis, or Needs specified input/decision for the affected scope;
   - workflow contract verification: inspected current source, baseline-only, or incompatible/unresolved, with evidence;
   - requirement coverage: which concrete groups/models/operations were checked against which source, and remaining gaps;
   - original-source availability and any unavailable material;
   - pending repository checks and deferred decisions, without claiming tasks are Ready for implementation.
   Reuse the requirement sections; for substantial input, local requirement labels and a compact coverage map can prevent loss across delivery boundaries. A small request needs no matrix or extra artifact. Readiness is not a Backlog status, a substitute for the analyst's extraction check, or proof of agent behavior.

F. DOCUMENT STRUCTURE

Use the following fourteen top-level sections, preserving their names and order. Fill them with the actual task, not template placeholders. Briefly mark irrelevant sections "Not applicable" and empty open questions "None". Do not invent work to fill a section; a small task can have short sections and a single meaningful delivery. Preserve known implementation sequencing without writing speculative task plans.

# OpenCode Handoff — <Task / Topic>

Include a short metadata block with:
- Generation date.
- Target: OpenCode /increment-analyze; identify the actual target repository.
- Artifact role: input brief for analysis/decomposition, not a prepared task plan.
- Generation method: standalone Chat prompt, revision 1.1.0.
- Intended operation and supplied authority: new-work analysis, refinement, or review-only.
- Input readiness and workflow-contract verification: use the separate results in section E.
- Material source/context limitations, if any.

This metadata identifies the document; it is not proof that a Skill ran or that its content was validated by another agent. Do not print "skill active" or pretend to have invoked OpenCode Handoff.

## 1. Objective

State the original problem and the concrete desired outcome in terms of the user's need. Distinguish that outcome from an optional implementation mechanism. An engineer without the original conversation must understand why this work exists.

## 2. Current Context

Describe the relevant current architecture, behavior, environment, and work already completed. Separate user-reported state, inspected facts, and assumptions. Include enough context to understand the next increment, not unrelated conversation history.

## 3. Final Decisions

List accepted decisions and useful rationale. For material decisions, identify their basis briefly. Preserve later explicit corrections and agreed ownership. Do not place unapproved assistant proposals in this section as though they were final.

## 4. Requirements and Invariants

Use MUST/MUST NOT for binding constraints, SHOULD/SHOULD NOT for strong guidance, and MAY for optional choices within the agreed contract. Make material derived requirements and their justification recognizable. Preserve requirement-level conditions, bounds, exceptions and observable outcomes; use stable local labels only when useful for coverage, not as invented Backlog IDs. State guarantees at their actual strength. Keep unapproved material proposals outside binding requirements and acceptance.

## 5. Scope

Separate Included from Explicitly Deferred / Non-goals. Distinguish current acceptance from context about later phases. Preserve any known downstream boundary affected by the current decision without implementing that later phase now.

## 6. Relevant Existing Artifacts

Identify known repositories, files, tasks, contracts, prior artifacts, and source references with their location, relevance, and evidence status. Use a small table only when helpful. Identify unknown locations for repository discovery. Include the consumer-contract inspection record and the independently identifiable original-source excerpts/models required by section E.4 in this section or their relevant requirement sections. Do not let an audit depend exclusively on your own summary. Historical references are evidence, not automatic checkout instructions.

## 7. Architecture / Design

Describe the agreed design at implementation level: applicable boundaries, ownership, data/control flow, contracts, lifecycle, configuration, error handling, and compatibility. Describe the smallest direct approach and explain any materially more complex requirement. Keep undecided mechanisms labeled as undecided. Include Mermaid text only where it materially clarifies a known design; do not manufacture a diagram for completeness.

## 8. Data / API / Configuration Changes

Preserve the exact agreed schemas, structures, routes, semantics, examples, and persistence changes where available. Distinguish existing interfaces from approved new ones and proposals. State who interprets and validates which data. Do not invent schemas, validation rules, numeric guarantees, migration behavior, or unsupported syntax restrictions.

## 9. Implementation Plan

For this analysis-first workflow, this section is the agreed delivery sequence and constraints for later preparation, not an executable per-task technical plan. Preserve any specific implementation detail already approved; do not discard it simply because planning happens later, and do not invent the remaining mechanics.

State the immediate next action: submit the saved brief to `/increment-analyze` in the intended repository, with the intended new/refinement/review-only operation. Use a repository-relative path selected for the downloaded file; label a suggested `tmp/` location as a user placement instruction, not an existing file. Do not run the command from Chat or treat its argument as shell code.

The analyst first reads the actual brief, applicable local instructions and relevant implementation, and asks Backlog management to search existing work. It then extracts, verifies and decomposes requirements under its skill. Duplicate work may need no new records. This is analysis, not application implementation or task preparation.

Preserve the user's dependency ordering, first implementation mutation (including documentation-first when requested), expected outputs between deliveries, and known completion conditions. Documentation-first does not authorize the analyst to publish unimplemented functionality as current domain behavior. Mark supported task-boundary suggestions as provisional; final grouping and IDs belong to OpenCode after inspection.

Detailed preparation happens later for one existing executable task through `implementation-planning`. It must verify self-contained task requirements and available prerequisite outputs before establishing readiness. Do not plan all future tasks, infer prerequisites are available from status alone, or recommend building an Epic.

## 10. Testing and Validation

Specify the automated, static, build, behavioral, regression, and documentation checks relevant to accepted behavior. Discover unknown command names from the repository. Prefer focused integration tests for the wrapper and its actual consumers over reproducing a dependency's whole test catalogue. Add edge cases for explicit contracts or concrete risks, not speculative completeness. Preserve existing necessary protections.

Separate authoring/coverage checks performed now from application validation required later. The analyst does not run application tests or provision infrastructure. Separate checks already executed, checks only reported by others, and checks still required. If requirements are legitimately amended, reconcile their tests rather than deleting tests just to make an incompatible simplification pass.

## 11. Acceptance Criteria

Use observable product completion criteria for this increment, traceable to accepted outcomes and constraints. Keep these separate from handoff-input readiness and analysis completion. For proposed task criteria, preserve full conditions in the applicable local requirement text rather than relying on an Epic or a short topic summary. Do not use acceptance to introduce new infrastructure, stronger guarantees, future features, or an unapproved proposal. Identify unresolved conditions that prevent declaring the affected work ready or complete.

## 12. Rejected / Superseded Alternatives

Include only history useful to prevent rework or architectural regression. State each alternative's actual status and why it was rejected or superseded. An assistant proposal never approved is "unapproved", not a user decision later reversed. Historical requirements remain identifiable as history, not active obligations.

## 13. Open Questions

List only genuinely unresolved matters. Distinguish repository/environment discovery, routine choices within existing conventions, and material user decisions or contract amendments. Keep unapproved material proposals here with their trade-offs and affected phases. State the precise missing decision instead of fabricating a solution. For each material gap state the question, affected requirement/delivery, source to inspect or decision owner, and which action it prevents. Explicitly deferred local design is not a missing requirement. If none remain, write "None".

## 14. OpenCode Execution Protocol

End with task-specific instructions for the analysis invocation, not an unconditional instruction to implement:

1. Read the entire brief and current `increment-analyze` command, agent/skill instructions and applicable repository contracts. Read the actual supplied file. Confirm the intended repository, operation, existing IDs where supplied, and authority; preserve review-only limits. Inspect the working tree without treating a historical evidence SHA as an implementation base.
2. Follow `functional-increment-analysis` and its canonical task-structure contract. Use `backlog-management` to search and resolve related existing records before registration, preserving completed work and avoiding duplicates. Do not invent IDs or directly edit managed files.
3. Extract concrete requirements and perform the first fidelity check against original request/excerpts, brief, structured models and inspected repository evidence, not only a topic outline or this brief's coverage claims. Check omissions AND unsupported additions/strengthened guarantees, including resolved conflicts and exact observable outcomes. Resolve material gaps for affected work; keep genuine later design decisions deferred.
4. Decompose only into useful, economical outcomes. Epics are optional, not executable. Preserve full applicable requirements in each Story/standalone task, including shared rules, detailed exceptions and prerequisite outputs. Keep the complete increment/future-target model in its appropriate owner without making deferred work immediate acceptance. Validate actual dependencies as a DAG, not parent order or a layer-by-layer checklist.
5. Apply the existing documentation-quality and testing contracts proportionately. Keep supplied models, diagrams, exact semantics and readable local acceptance rules; formatting must not shorten away meaning. Use project `tmp/` only for authorized temporary work, distinct paths and complete payloads; do not require application infrastructure for analysis or invent a transport script.
6. When creation/refinement is authorized, delegate the complete verified payload, provenance, extraction-check result/limits and mutation authority to `backlog-management`. The registrar loads its own skill and owns CLI mechanics. New work starts in Backlog, not Ready; analysis does not write `backlog/plans/`, implement, create branches, or auto-close anything. Invocation-only limits must not contaminate future product requirements.
7. Read the actual saved descriptions, acceptance criteria, parentage and dependencies, in bounded portions if output is truncated. Perform the second fidelity check against both the verified inventory AND the original sources/preservation evidence again. Check each task locally as well as whole-increment coverage; an assurance from the registrar, successful CLI exit, or an input-brief link is insufficient. Correct within authority and reread, or report precise partial results; reconcile writes before retrying.
8. For substantial inputs, retain the workflow's existing independent read-only source-to-record audit by a permitted explore/scout agent distinct from the registrar, with original source material, inventory and actual saved records. The analyst remains accountable. Apply it only under the skill's conditions; small inputs need no extra reviewer. If unavailable or excluded, disclose the limit and perform the analyst's own check rather than claim independent verification.
9. On review-only requests, perform applicable checks against existing records and return findings without creating payloads, repairing records or changing statuses. For all operations, do not bypass missing tools or permissions, rewrite historical evidence, or infer publication/closure authority from this brief.
10. Report created/reused/refined actual IDs and revisions, real dependencies, first-extraction and final-source-to-record check results separately, independent-audit status, missing sources and concrete unresolved issues. The Chat preflight cannot certify this downstream result. Recommend one concrete next action; preparation/build requires a subsequent authorized request and available prerequisites. Do not execute that recommendation or claim no information loss as an absolute guarantee.

G. FINAL AUTHORING CHECK AND RESPONSE

Before saving the file, perform the section E input-readiness check against the available original sources. Check that a new OpenCode analyst can determine the objective, accepted decisions and their basis, current state, exact important identifiers, local/shared rules, source excerpts/models, non-goals, operation/authority, next action, real prerequisite outputs, observable acceptance and unresolved issues without this Chat. Verify that no requirement is retained only as a topic, temporary link, or promise to recover it later.

Then check what should NOT be in the document: obligations derived only from an assistant's previous wording, silently strengthened guarantees, speculative abstractions, premature future work, invented evidence, and tests that exist only to defend those additions. Remove unsupported additions from the proposed scope without silently changing an already-approved contract; flag the latter for amendment.

Resolve inconsistencies between requirements, architecture, plan, tests, acceptance, and the execution protocol. Do not mark the handoff ready just because these sections agree with each other; also check them against the original accepted need and the actual consumer contract. State analysis-input readiness separately from live-contract verification and later task readiness. The output must not tell an analysis-only agent to execute application changes or turn every delivery step into a Story.

Keep all useful detail. Do not expose private chain-of-thought, impose an arbitrary length target, or claim that a detailed prompt guarantees flawless execution or complete recovery of inaccessible context.

Create and inspect the Markdown file now. Reply with its download link and, only when material, a brief note about missing context, focused blocking questions, unverified consumer-contract access, or file-creation limitations. If there are blocking product decisions, do not merely hide them in the file and call it ready. Do not repeat the complete handoff in Chat unless file creation failed or I explicitly asked for inline output.
```
