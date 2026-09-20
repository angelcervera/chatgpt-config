# Chat → Work handoff prompt

Use this prompt at the end of a normal Chat conversation when you want to move the work to ChatGPT Work **without relying on any Skill**.

Copy and paste the entire prompt below into the same Chat conversation.

```text
Create a complete handoff document from this entire Chat conversation so I can continue the work in ChatGPT Work without losing context.

This is not a summary. It is the authoritative transfer document for the next Work conversation.

Your task is to reconstruct the current state of this conversation and write it into a standalone Markdown file that can be downloaded and given to a new Work thread.

MANDATORY OUTPUT REQUIREMENTS

1. Create a real downloadable Markdown file.
   - Do not only render the Markdown in the chat.
   - The file must be an actual `.md` artifact I can download.
   - Use this filename pattern:
     chat-to-work-handoff-<short-topic>-YYYY-MM-DD.md
   - Use a short kebab-case topic derived from the main subject of the conversation.
   - If this Chat surface cannot create a downloadable file, say so explicitly and then provide the complete Markdown inline as a fallback. Never claim that a file exists if one was not actually created.

2. The handoff must be fully self-contained.
   - The Work thread must be able to continue without access to this Chat conversation.
   - Do not write references such as:
     - "as discussed above"
     - "as mentioned earlier"
     - "see the previous messages"
     - "continue with the approach from the chat"
   - Every fact needed to continue must be present in the file itself.

3. Read and reconcile the entire available conversation before writing the file.
   - Use the full conversation, not only the most recent messages.
   - Later explicit decisions override earlier proposals, assumptions, or discarded ideas.
   - Detect contradictions and resolve them according to the latest explicit decision.
   - Do not carry superseded decisions into the active plan.

4. Preserve exact technical details when they are known.
   Preserve them verbatim where precision matters, including:
   - repository names
   - branch names
   - task / issue / epic IDs
   - file paths
   - package names
   - type / interface / entity names
   - API routes
   - database table names
   - configuration keys
   - command names and CLI flags
   - version numbers
   - URLs
   - protocol names
   - tool names
   - model names
   - environment names

   Do not silently rename, normalize, or "improve" identifiers.

5. Do not invent missing implementation facts.
   Never fabricate:
   - repository paths
   - commands
   - APIs
   - schemas
   - package names
   - database objects
   - branch names
   - test commands
   - configuration keys
   - current implementation status

   If a detail is not known from the conversation, say that it must be discovered in the repository or environment by Work before making changes.

6. Distinguish clearly between different kinds of information.
   The handoff must separate:
   - final decisions
   - current known facts
   - hard constraints / invariants
   - implementation guidance
   - rejected alternatives
   - superseded decisions that are important to remember
   - explicitly deferred work / non-goals
   - genuinely unresolved questions

7. Preserve scope discipline.
   - Include what is in scope now.
   - Include what was explicitly deferred.
   - Do not reintroduce complexity that this conversation intentionally postponed.
   - Do not generalize beyond the agreed scope unless the conversation explicitly decided to do so.

8. Preserve rationale when it matters.
   - Include concise rationale for important decisions when it prevents the next Work thread from reopening a settled question.
   - Do not include private chain-of-thought.
   - Include only decision rationale useful for implementation and continuation.

9. Capture unfinished work precisely.
   For anything not completed in this Chat, state:
   - what remains to be done
   - what order it should be done in
   - what must be checked first
   - what constraints must be preserved
   - what completion looks like

10. Make the handoff suitable for continuing in ChatGPT Work.
    The next Work thread may have access to tools, files, repositories, browser automation, or external applications that this Chat did not use.
    Therefore:
    - identify what Work should inspect first
    - identify what evidence should be gathered before mutating anything
    - prefer verification over assumptions
    - instruct Work to reuse existing project conventions and architecture
    - instruct Work to report material contradictions between the handoff and repository/environment reality

REQUIRED DOCUMENT STRUCTURE

Use the following structure unless a section is truly irrelevant. Keep the numbering stable.

# Chat → Work Handoff — <Task / Topic>

> Source: ChatGPT Chat conversation
> Target: ChatGPT Work
> Date: YYYY-MM-DD
> Status: Continuation handoff

## 1. Objective

State exactly what we are trying to achieve.

## 2. Current State

Describe the current known state of the work at the end of this Chat conversation.

Include, where relevant:
- what has already been analyzed
- what has already been decided
- what has already been implemented
- what has already been rejected
- what is still pending

## 3. Final Decisions

List all decisions that are now authoritative.

For each important decision include, when useful:
- the decision
- concise rationale
- consequences for implementation

## 4. Requirements and Invariants

Separate them clearly.

### MUST

Binding requirements.

### MUST NOT

Explicit prohibitions or constraints.

### SHOULD

Strong guidance that is not absolutely mandatory.

### MAY

Optional implementation choices.

## 5. Scope

### Included

What this continuation is supposed to cover.

### Explicitly Deferred / Non-goals

What must remain out of scope for now.

## 6. Relevant Technical Context

Capture the technical facts needed to continue, including as relevant:
- architecture
- runtime / environment
- repositories
- branches
- modules / domains / components
- APIs
- schemas
- configuration model
- infrastructure
- dependencies
- versions
- tools
- external systems

Do not add anything that was not established in the conversation.

## 7. Relevant Existing Artifacts

Use a table when useful:

| Artifact | Location / Identifier | Relevance |
|---|---|---|
| ... | ... | ... |

If an exact location is unknown, say so explicitly and state what Work needs to locate.

## 8. Architecture / Design State

Describe the agreed architecture or design at the level needed to continue implementation or analysis.

Include, when relevant:
- boundaries
- ownership
- data flow
- control flow
- interfaces / contracts
- lifecycle
- configuration semantics
- persistence model
- compatibility requirements
- failure handling

Use Mermaid diagrams only if they materially improve clarity.

## 9. Implementation / Execution Plan

Create a dependency-ordered continuation plan.

Start with repository/environment reconnaissance unless the conversation already established enough current state.

### Phase 0 — Verify current reality

Include relevant checks such as:
- read project-local instructions
- inspect repository state
- verify current branch
- locate current implementation
- identify canonical build/test/lint/type-check commands
- compare repository/environment reality against this handoff

### Phase 1 — <next concrete step>

For each phase include:

**Objective**

**Changes / Actions**

**Constraints to preserve**

**Validation**

**Completion condition**

Continue with additional phases as required.

## 10. Validation and Acceptance Criteria

Define how Work knows the continuation task is complete.

Include, when relevant:
- automated tests
- static checks
- builds
- behavioral verification
- backward compatibility
- documentation consistency
- observable acceptance criteria

Do not invent command names. If exact commands are unknown, instruct Work to discover and use the repository's canonical commands.

## 11. Rejected / Superseded Alternatives

Include only alternatives important enough to prevent rework or reopening already-settled design questions.

Use a table when useful:

| Alternative | Status | Why not used |
|---|---|---|
| ... | Rejected / Superseded | ... |

## 12. Open Questions

Only include genuinely unresolved questions.

For each question, classify it as one of:
- resolve from repository/environment evidence
- use the existing project convention
- requires user decision before proceeding

If there are no unresolved questions, write:

None.

## 13. Immediate Next Action in Work

State the exact first thing the new Work thread should do after reading this handoff.

This section must be concrete and actionable.

## 14. Work Continuation Protocol

The new Work thread must follow these rules:

1. Read this entire handoff before taking action.
2. Treat this file as the authoritative transfer of the source Chat conversation.
3. Do not ask me to repeat information already present in this handoff.
4. Verify repository/environment reality before making changes.
5. Read applicable project-local instructions (`AGENTS.md`, contribution guides, ADR conventions, task files, style guides, etc.).
6. Reuse existing architecture, naming, utilities, patterns, and tests instead of creating parallel mechanisms.
7. Execute work in dependency order.
8. Run the project's canonical validation after meaningful stages.
9. Keep scope constrained to the decisions and non-goals documented here.
10. If repository/environment reality materially conflicts with this handoff, do not silently reinterpret the requirement. Report the conflict and choose the smallest safe adaptation consistent with the final decisions.
11. Preserve all exact identifiers and technical details from this handoff unless repository evidence proves they are outdated or wrong.
12. At the end, report:
    - what changed
    - what was validated
    - deviations from the handoff and why
    - remaining issues or follow-up work

QUALITY CHECK BEFORE DELIVERING

Before creating the file, verify that someone starting a new Work thread with only this file can answer all of the following:

- What are we trying to achieve?
- What is the current state?
- Which decisions are final?
- What must not change?
- What has been deferred?
- Which exact technical identifiers matter?
- What should be inspected first?
- What should be done next?
- In what order?
- How should it be validated?
- What does done mean?
- Which questions remain genuinely unresolved?

If any answer is missing, improve the handoff before delivering it.

FINAL RESPONSE IN CHAT

After creating the Markdown file:
- give me the download link;
- do not duplicate the entire handoff in the chat unless I explicitly ask for it;
- mention only material limitations or unresolved issues, if any.
```
