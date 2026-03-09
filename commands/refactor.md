---
description: Clean up dead code and refactor for maintainability
---

# Refactor

Identify and remove dead code, then refactor for improved maintainability and readability.

## Steps

1. Identify dead code:
   - Search for unused exports — functions, classes, constants, and types that are never imported.
   - Search for unused imports in each file.
   - Search for unreachable code after return, throw, or break statements.
   - Search for commented-out code blocks.
   - Search for unused variables and parameters.

2. Verify before removing:
   - For each candidate, search the entire codebase for references.
   - Check for dynamic usage patterns (string-based imports, reflection, config-driven loading).
   - Check if the code is used in tests — remove test code only if the production code is also removed.
   - Do not remove public API surface without confirming it is safe.

3. Remove dead code safely:
   - Remove one item at a time.
   - Run the build after each removal to catch breakage.
   - Run the test suite after each removal.
   - If removal breaks something, revert and investigate the dependency.

4. Refactor for clarity:
   - Extract functions longer than 50 lines into smaller, well-named functions.
   - Reduce nesting depth to 4 levels or fewer.
   - Replace magic numbers and strings with named constants.
   - Apply immutable patterns — replace mutations with spread operators or functional updates.

5. Refactor for structure:
   - Split files larger than 800 lines into focused modules.
   - Group related functions into cohesive modules.
   - Move shared utilities to a common location.

6. Final verification:
   - Run the full build.
   - Run all tests and confirm they pass.
   - Verify no new lint warnings were introduced.

## If Removal Breaks the Build

- Revert the removal immediately.
- Investigate the reference that was missed.
- Add the item back and mark it for later review if the dependency is complex.

## Output

A cleaner codebase with dead code removed, files properly sized, and all tests passing.
