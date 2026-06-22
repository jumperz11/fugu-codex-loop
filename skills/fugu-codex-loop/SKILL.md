---
name: fugu-codex-loop
description: Run the Fugu + Codex orchestrated build loop for software projects. Use when the user wants Fugu to act as an orchestrator/foreman, Codex to act as a builder, repo docs to act as persistent memory, PR-sized slice planning, mandatory disagreement, frozen contracts, evaluator gates, reviewer lanes, handoffs, or a shareable AI-agent software workflow.
---

# Fugu + Codex Loop

Use this skill to run or set up the workflow:

> **Fugu orchestrates. Codex builds. The repo remembers. The human judges.**

## Core rules

1. Repo docs are memory. If it is not in `docs/`, treat it as unknown.
2. Disagreement is mandatory before implementation.
3. Freeze success criteria before results exist.
4. Keep work PR-sized.
5. The builder never grades its own work.
6. Raw evidence beats narrative.

## Setup a repo

If the repo does not already have memory docs, create:

- `docs/HANDOFF.md` — raw state after every work block
- `docs/CONTRACTS.md` — frozen APIs, schemas, file formats, ownership
- `docs/DECISIONS.md` — accepted/rejected decisions and why
- `docs/EVALS.md` — success gates frozen before results
- `docs/NEXT_SLICE.md` — one PR-sized next mission

Use the templates in `references/repo-memory.md` if blank files are needed.

## Run a session as Fugu

Read these files first:

- `docs/HANDOFF.md`
- `docs/CONTRACTS.md`
- `docs/DECISIONS.md`
- `docs/EVALS.md`
- `docs/NEXT_SLICE.md`

Then produce:

1. current state from repo memory only
2. disagreements / risks
3. contracts to verify or freeze
4. next PR-sized slice spec
5. max 3 non-conflicting builder lanes
6. exactly one reviewer lane that writes no feature code
7. paste-ready Codex block

For exact output structure, read `references/fugu-orchestrator.md`.

## Direct Codex as builder

Codex must:

1. disagree before coding
2. cite real repo files checked
3. verify APIs/schemas/formats against reality
4. freeze `docs/CONTRACTS.md`, `docs/EVALS.md`, and `docs/NEXT_SLICE.md`
5. build in max 3 lanes only when file ownership does not conflict
6. run one reviewer lane that returns only `APPROVE` or numbered defects
7. update `docs/HANDOFF.md` with raw facts only

For the paste-ready builder block, read `references/codex-builder.md`.

## Review Codex output

When Codex returns results:

1. judge only raw evidence
2. compare against `docs/EVALS.md`
3. fail any mid-slice contract changes not explicitly approved by the human
4. fail if reviewer did not approve
5. rule PASS / FAIL / PARTIAL
6. write the next slice or kill/rollback recommendation

For review structure, read `references/fugu-review.md`.
