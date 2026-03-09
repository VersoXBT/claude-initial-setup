# Copilot Instructions

## Code Style

Always create new objects instead of mutating existing ones. Use spread operators, `structuredClone`, or immutable patterns like `@dataclass(frozen=True)` in Python and value receivers in Go.

Never use `.push()`, `.pop()`, `.splice()`, `.sort()`, or `.reverse()` on shared arrays. Use `[...arr, item]`, `.filter()`, `.map()`, `.toSorted()`, and `.toReversed()` instead.

Keep files between 200-400 lines. Extract separate modules when files grow beyond 800 lines. Organize files by feature or domain, not by type.

Keep functions under 50 lines. If longer, extract helper functions with descriptive names.

Avoid nesting deeper than 4 levels. Use early returns, guard clauses, or extracted functions to flatten logic.

Name variables to describe WHAT they contain, not HOW they were computed. Use `activeUsers` instead of `data` or `result`.

Prefix boolean variables with `is`, `has`, `can`, `should`, `was`, or `will`: `isActive`, `hasPermission`, `canEdit`.

Name functions with a verb describing what they do: `getUserById`, `formatDate`, `validateEmail`, `createOrder`.

Use plural nouns for collections: `users`, `orderItems`. Use singular for individual items in iteration.

Use SCREAMING_SNAKE_CASE for true constants: `MAX_RETRIES`, `API_BASE_URL`.

Follow language-specific casing: camelCase for JS/TS variables, PascalCase for classes/types, snake_case for Python, PascalCase for exported Go identifiers.

## Git Workflow

Use conventional commits: `<type>(<scope>): <description>`. Types: feat, fix, refactor, docs, test, chore, perf, ci.

Write commit messages in imperative mood ("add feature" not "added feature"), lowercase after type, under 72 characters, no trailing period.

Name branches as `feature/`, `fix/`, `hotfix/`, `release/` followed by ticket ID and kebab-case description: `feature/AUTH-123-add-sso-login`.

Keep pull requests under 400 lines. Include a summary, list of changes, and test plan in every PR description.

Never rebase commits that have been pushed to a shared branch. Never force-push to main or develop.

## Testing

Write tests before implementation (TDD). Follow Red-Green-Refactor: write a failing test, write minimal code to pass, then refactor.

Target 80% minimum code coverage across unit, integration, and E2E tests.

Co-locate unit tests next to source files: `auth.ts` and `auth.test.ts` in the same directory.

Use factories for dynamic test data with unique values. Use fixtures for static, predictable test data.

Mock only at system boundaries: external APIs, databases, file I/O, email services. Never mock pure functions or the code under test.

Always restore mocks after each test. Use `afterEach(() => vi.restoreAllMocks())` or equivalent.

Use dependency injection to make code testable. Accept dependencies as parameters rather than importing directly.

For bug fixes, always write a test that reproduces the bug before writing the fix.

## Security

Never hardcode secrets, API keys, or passwords in source code. Use environment variables loaded from `.env` files.

Always include `.env`, `.env.local`, `*.pem`, `*.key`, `credentials.json` in `.gitignore`.

Validate required environment variables at application startup using Zod, Pydantic, or equivalent schema validation.

Validate all user input at system boundaries. Use Zod for TypeScript, Pydantic for Python, struct tags for Go.

Prefer allowlists over denylists when filtering or validating input.

Use parameterized queries for all SQL. Never concatenate user input into query strings.

Sanitize user-generated HTML with DOMPurify. Use `textContent` instead of `innerHTML` for plain text.

Implement CSRF protection with anti-CSRF tokens and SameSite cookie attributes.

Prevent SSRF by allowlisting permitted domains for server-side HTTP requests.

Verify authorization on every resource access. Check that the requesting user owns or has permission to access the resource.

Rate limit authentication endpoints. Use bcrypt with 12+ salt rounds for password hashing.

Set security headers using helmet or equivalent: CSP, HSTS, Referrer-Policy.

Never log passwords, tokens, API keys, or PII.

Never return sensitive fields (password hashes, internal notes) in API responses. Select only needed fields.

## Error Handling

Always handle errors explicitly. Never swallow errors with empty catch blocks.

Throw descriptive errors with context: include what operation failed and relevant identifiers.

Check `response.ok` after fetch calls. Throw on non-2xx responses with status and statusText.

Use custom error classes for domain-specific errors to enable typed error handling.

Return consistent API error responses with `success`, `error`, and field-level validation details.

## Debugging

Follow the debugging loop: REPRODUCE, HYPOTHESIZE, TEST, ISOLATE, FIX, VERIFY.

Use `git bisect` to find the commit that introduced a bug. Use `git bisect run <test-script>` for automation.

Create minimal reproductions that isolate the failing behavior from surrounding complexity.

Fix root causes, not symptoms. Do not add null checks to silence errors without understanding why values are null.

## Performance

Avoid N+1 queries. Use joins, `include`, `select_related`, or batch loading.

Bound all database queries with LIMIT and pagination. Never fetch entire tables.

Use appropriate caching: in-memory LRU for hot paths, Redis for distributed state, CDN for static assets.

Set proper Cache-Control headers: `public` for shared resources, `private` for user-specific data, `no-store` for sensitive data.

Use lazy loading and code splitting for frontend bundles. Prefer `React.lazy` and dynamic `import()`.

## Docker

Use multi-stage builds to separate build dependencies from runtime.

Run containers as non-root users. Create a dedicated user with `adduser`.

Order Dockerfile instructions to maximize layer caching: dependencies first, source code last.

Include HEALTHCHECK directives in production Dockerfiles.

Use Alpine-based images unless specific system libraries require a full distribution.

## Database

Normalize schemas to 3NF. Denormalize selectively only when proven necessary for performance.

Use snake_case for all table names, column names, and indexes.

Add indexes for columns frequently used in WHERE, JOIN, and ORDER BY clauses.

Use foreign key constraints for referential integrity.

Plan migrations for zero downtime. Add new columns as nullable, backfill, then add constraints.

## Code Review

Review priority: Correctness, Security, Performance, Maintainability, Testing, Style.

Check for edge cases: empty arrays, null values, zero, negative numbers, boundary conditions.

Verify error states are handled: network failures, invalid data, timeouts.

Confirm authorization checks exist on every resource access endpoint.

Look for N+1 queries and unbounded result sets.

Automate style enforcement with linters and formatters. Do not nitpick formatting in reviews.
