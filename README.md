# Fugu + Codex — Orchestrated Build Loop

> **Fugu orchestrates. Codex builds. The repo remembers. You judge.**

A lightweight system for running real software work with two AI agents and a
human, without burning hundreds of dollars in API tokens.

- **Fugu** = the **orchestrator** (the foreman). Reads repo memory, finds
  disagreements, freezes contracts, splits work into lanes, forces
  verification, and keeps the build honest.
- **Codex** = the **builder** (the hands). Does the heavy repo edits, runs the
  terminal, ships PR-sized slices.
- **The repo** = the **brain**. All state lives in `docs/`. If it is not in
  repo memory, it did not happen.
- **You** = the **final judge**. Taste, product calls, kill/continue.

---

## The loop

```
┌─────────┐   spec + lanes   ┌─────────┐   raw results   ┌─────────┐
│  FUGU   │ ───────────────▶ │  CODEX  │ ──────────────▶ │  REPO   │
│ foreman │                  │  hands  │                 │  brain  │
└────┬────┘ ◀─────────────── └─────────┘ ◀────────────── └────┬────┘
     │            verdict / next slice                        │
     └──────────────────────▶  YOU (judge)  ◀─────────────────┘
```

1. **Fugu** reads `docs/`, raises disagreements, writes the next slice, splits
   lanes, and outputs a paste-ready Codex block.
2. **Codex** disagrees first, freezes contracts, builds in lanes, runs a
   reviewer lane, verifies, and writes **raw results** back to `docs/HANDOFF.md`.
3. **Fugu** judges raw evidence (not narrative), rules PASS/FAIL/PARTIAL, and
   writes the next slice.
4. **You** make the final product and kill/continue calls.

---

## Quick start

```bash
# 1. clone this kit into your project (or copy the docs/ + prompts/ folders)
git clone <this-repo> my-project
cd my-project

# 2. fill in the project name + first objective
#    edit docs/HANDOFF.md and docs/NEXT_SLICE.md

# 3. paste prompts/01-fugu-orchestrator.md to Fugu
# 4. paste Fugu's Codex block (built from prompts/02-codex-builder.md) to Codex
# 5. paste raw results back with prompts/03-fugu-review.md
# 6. repeat
```

---

## Repo memory (`docs/`)

| File | Role |
| --- | --- |
| `docs/HANDOFF.md` | Raw state of the repo after every work block. |
| `docs/CONTRACTS.md` | Frozen APIs, schemas, interfaces, file formats. |
| `docs/DECISIONS.md` | Accepted / rejected architecture decisions + why. |
| `docs/EVALS.md` | Success gates, frozen **before** results exist. |
| `docs/NEXT_SLICE.md` | The next small, PR-sized mission. |

---

## The 6 rules that make it work

1. **Repo docs are the memory.** Not in `docs/` = didn't happen.
2. **The builder never grades its own work.** Verdicts belong to Fugu + you.
3. **Disagreement is mandatory.** Silent compliance = failure.
4. **Freeze success criteria before results exist.** Never edit gates after.
5. **Small slices only.** One PR-sized change at a time.
6. **Spend orchestration on judgment, builder time on typing.**

---

## Why Fugu instead of a once-a-day architect

The old pattern used an expensive model briefly as an architect. Fugu is cheap
enough to **stay in the room** — so it stops being a once-per-day oracle and
becomes the operating layer around the builder: tracking ownership, diffs,
failures, frozen contracts, disputes, and what gets built next.

> Fable was the edge. Codex was the hands.
> Fugu is what happens when the edge becomes cheap enough to stay on-site.

---

## What's in here

```
.
├── README.md
├── LICENSE
├── docs/                  # repo memory (the brain)
│   ├── HANDOFF.md
│   ├── CONTRACTS.md
│   ├── DECISIONS.md
│   ├── EVALS.md
│   └── NEXT_SLICE.md
├── prompts/               # paste-ready prompts for each step
│   ├── 01-fugu-orchestrator.md
│   ├── 02-codex-builder.md
│   └── 03-fugu-review.md
└── templates/             # blank templates to reset between blocks
    ├── HANDOFF.template.md
    └── SLICE.template.md
```

## License

MIT — see [LICENSE](LICENSE). Share it, remix it, ship with it.
