---
description: Run code review on recent changes
---

# Code Review

Perform a thorough code review on recent changes, checking for quality, security, and performance issues.

## Steps

1. Run `git diff` to identify all changed files. If on a feature branch, use `git diff main...HEAD` to see all changes since branching.

2. For each changed file:
   - Read the full file to understand context, not just the diff.
   - Check naming conventions and code readability.
   - Verify functions are small (under 50 lines) and files are focused (under 800 lines).
   - Ensure no mutation of objects or arrays — immutable patterns must be used.

3. Check for security issues:
   - No hardcoded secrets (API keys, passwords, tokens).
   - All user inputs validated and sanitized.
   - No SQL injection, XSS, or CSRF vulnerabilities.
   - Error messages do not leak sensitive data.

4. Check for performance issues:
   - No unnecessary re-renders or redundant computations.
   - No N+1 query patterns in database access.
   - Proper use of memoization and caching where appropriate.

5. Check for correctness:
   - Edge cases handled (null, undefined, empty arrays, boundary values).
   - Error handling is comprehensive with try/catch where needed.
   - No console.log statements left in production code.
   - No hardcoded values that should be constants or config.

6. Verify test coverage:
   - New code has corresponding tests.
   - Tests cover happy path and error cases.
   - No tests were removed or skipped without justification.

7. Compile findings into a report grouped by severity:
   - CRITICAL: Security vulnerabilities, data loss risks, crashes.
   - HIGH: Logic errors, missing error handling, broken functionality.
   - MEDIUM: Code quality issues, missing tests, style violations.
   - LOW: Naming suggestions, minor refactoring opportunities.

## If Issues Are Found

- Fix CRITICAL issues immediately before any commit.
- Fix HIGH issues before merging.
- Log MEDIUM and LOW issues for follow-up.

## Output

A structured review report listing each issue with file path, line number, severity, and recommended fix.
