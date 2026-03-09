---
description: Start test-driven development workflow for a feature or fix
---

# Test-Driven Development

Follow the RED-GREEN-REFACTOR cycle to implement a feature or bug fix with tests written first.

## Steps

1. Identify the feature or fix to implement. Clarify requirements and expected behavior before writing any code.

2. Write a failing test (RED phase):
   - Create or update the test file for the target module.
   - Write a test that describes the expected behavior.
   - Include edge cases: null inputs, empty collections, boundary values.
   - Do not write any implementation code yet.

3. Run the test suite and verify the new test fails:
   - Use the project's test runner (jest, vitest, pytest, go test, etc.).
   - Confirm the failure is for the expected reason (not a syntax error or import issue).
   - If the test passes without implementation, the test is not testing new behavior — revise it.

4. Write minimal implementation (GREEN phase):
   - Write only enough code to make the failing test pass.
   - Do not add extra features, optimizations, or abstractions.
   - Use immutable patterns — never mutate inputs.

5. Run the test suite again and verify the test passes:
   - All new tests must pass.
   - All existing tests must still pass.
   - If any test fails, fix the implementation (not the test, unless the test is wrong).

6. Refactor (IMPROVE phase):
   - Clean up the implementation while keeping all tests green.
   - Extract helpers if there is duplication.
   - Improve naming and readability.
   - Run tests after every change to ensure nothing breaks.

7. Check coverage:
   - Run tests with coverage reporting enabled.
   - Verify the new code has at least 80% coverage.
   - Add additional tests if coverage is below threshold.

## If Tests Fail Unexpectedly

- Read the error message carefully before changing code.
- Check test isolation — tests should not depend on each other.
- Verify mocks and stubs are set up correctly.
- Fix the root cause, not the symptom.

## Output

Passing test suite with new tests covering the implemented feature and at least 80% code coverage.
