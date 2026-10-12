---
description: Switch to build mode and implement a named plan from .opencode/plans
agent: build
---

Implement the plan at `.opencode/plans/$ARGUMENTS.md`. Read the whole plan before changing anything. Follow it as written, including any ADRs it links to in `docs/adr/`. If no plan name was given, or the file does not exist, list the files in `.opencode/plans/` and ask which one to build. If something in the plan is unclear or no longer fits the code, stop and ask rather than guess. When finished, summarize what changed and anything left undone.
