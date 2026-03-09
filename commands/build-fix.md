---
description: Incrementally fix build errors one at a time
---

# Build Fix

Systematically resolve build errors by fixing them one at a time and verifying after each fix.

## Steps

1. Run the project build command:
   - Detect the build system (npm, pnpm, yarn, cargo, go, make, etc.).
   - Run the appropriate build command and capture all output.

   ```bash
   npm run build 2>&1
   tsc --noEmit
   ```

2. Parse the build errors:
   - Extract each error with its file path, line number, and message.
   - Group errors by file to understand the scope.
   - Identify the total count of errors.

3. Prioritize the errors:
   - Fix type errors and import errors first — they often cascade.
   - Fix errors in dependency order (utilities before components that use them).
   - Start with the first error in the output, as later errors may be caused by earlier ones.

4. Fix one error at a time:
   - Read the affected file to understand context.
   - Apply the minimal fix needed.
   - Do not refactor or improve unrelated code during this process.

5. Re-run the build after each fix:
   - Verify the fixed error is resolved.
   - Check that no new errors were introduced.
   - If new errors appear that were not in the original output, revert the last change and try a different approach.

6. Repeat steps 4-5 until the build passes cleanly.

7. Run the test suite after the build succeeds:
   - Ensure no tests are broken by the fixes.
   - If tests fail, fix them before considering the task complete.

## If a Fix Introduces New Errors

- Revert the change immediately.
- Re-read the error message and surrounding code more carefully.
- Consider whether the error is a symptom of a deeper issue.
- Try an alternative approach.

## If the Build Has Too Many Errors (50+)

- Check if a major dependency or configuration change caused the cascade.
- Review recent commits for large-scale changes.
- Consider reverting the problematic commit and reapplying changes incrementally.

## Output

A clean build with zero errors and all tests passing.
