---
description: Systematic debugging process to isolate and fix issues
---

# Systematic Debugging

Follow a structured approach to identify, isolate, and fix bugs efficiently.

## Steps

1. Reproduce the issue:
   - Identify the exact steps, inputs, or conditions that trigger the bug.
   - Confirm the issue is reproducible and not intermittent.
   - Note the expected behavior versus the actual behavior.

2. Gather evidence:
   - Read error messages, stack traces, and log output carefully.
   - Check recent changes with `git log --oneline -20` and `git diff` to see if the bug was introduced recently.
   - Identify the affected files and functions from the stack trace.

3. Form a hypothesis:
   - Based on the evidence, propose what is causing the bug.
   - Write down the hypothesis before investigating further.

4. Isolate the root cause:
   - Use binary search / bisect to narrow down the problem area.
   - If recent regression: use `git bisect` to find the offending commit.
   - If logic error: add targeted logging or use a debugger to trace execution flow.
   - Verify assumptions — check that inputs, state, and dependencies are what you expect.

5. Validate the hypothesis:
   - Confirm the root cause matches the observed behavior.
   - If the hypothesis is wrong, return to step 3 with new evidence.

6. Implement the fix:
   - Fix the root cause, not just the symptom.
   - Use immutable patterns — do not mutate existing objects.
   - Keep the fix minimal and focused.

7. Verify the fix:
   - Reproduce the original steps — the bug should no longer occur.
   - Run the full test suite to check for regressions.
   - Write a test that would have caught this bug to prevent recurrence.

8. Check for related issues:
   - Search the codebase for similar patterns that may have the same bug.
   - Fix any related occurrences found.

## If the Bug Cannot Be Reproduced

- Check environment differences (OS, Node version, database state).
- Review logs from the environment where the bug occurred.
- Add additional logging to capture more context for next occurrence.

## Output

A verified fix with a regression test, plus a brief summary of the root cause and how it was resolved.
