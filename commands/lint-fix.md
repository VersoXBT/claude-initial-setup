---
description: Auto-fix lint and formatting issues across the codebase
---

# Lint Fix

Run linters and formatters to fix code style issues, then report any remaining manual fixes needed.

## Steps

1. Detect the project's lint and format tools:
   - Check for ESLint, Prettier, Biome, or similar in the config files and package.json.
   - Check for language-specific tools: ruff/black (Python), gofmt (Go), rustfmt (Rust), etc.
   - Identify the configuration files (.eslintrc, .prettierrc, biome.json, ruff.toml, etc.).

2. Run the formatter first:
   - Execute the formatter with auto-fix (e.g., `prettier --write .`, `black .`, `gofmt -w .`).
   - Capture and note any files that were modified.
   - If no formatter is configured, skip this step.

3. Run the linter with auto-fix:
   - Execute the linter with fix flag (e.g., `eslint --fix .`, `ruff check --fix .`).
   - Capture the output and note auto-fixed issues.
   - Record any issues that cannot be auto-fixed.

4. Review remaining manual issues:
   - For each unfixable issue, read the affected code and understand the problem.
   - Fix issues that require code logic changes (unused variables, unreachable code, type errors).
   - Do not suppress warnings without justification — fix the root cause.

5. Run the linter again:
   - Verify all auto-fixed issues are resolved.
   - Verify manually fixed issues are resolved.
   - Confirm zero lint errors and zero warnings (or only intentionally suppressed warnings).

6. Verify the build:
   - Run the build to ensure lint fixes did not break compilation or bundling.
   - Run the test suite to ensure lint fixes did not change behavior.
   - If anything breaks, revert the problematic fix and apply a different solution.

## If the Linter Configuration Is Missing

- Do not introduce a new linter without user approval.
- Note the absence and recommend a linter setup for the project's language.

## If Auto-Fix Changes Break Tests

- Revert the auto-fix changes that caused the failure.
- Apply fixes manually with more care for the specific context.
- Run tests after each manual fix.

## Output

A clean lint report with zero errors. List of files modified, auto-fixed issue count, and manually fixed issue count.
