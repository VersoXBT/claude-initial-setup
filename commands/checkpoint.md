---
description: Create a git commit checkpoint of current progress
---

# Checkpoint

Review current changes and create a well-structured git commit to save progress.

## Steps

1. Check the current state:
   - Run `git status` to see all modified, staged, and untracked files.
   - Run `git diff` to review unstaged changes.
   - Run `git diff --staged` to review already-staged changes.

2. Review changes for commit readiness:
   - Verify no debugging code (console.log, print statements, debugger).
   - Verify no hardcoded secrets (API keys, passwords, tokens).
   - Verify no temporary files or build artifacts are included.
   - Check that `.gitignore` covers files that should not be committed.

3. Group changes logically:
   - If changes span multiple concerns (feature + refactor + fix), consider splitting into multiple commits.
   - Each commit should represent a single logical change.
   - Stage only the files related to one logical change at a time.

4. Stage relevant files:
   - Use `git add <specific-files>` rather than `git add .` to avoid committing unintended files.
   - Double-check staged files with `git diff --staged`.
   - Exclude any files that contain sensitive data.

5. Write a descriptive commit message:
   - Use conventional commit format: `<type>: <description>`.
   - Types: feat, fix, refactor, docs, test, chore, perf, ci.
   - Keep the subject line under 72 characters.
   - Add a body for complex changes explaining the "why" not the "what".

6. Create the commit:
   - Run `git commit` with the prepared message.
   - Verify the commit was created successfully with `git log -1`.

7. If there are remaining changes for a separate concern:
   - Repeat steps 4-6 for the next logical group.

## If Pre-Commit Hooks Fail

- Read the hook output to understand what failed.
- Fix the reported issues (lint errors, type errors, test failures).
- Stage the fixes and create a new commit — do not amend the previous commit.

## If Sensitive Files Are Accidentally Staged

- Unstage them immediately with `git reset HEAD <file>`.
- Add the file pattern to `.gitignore`.
- If already committed, remove from history and rotate any exposed secrets.

## Output

One or more clean git commits with descriptive messages following conventional commit format.
