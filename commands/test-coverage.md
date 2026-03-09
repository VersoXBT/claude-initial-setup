---
description: Analyze test coverage and add missing tests to reach 80%
---

# Test Coverage

Analyze current test coverage, identify gaps, and write tests to achieve at least 80% coverage.

## Steps

1. Run the test suite with coverage enabled:
   - Detect the test runner (jest, vitest, pytest, go test, etc.).
   - Run with coverage flags (e.g., `--coverage`, `--cov`, `-cover`).
   - Capture the coverage report output.

2. Parse the coverage report:
   - Identify files below 80% coverage.
   - Sort by coverage percentage (lowest first).
   - Note which lines and branches are uncovered.

3. Prioritize coverage gaps:
   - Focus on business logic and utility functions first.
   - Prioritize files with complex branching and error handling.
   - Skip auto-generated files, type definitions, and configuration files.

4. Write missing unit tests:
   - For each uncovered function, write tests covering:
     - Happy path with valid inputs.
     - Edge cases (null, undefined, empty, boundary values).
     - Error cases (invalid inputs, thrown exceptions).
   - Follow existing test patterns and conventions in the project.
   - Use descriptive test names that explain the expected behavior.

5. Write missing integration tests:
   - Test API endpoints with valid and invalid requests.
   - Test database operations with proper setup and teardown.
   - Test interactions between modules.

6. Run tests after writing each batch:
   - Verify new tests pass.
   - Verify existing tests still pass.
   - Re-check coverage numbers.

7. Repeat until all target files are at or above 80% coverage.

## If Coverage Cannot Reach 80%

- Check if uncovered code is truly unreachable (dead code) and remove it.
- Check if uncovered code requires complex setup (external services, specific environments) and note it.
- Document any intentional exclusions with coverage ignore comments and justification.

## Output

Updated test suite with all tests passing and coverage at or above 80% for target files. Include a before/after coverage summary.
