# Fugu + Codex — Orchestrated Build Loop

> **Fugu orchestrates. Codex builds. The repo remembers. You judge.**

A small, opinionated system for running real software work with AI agents —
without burning hundreds of dollars in API tokens, and without letting a model
grade its own homework.

[![ci](https://github.com/jumperz11/fugu-codex-loop/actions/workflows/ci.yml/badge.svg)](https://github.com/jumperz11/fugu-codex-loop/actions/workflows/ci.yml)

---

## 60-second quickstart

```bash
git clone https://github.com/jumperz11/fugu-codex-loop my-project
cd my-project

make init      # create docs/ repo memory
# edit docs/NEXT_SLICE.md with your first PR-sized task
make doctor    # check the repo is ready for a build block
```

Then run the loop:

1. Paste [`prompts/01-fugu-orchestrator.md`](prompts/01-fugu-orchestrator.md) to **Fugu**.
2. Paste Fugu's generated block to **Codex** (template: [`prompts/02-codex-builder.md`](prompts/02-codex-builder.md)).
3. Paste the raw results back with [`prompts/03-fugu-review.md`](prompts/03-fugu-review.md).
4. Repeat. You make the kill/continue calls.

**Want to see it first?** Read the full worked example in
[`examples/demo-run/`](examples/demo-run/README.md).

---

## What is "Fugu" here?

In this workflow, **Fugu is the orchestrator** — the foreman, not the chatbot.
It does not write feature code. Its job is to read repo memory, force
disagreement, freeze contracts, split work into small slices, judge raw
evidence, and decide what gets built next.

**Codex is the builder** — the hands that do the actual repo edits and run the
terminal. Any capable coding agent can fill this role.

You can also run this with **one agent playing both roles** (see [FAQ](#faq)).
The discipline is the product, not the agent count.

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

---

## Repo memory (`docs/`)

| File | Role |
| --- | --- |
| `docs/HANDOFF.md` | Raw state of the repo after every work block. |
| `docs/CONTRACTS.md` | Frozen APIs, schemas, interfaces, file formats. |
| `docs/DECISIONS.md` | Accepted / rejected decisions + why. |
| `docs/EVALS.md` | Success gates, frozen **before** results exist. |
| `docs/NEXT_SLICE.md` | The next small, PR-sized mission. |

`make doctor` checks these are real, not placeholders, before you start a run.

---

## The 6 rules that make it work

1. **Repo docs are the memory.** Not in `docs/` = didn't happen.
2. **The builder never grades its own work.** Verdicts belong to Fugu + you.
3. **Disagreement is mandatory.** Silent compliance = failure.
4. **Freeze success criteria before results exist.** Never edit gates after.
5. **Small slices only.** One PR-sized change at a time.
6. **Spend orchestration on judgment, builder time on typing.**

---

## Install as a Codex skill (optional)

```bash
mkdir -p ~/.codex/skills
cp -R skills/fugu-codex-loop ~/.codex/skills/
```

Then ask Codex:

```txt
Use the fugu-codex-loop skill to set up this repo for Fugu orchestration.
```

---

## What's in here

```
.
├── README.md
├── Makefile               # make init / doctor / doctor-example
├── scripts/
│   ├── doctor.py          # validates repo memory is ready
│   └── init.py            # copies docs/ memory into a repo
├── docs/                  # repo memory templates (the brain)
├── prompts/               # paste-ready prompts for each step
├── examples/demo-run/     # a full worked loop on a tiny API
├── skills/fugu-codex-loop # installable Codex skill
├── templates/             # blank resets between blocks
└── .github/workflows/     # CI validates the example + scripts
```

---

## FAQ

**Do I need two different models?**
No. The roles matter, not the headcount. One agent can orchestrate, build, and
self-review — but keep the human as the final judge, because a model grading its
own work is the #1 failure mode. A second, independent model on the review step
just catches more bugs.

**Why not let one agent "do it all" with no structure?**
Because the value is the structure: memory, frozen gates, mandatory
disagreement, and raw-evidence verdicts. That's what makes cheap models behave
like a serious team.

**Is this tied to a specific language or framework?**
No. The loop is language-agnostic. The example happens to use Node, but the
memory + slice + review discipline applies anywhere.

---

## License

MIT — see [LICENSE](LICENSE). Share it, remix it, ship with it.

> Fable was the edge. Codex was the hands.
> Fugu is what happens when the edge becomes cheap enough to stay on-site.
