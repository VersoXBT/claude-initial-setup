---
description: Pre-deployment verification checklist
---

# Deploy Check

Run a comprehensive pre-deployment verification to ensure the application is ready for release.

## Steps

1. Run the full test suite:
   - Execute all unit, integration, and E2E tests.
   - Verify zero test failures.
   - Check test coverage meets the 80% threshold.
   - If any tests fail, stop and fix them before proceeding.

2. Verify the build:
   - Run a clean production build.
   - Check for build warnings that may indicate issues.
   - Verify the build output size is reasonable (no unexpected bloat).
   - Confirm no development-only code is included in the production bundle.

3. Check environment configuration:
   - Verify all required environment variables are documented.
   - Confirm no hardcoded development URLs, ports, or credentials exist.
   - Check that environment-specific settings (database URLs, API endpoints) use env vars.
   - Verify `.env.example` is up to date with all required variables.

4. Review database migrations:
   - Check that all pending migrations are included.
   - Verify migrations are reversible (have a rollback path).
   - Confirm migrations do not drop columns or tables without a data migration plan.
   - Test migrations against a copy of production data if possible.

5. Security verification:
   - No hardcoded secrets in the codebase.
   - All dependencies audited (`npm audit`, `pip audit`, etc.).
   - HTTPS enforced for all external communication.
   - Authentication and authorization working correctly.

6. Check CI pipeline:
   - Verify all CI checks are passing.
   - Confirm the deployment pipeline is configured for the target environment.
   - Review any skipped or ignored checks.

7. Review recent changes:
   - Run `git log` to review all commits since last deployment.
   - Verify no debugging code, console.log statements, or TODO hacks are present.
   - Confirm all PRs have been reviewed and approved.

8. Create a rollback plan:
   - Document the current deployed version or commit hash.
   - Verify the rollback procedure works.
   - Identify monitoring metrics to watch after deployment.

## If Issues Are Found

- Fix blocking issues (test failures, build errors, security vulnerabilities) before deploying.
- Log non-blocking issues for immediate follow-up after deployment.
- Do not deploy with known CRITICAL or HIGH severity issues.

## Output

A deployment readiness report: READY or NOT READY, with a list of passed checks, failed checks, and any items requiring follow-up.
