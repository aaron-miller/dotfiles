---
name: TDD
description: Test-driven development for application code. Use when implementing a plan step or fixing a bug test-first, or when the user mentions red-green-refactor.
---

# Test-driven development

Work in red, then green, one vertical slice at a time. Test through public interfaces only.

## Before the first test

- If the repo has `docs/GLOSSARY.md`, read it so test names use project terms. Respect the ADRs in `docs/adr/` for the area you are changing.
- Find the seams: the public interfaces you will test through. If the plan names them, use those. If it does not, list the candidate seams, one line each on what it catches, and confirm with the user before writing a test.

## The loop

1. **Red.** Write one test for one behavior at a seam. Run it and confirm it fails for the reason you expect. If it fails for some other reason, fix the test first.
2. **Green.** Write the least code that makes it pass. Do not add speculative features or code for a test you have not written yet.
3. **Repeat.** Take the next behavior. Each cycle can change direction based on what the last one taught you.
4. **Refactor** only when the suite is green, as a separate pass. Do not change behavior during a refactor.

## Test quality

- Assert what a caller can observe. A test that breaks during a refactor with no behavior change is coupled to the implementation. Mock only what you do not control: network, clock, third-party services.
- Take expected values from an independent source: a literal, a worked example, the spec. Never recompute the expected value the way the code does, such as `expect(add(a, b)).toBe(a + b)`. That test cannot fail.
- Do not write all the tests first and then all the code. Tests written that way describe behavior you imagined.
- Snapshots detect change; they do not specify behavior. Use explicit assertions for contract-level behavior.

## Bugs

Write a failing test that reproduces the reported symptom at a seam that reaches the bug. Watch it fail, then fix the bug. If no seam reaches the bug, say so and say what would make one possible.

## Done when

- The suite passes.
- Each new test was seen failing before its code was written.
- Any test you skipped is named, with the reason.
