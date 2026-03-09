# claude-initial-setup

A curated collection of 75 Claude Code skills across 25 categories. Each skill is a standalone SKILL.md file that teaches Claude specific patterns, conventions, and best practices for your development workflow.

## Quick Start

```bash
git clone https://github.com/VersoXBT/claude-initial-setup.git
cd claude-initial-setup
chmod +x install.sh
./install.sh
```

The install script symlinks all skills into `~/.claude/skills/`, making them immediately available in Claude Code.

### Manual Installation

To install specific skills only, symlink individual skill directories:

```bash
mkdir -p ~/.claude/skills
ln -sfn /path/to/claude-initial-setup/skills/typescript/strict-typescript ~/.claude/skills/strict-typescript
```

## Categories and Skills

### Core Workflow

| Skill | Description |
|-------|-------------|
| `commit-conventions` | Conventional commits format, types, scopes, breaking changes |
| `branching-strategy` | Git Flow vs trunk-based, branch naming, merge vs rebase |
| `pr-workflow` | PR templates, review process, CI gates, merge strategies |

### Coding Style

| Skill | Description |
|-------|-------------|
| `immutability-patterns` | Spread operators, Object.freeze, structuredClone, immer |
| `file-organization` | Feature-based vs type-based, barrel exports, colocation |
| `naming-conventions` | Variables, functions, classes, files, database columns |

### Debugging

| Skill | Description |
|-------|-------------|
| `systematic-debugging` | Binary search debugging, hypothesis testing, bisect |
| `log-analysis` | Structured logging, log levels, correlation IDs |
| `error-tracing` | Stack trace reading, source maps, error boundaries |

### TypeScript

| Skill | Description |
|-------|-------------|
| `strict-typescript` | strictNullChecks, noUncheckedIndexedAccess, type narrowing |
| `type-patterns` | Discriminated unions, branded types, template literal types |
| `generics-mastery` | Generic constraints, conditional types, mapped types, infer |

### Go

| Skill | Description |
|-------|-------------|
| `idiomatic-go` | Error handling, interfaces, struct embedding, package organization |
| `error-handling-go` | Custom error types, error wrapping, sentinel errors, errors.Is/As |
| `concurrency-patterns-go` | Goroutines, channels, WaitGroup, context, worker pools |

### Rust

| Skill | Description |
|-------|-------------|
| `ownership-borrowing` | Ownership rules, borrowing, lifetimes, Box/Rc/Arc |
| `error-handling-rust` | Result/Option, ? operator, thiserror, anyhow |
| `cargo-workflows` | Workspaces, feature flags, build.rs, clippy/fmt |

### Python

| Skill | Description |
|-------|-------------|
| `pythonic-patterns` | Comprehensions, generators, context managers, decorators |
| `type-hints-guide` | Protocol, TypeVar, ParamSpec, Generic, Literal |
| `project-structure-python` | pyproject.toml, src layout, uv/rye/poetry, virtual environments |

### FastAPI

| Skill | Description |
|-------|-------------|
| `async-fastapi` | Async endpoints, background tasks, middleware, WebSockets |
| `pydantic-validation` | BaseModel, field/model validators, computed fields |
| `dependency-injection-fastapi` | Depends(), security deps, database sessions |

### Django

| Skill | Description |
|-------|-------------|
| `django-orm-mastery` | QuerySets, select/prefetch_related, F/Q objects, annotations |
| `drf-api-patterns` | Serializers, ViewSets, permissions, pagination, filtering |
| `django-admin-customization` | ModelAdmin, inlines, custom actions, list filters |

### React and Next.js

| Skill | Description |
|-------|-------------|
| `component-patterns` | Compound components, render props, HOCs, composition |
| `hooks-mastery` | Custom hooks, useCallback, useMemo, useRef, useReducer |
| `nextjs-app-router` | Server components, route handlers, middleware, streaming |

### Express and Node.js

| Skill | Description |
|-------|-------------|
| `middleware-patterns` | Middleware chain, auth, rate limiting, CORS, validation |
| `express-error-handling` | Async errors, custom error classes, centralized middleware |
| `rest-api-node` | RESTful conventions, pagination, filtering, versioning |

### Java

| Skill | Description |
|-------|-------------|
| `spring-boot-patterns` | Annotations, dependency injection, profiles, actuator |
| `maven-gradle-guide` | pom.xml, build.gradle.kts, multi-module, dependency management |
| `junit-testing` | JUnit 5, Mockito, MockMvc, Testcontainers |

### Docker

| Skill | Description |
|-------|-------------|
| `dockerfile-best-practices` | Multi-stage builds, layer caching, non-root users |
| `docker-compose-guide` | Services, networks, volumes, health checks, profiles |
| `multi-stage-builds` | Builder pattern, distroless images, cache mounts |

### CI/CD

| Skill | Description |
|-------|-------------|
| `github-actions-guide` | Workflow syntax, reusable workflows, matrix strategies |
| `pipeline-patterns` | Pipeline design, artifact management, environment promotion |
| `deploy-strategies` | Blue-green, canary, rolling updates, feature flags |

### Database

| Skill | Description |
|-------|-------------|
| `schema-design-guide` | Normalization, indexing strategy, constraints, naming |
| `query-optimization` | EXPLAIN ANALYZE, index tuning, N+1 detection |
| `migration-patterns` | Zero-downtime migrations, data migrations, rollbacks |

### Security

| Skill | Description |
|-------|-------------|
| `owasp-top-10-prevention` | SQL injection, XSS, CSRF, SSRF, broken auth |
| `secret-management` | Environment variables, vault patterns, secret rotation |
| `input-validation-guide` | Zod, Pydantic, allowlists, sanitization |

### Code Review

| Skill | Description |
|-------|-------------|
| `review-checklist` | What to check, severity levels, constructive feedback |
| `automated-review-setup` | ESLint, Prettier, husky/lint-staged, CODEOWNERS |
| `pr-standards` | PR size limits, description templates, review SLAs |

### Performance

| Skill | Description |
|-------|-------------|
| `profiling-guide` | Chrome DevTools, cProfile, pprof, flame graphs |
| `caching-strategies` | Redis, CDN, browser cache, stale-while-revalidate |
| `lazy-loading-patterns` | Code splitting, dynamic imports, React.lazy, Suspense |

### Claude API

| Skill | Description |
|-------|-------------|
| `anthropic-sdk-guide` | Python/TS SDK, messages API, streaming, prompt caching |
| `prompt-engineering` | System prompts, few-shot, chain-of-thought, structured output |
| `tool-use-patterns` | Tool schemas, multi-tool orchestration, parallel tool use |

### MCP Development

| Skill | Description |
|-------|-------------|
| `mcp-server-creation` | Server scaffolding, transport, lifecycle hooks, testing |
| `mcp-tool-design` | Naming, input schemas, error responses, pagination |
| `mcp-resource-patterns` | Resource URIs, templates, subscriptions, dynamic resources |

### Agent Patterns

| Skill | Description |
|-------|-------------|
| `multi-agent-orchestration` | Orchestrator, pipeline, consensus, delegation patterns |
| `context-management` | Context window optimization, summarization, RAG, pruning |
| `agent-communication` | Message passing, shared state, event-driven, pub/sub |

### Hooks

| Skill | Description |
|-------|-------------|
| `pre-post-hooks` | PreToolUse, PostToolUse, Stop hooks, matcher patterns |
| `automation-triggers` | Auto-format, auto-lint, auto-test, file-change reactions |
| `hook-recipes` | Ready-to-use recipes: prettier, tsc, secret leak prevention |

### Agent Orchestration

| Skill | Description |
|-------|-------------|
| `subagent-patterns` | When to use subagents, types, result handling |
| `parallel-task-execution` | Fan-out/fan-in, parallel tool calls, background agents |
| `task-coordination` | Task dependencies, owner assignment, status tracking |

### Memory Management

| Skill | Description |
|-------|-------------|
| `memory-patterns` | MEMORY.md structure, topic files, save vs skip decisions |
| `context-optimization` | Token budgeting, progressive disclosure, subagent firewalls |
| `knowledge-persistence` | Learning from corrections, pattern extraction |

### Testing

| Skill | Description |
|-------|-------------|
| `tdd-workflow` | Red-green-refactor, test-first, 80%+ coverage targets |
| `test-architecture` | Test organization, fixtures, factories, isolation |
| `mocking-strategies` | Mocks vs stubs vs spies, DI for testing, when NOT to mock |

## Skill Structure

Each skill follows a consistent format:

```
skills/<category>/<skill-name>/
  SKILL.md
```

Every SKILL.md contains:

- **YAML frontmatter** with `name` and `description` (controls when Claude triggers the skill)
- **When to Use** section listing trigger contexts
- **Core Patterns** with working code examples
- **Anti-Patterns** showing what to avoid
- **Quick Reference** cheat sheet

## Customization

### Modifying a Skill

Edit any SKILL.md directly. Changes take effect in the next Claude Code session.

### Adding Reference Files

For skills that need deeper content, add a `references/` subdirectory:

```
skills/typescript/strict-typescript/
  SKILL.md
  references/
    compiler-options.md
    migration-guide.md
```

Reference SKILL.md to point to these files when needed.

### Creating New Skills

1. Create a directory under the appropriate category
2. Add a SKILL.md with YAML frontmatter (`name` and `description` are required)
3. Run `./install.sh` to symlink the new skill

## Uninstall

To remove all symlinked skills:

```bash
./uninstall.sh
```

Or remove individual skills:

```bash
rm ~/.claude/skills/<skill-name>
```

## License

MIT
