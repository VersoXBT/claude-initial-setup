# AGENTS.md

## Project Overview

A curated library of 75 Claude Code skills across 25 categories, providing coding standards, patterns, and best practices for software development. Skills cover coding style, git workflow, testing, debugging, security, and language-specific patterns for TypeScript, Python, Go, Rust, Java, React/Next.js, Express/Node, FastAPI, Django, Docker, CI/CD, databases, and more.

## Development Conventions

### Code Style

#### Immutability

Always create new objects instead of mutating existing ones. Immutability prevents shared-state bugs and enables reliable change detection.

```typescript
// WRONG: Mutation
function updateUser(user, name) {
  user.name = name;
  return user;
}

// CORRECT: Immutable update
function updateUser(user, name) {
  return { ...user, name };
}
```

Array operations must also be immutable:

```typescript
const added = [...items, newItem];                      // append
const removed = items.filter(x => x.id !== id);         // remove
const updated = items.map(x =>                          // update
  x.id === id ? { ...x, name: "new" } : x
);
const sorted = items.toSorted((a, b) => a.name.localeCompare(b.name));
```

Python: Use `@dataclass(frozen=True)` and `replace()` for immutable data.
Go: Use value receivers and return new structs instead of mutating via pointers.

#### File Organization

- Target 200-400 lines per file, 800 maximum
- Organize by feature/domain, not by type
- Co-locate tests, styles, and types with their source files
- Move code to `shared/` only when used by 3+ features

#### Functions

- Keep functions under 50 lines
- No deep nesting beyond 4 levels
- Name functions with a verb: `getUserById`, `formatDate`, `validateEmail`

#### Naming

- Variables describe WHAT, not HOW: `activeUsers` not `data`
- Booleans use `is/has/can/should` prefix: `isActive`, `hasPermission`
- Collections use plural nouns: `users`, `orderItems`
- Constants use SCREAMING_SNAKE: `MAX_RETRIES`, `API_BASE_URL`
- Follow language-specific casing (camelCase for JS/TS, snake_case for Python, PascalCase for Go exports)

### Git Workflow

#### Conventional Commits

Format: `<type>(<scope>): <description>`

| Type       | Purpose                    |
|------------|----------------------------|
| `feat`     | New feature                |
| `fix`      | Bug fix                    |
| `refactor` | Code restructuring         |
| `docs`     | Documentation only         |
| `test`     | Adding or fixing tests     |
| `chore`    | Maintenance, dependencies  |
| `perf`     | Performance improvement    |
| `ci`       | CI/CD changes              |

Rules:
- Imperative mood: "add feature" not "added feature"
- Under 72 characters
- Lowercase after type prefix
- No trailing period

#### Branch Naming

Format: `<type>/<ticket-id>-<description>`

```
feature/AUTH-123-add-sso-login
fix/BUG-456-null-pointer-on-logout
hotfix/SEC-101-patch-xss-vulnerability
release/v2.3.0
```

- Lowercase with hyphens (kebab-case)
- Under 50 characters after prefix
- Include ticket ID when available

#### Pull Requests

- Keep PRs under 400 lines of changes
- Include summary, changes list, and test plan
- Use draft PRs for early feedback
- Squash merge for feature PRs, merge commit for releases

### Testing

#### TDD Workflow (Red-Green-Refactor)

1. RED: Write a failing test first
2. GREEN: Write minimal code to pass the test
3. REFACTOR: Clean up while keeping tests green
4. Verify 80%+ coverage

#### Test Pyramid

- Many fast unit tests (80%+ coverage)
- Moderate integration tests (API, database)
- Few E2E tests (critical user paths via Playwright)

#### Test Organization

- Co-locate unit tests next to source: `auth.ts` / `auth.test.ts`
- Integration tests in `test/integration/`
- E2E tests in `test/e2e/`
- Use factories for dynamic test data, fixtures for static data

#### Mocking

- Mock at system boundaries only: external APIs, databases, file I/O
- Do NOT mock: pure functions, internal utilities, the code under test
- Use dependency injection for testability
- Always restore mocks in `afterEach`

### Security

#### Input Validation

- Validate all user input at system boundaries
- Use Zod (TypeScript), Pydantic (Python), or equivalent
- Prefer allowlists over denylists
- Parse, then validate: transform raw input into typed domain objects

#### SQL Injection Prevention

- Always use parameterized queries or an ORM
- Never concatenate user input into SQL strings

#### XSS Prevention

- Use framework-provided escaping (React auto-escapes by default)
- Sanitize with DOMPurify when rich HTML is needed
- Set Content Security Policy headers

#### Secret Management

- Never hardcode secrets, API keys, or passwords
- Use environment variables with `.env` files (never committed)
- Validate required secrets at startup with schema validation
- Always include `.env`, `.env.local`, `*.pem`, `*.key` in `.gitignore`

#### Additional Security

- CSRF protection with anti-CSRF tokens and SameSite cookies
- SSRF prevention with URL allowlisting
- Authorization checks on every resource access (prevent IDOR)
- Rate limiting on authentication endpoints
- Security headers via helmet or equivalent middleware
- Never log sensitive data (passwords, tokens, PII)

### Error Handling

- Always handle errors explicitly with try/catch
- Throw descriptive errors with context
- Never swallow errors silently
- Check `response.ok` on fetch calls
- Use custom error classes for domain-specific errors

```typescript
try {
  const result = await riskyOperation();
  return result;
} catch (error) {
  throw new Error(`Operation failed for user ${userId}: ${error.message}`);
}
```

### Debugging

- Follow the loop: REPRODUCE -> HYPOTHESIZE -> TEST -> ISOLATE -> FIX -> VERIFY
- Use binary search (git bisect, comment out halves) to narrow causes
- Create minimal reproductions
- Test one hypothesis at a time with targeted logging
- Fix root causes, not symptoms

### Performance

- Avoid N+1 queries: use joins, `include`, or `select_related`
- Bound all database queries with LIMIT/pagination
- Use appropriate caching: in-memory for hot paths, Redis for distributed, CDN for static
- Set proper Cache-Control headers
- Use lazy loading and code splitting for frontend

### Docker

- Use multi-stage builds to separate build from runtime
- Run as non-root user
- Order COPY instructions for optimal layer caching
- Include HEALTHCHECK directives
- Use Alpine-based images for smaller size

### Database

- Normalize to 3NF, denormalize selectively for performance
- Use snake_case for table and column names
- Add indexes for columns used in WHERE, JOIN, and ORDER BY
- Use foreign key constraints for referential integrity
- Plan for zero-downtime migrations

### Code Review

Priority order: Correctness > Security > Performance > Maintainability > Testing > Style.

- Logic handles edge cases (empty, null, zero, negative)
- Error states handled (network failures, invalid data, timeouts)
- User input validated at boundaries
- Authorization checks on every resource access
- No N+1 queries or unbounded results
- Functions focused and under 50 lines
- New code has corresponding tests

## Available Tools

### Agents

| Agent | Purpose |
|-------|---------|
| `planner` | Create implementation plans for complex features |
| `architect` | System design and architectural decisions |
| `code-reviewer` | Systematic code review with severity levels |
| `security-reviewer` | Security vulnerability analysis |
| `tdd-guide` | Test-driven development workflow |

### Commands

| Command | Purpose |
|---------|---------|
| `/review` | Run code review on current changes |
| `/tdd` | Start TDD workflow for a feature |
| `/debug` | Systematic debugging assistance |
| `/build-fix` | Resolve build errors |
| `/security-check` | Security audit of current code |
| `/refactor` | Guided refactoring |

### Skill Categories

Coding Style, Core Workflow, Testing, Debugging, Security, Code Review, Performance, TypeScript, Python, Go, Rust, Java, React/Next.js, Express/Node, FastAPI, Django, Docker, CI/CD, Database, Claude API, MCP Development, Agent Patterns, Agent Orchestration, Hooks, Memory Management.

75 skills total. Each skill is a standalone SKILL.md with trigger conditions, core patterns, anti-patterns, and a quick reference.
