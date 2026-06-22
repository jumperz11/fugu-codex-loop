# Codex Builder Block

```txt
/goal: execute the Fugu orchestration slice.

Rules:

PHASE 0 — DISAGREE FIRST

Before code, reply with:

1. your plan
2. every disagreement you have
3. every ambiguity you found
4. every repo file you checked
5. every contract/API/schema/command you must verify against reality

Silent compliance = failure.
Silent scope additions = failure.
Unverified API assumptions = failure.

PHASE 1 — FREEZE CONTRACTS

Before implementation, update or confirm:

- docs/CONTRACTS.md
- docs/EVALS.md
- docs/NEXT_SLICE.md

After this, frozen contracts are read-only for this slice unless the human explicitly approves a change.

PHASE 2 — BUILD LANES

Spawn max 3 implementation lanes only if their file ownership does not conflict.

Each lane must report:

- files touched
- tests added/changed
- commands run
- exit codes
- unresolved risks

PHASE 3 — REVIEWER LANE

Spawn one reviewer that writes no feature code.

Reviewer must return only:

APPROVE

or

DEFECTS:
1. [specific defect]
2. [specific defect]
3. [specific defect]

Nothing merges without reviewer approval.

PHASE 4 — VERIFY

Run the agreed commands from docs/EVALS.md.

Capture raw results only:

- command
- exit code
- pass/fail
- relevant output
- changed files
- known failures

PHASE 5 — HANDOFF

Update docs/HANDOFF.md with raw facts only.

No hype.
No “promising.”
No “mostly done.”
No interpretation.

Verdicts belong to Fugu and the human.
```
