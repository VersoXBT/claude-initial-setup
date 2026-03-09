[![GitHub stars](https://img.shields.io/github/stars/VersoXBT/claude-initial-setup?style=flat)](https://github.com/VersoXBT/claude-initial-setup/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/VersoXBT/claude-initial-setup/blob/main/LICENSE)
[![Version](https://img.shields.io/github/v/tag/VersoXBT/claude-initial-setup?label=version)](https://github.com/VersoXBT/claude-initial-setup/releases)

# Claude Code Starter Kit

A plug-and-play Claude Code plugin with **75 skills**, **14 agents**, **15 slash commands**, **8 rules**, and **6 hooks** covering TypeScript, Python, Go, Rust, React, Next.js, FastAPI, Django, Docker, CI/CD, security, testing, and more. Includes cross-AI configuration files for Cursor, GitHub Copilot, and OpenAI Codex.

---

## Table of Contents

- [Why Use This](#why-use-this)
- [Quick Start](#quick-start)
- [What Is Included](#what-is-included)
- [Claude Code Agents](#claude-code-agents)
- [Slash Commands](#slash-commands)
- [Skills Catalog](#skills-catalog)
- [Rules](#rules)
- [Hooks](#hooks)
- [Cross-AI Compatibility](#cross-ai-compatibility)
- [Repository Structure](#repository-structure)
- [Customization](#customization)
- [Uninstall](#uninstall)
- [Contributing](#contributing)
- [License](#license)

---

## Why Use This

Most developers start Claude Code with a blank slate -- no skills, no agents, no coding standards. This plugin gives you a production-ready foundation in under 60 seconds.

- **75 curated skills** across 25 categories so Claude Code knows your stack's best practices out of the box
- **14 specialized agents** for code review, security audits, TDD, debugging, architecture, and more -- ready to spawn as subagents
- **15 slash commands** that map to the workflows developers actually use: `/review`, `/tdd`, `/debug`, `/security-check`, `/plan`
- **8 rules** that enforce coding standards (immutability, conventional commits, 80%+ test coverage) without manual configuration
- **6 hooks** for automatic formatting, security checks, and lint reminders on every tool event
- **Cross-AI support** -- the same best practices are exported to Cursor, GitHub Copilot, and OpenAI Codex configuration formats

Whether you write TypeScript, Python, Go, Rust, or Java, this starter kit gets Claude Code productive immediately.

---

## Quick Start

### Install as a Claude Code Plugin

```
/plugin marketplace add VersoXBT/claude-initial-setup
/plugin install claude-initial-setup@claude-initial-setup
```

### Install Manually

```bash
git clone https://github.com/VersoXBT/claude-initial-setup.git
cd claude-initial-setup
chmod +x install.sh
./install.sh
```

The install script symlinks all 75 skills into `~/.claude/skills/`.

### Install a Single Skill

```bash
mkdir -p ~/.claude/skills
ln -sfn /path/to/claude-initial-setup/skills/typescript/strict-typescript ~/.claude/skills/strict-typescript
```

---

## What Is Included

| Component | Count | Description |
|-----------|-------|-------------|
| Skills | 75 | SKILL.md files across 25 categories |
| Agents | 14 | Specialized subagents for delegated tasks |
| Commands | 15 | Slash commands for common workflows |
| Rules | 8 | Coding standards and guidelines |
| Hooks | 6 | Automation triggers for tool events |

---

## Claude Code Agents

Agents are specialized subagents you can spawn for delegated tasks. Each agent has a defined role, toolset, and process.

| Agent | Purpose |
|-------|---------|
| `planner` | Implementation planning for complex features |
| `architect` | System design and architectural decisions |
| `code-reviewer` | Code quality, security, maintainability review |
| `security-reviewer` | OWASP vulnerabilities, secrets, injection detection |
| `tdd-guide` | Test-driven development, 80%+ coverage enforcement |
| `debugger` | Systematic debugging with hypothesis testing |
| `build-error-resolver` | Fix build/type errors with minimal diffs |
| `refactor-cleaner` | Dead code cleanup and consolidation |
| `doc-updater` | Documentation and README updates |
| `performance-optimizer` | Profiling, caching, optimization |
| `database-reviewer` | Schema design, query optimization, migration review |
| `api-designer` | REST/GraphQL API design and review |
| `devops-engineer` | Docker, CI/CD, infrastructure |
| `e2e-runner` | Playwright end-to-end testing |

---

## Slash Commands

Slash commands for common development workflows.

| Command | Description |
|---------|-------------|
| `/review` | Run code review on recent changes |
| `/tdd` | Start TDD workflow (red-green-refactor) |
| `/debug` | Systematic debugging process |
| `/build-fix` | Incrementally fix build errors |
| `/security-check` | OWASP security audit |
| `/refactor` | Dead code cleanup and refactoring |
| `/test-coverage` | Analyze and improve test coverage |
| `/optimize` | Profile and optimize performance |
| `/plan` | Create implementation plan |
| `/deploy-check` | Pre-deployment verification |
| `/api-review` | Review API design |
| `/db-review` | Review database schema/queries |
| `/update-docs` | Update documentation |
| `/lint-fix` | Auto-fix lint and format issues |
| `/checkpoint` | Git commit checkpoint |

---

## Skills Catalog

75 skills organized into 25 categories. Click any category to expand.

<details>
<summary><strong>Core Workflow</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `commit-conventions` | Conventional commits format, types, scopes, breaking changes |
| `branching-strategy` | Git Flow vs trunk-based, branch naming, merge vs rebase |
| `pr-workflow` | PR templates, review process, CI gates, merge strategies |

</details>

<details>
<summary><strong>Coding Style</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `immutability-patterns` | Spread operators, Object.freeze, structuredClone, immer |
| `file-organization` | Feature-based vs type-based, barrel exports, colocation |
| `naming-conventions` | Variables, functions, classes, files, database columns |

</details>

<details>
<summary><strong>Debugging</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `systematic-debugging` | Binary search debugging, hypothesis testing, bisect |
| `log-analysis` | Structured logging, log levels, correlation IDs |
| `error-tracing` | Stack trace reading, source maps, error boundaries |

</details>

<details>
<summary><strong>TypeScript</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `strict-typescript` | strictNullChecks, noUncheckedIndexedAccess, type narrowing |
| `type-patterns` | Discriminated unions, branded types, template literal types |
| `generics-mastery` | Generic constraints, conditional types, mapped types, infer |

</details>

<details>
<summary><strong>Go</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `idiomatic-go` | Error handling, interfaces, struct embedding, package organization |
| `error-handling-go` | Custom error types, error wrapping, sentinel errors, errors.Is/As |
| `concurrency-patterns-go` | Goroutines, channels, WaitGroup, context, worker pools |

</details>

<details>
<summary><strong>Rust</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `ownership-borrowing` | Ownership rules, borrowing, lifetimes, Box/Rc/Arc |
| `error-handling-rust` | Result/Option, ? operator, thiserror, anyhow |
| `cargo-workflows` | Workspaces, feature flags, build.rs, clippy/fmt |

</details>

<details>
<summary><strong>Python</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `pythonic-patterns` | Comprehensions, generators, context managers, decorators |
| `type-hints-guide` | Protocol, TypeVar, ParamSpec, Generic, Literal |
| `project-structure-python` | pyproject.toml, src layout, uv/rye/poetry, virtual environments |

</details>

<details>
<summary><strong>FastAPI</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `async-fastapi` | Async endpoints, background tasks, middleware, WebSockets |
| `pydantic-validation` | BaseModel, field/model validators, computed fields |
| `dependency-injection-fastapi` | Depends(), security deps, database sessions |

</details>

<details>
<summary><strong>Django</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `django-orm-mastery` | QuerySets, select/prefetch_related, F/Q objects, annotations |
| `drf-api-patterns` | Serializers, ViewSets, permissions, pagination, filtering |
| `django-admin-customization` | ModelAdmin, inlines, custom actions, list filters |

</details>

<details>
<summary><strong>React and Next.js</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `component-patterns` | Compound components, render props, HOCs, composition |
| `hooks-mastery` | Custom hooks, useCallback, useMemo, useRef, useReducer |
| `nextjs-app-router` | Server components, route handlers, middleware, streaming |

</details>

<details>
<summary><strong>Express and Node.js</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `middleware-patterns` | Middleware chain, auth, rate limiting, CORS, validation |
| `express-error-handling` | Async errors, custom error classes, centralized middleware |
| `rest-api-node` | RESTful conventions, pagination, filtering, versioning |

</details>

<details>
<summary><strong>Java</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `spring-boot-patterns` | Annotations, dependency injection, profiles, actuator |
| `maven-gradle-guide` | pom.xml, build.gradle.kts, multi-module, dependency management |
| `junit-testing` | JUnit 5, Mockito, MockMvc, Testcontainers |

</details>

<details>
<summary><strong>Docker</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `dockerfile-best-practices` | Multi-stage builds, layer caching, non-root users |
| `docker-compose-guide` | Services, networks, volumes, health checks, profiles |
| `multi-stage-builds` | Builder pattern, distroless images, cache mounts |

</details>

<details>
<summary><strong>CI/CD</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `github-actions-guide` | Workflow syntax, reusable workflows, matrix strategies |
| `pipeline-patterns` | Pipeline design, artifact management, environment promotion |
| `deploy-strategies` | Blue-green, canary, rolling updates, feature flags |

</details>

<details>
<summary><strong>Database</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `schema-design-guide` | Normalization, indexing strategy, constraints, naming |
| `query-optimization` | EXPLAIN ANALYZE, index tuning, N+1 detection |
| `migration-patterns` | Zero-downtime migrations, data migrations, rollbacks |

</details>

<details>
<summary><strong>Security</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `owasp-top-10-prevention` | SQL injection, XSS, CSRF, SSRF, broken auth |
| `secret-management` | Environment variables, vault patterns, secret rotation |
| `input-validation-guide` | Zod, Pydantic, allowlists, sanitization |

</details>

<details>
<summary><strong>Code Review</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `review-checklist` | What to check, severity levels, constructive feedback |
| `automated-review-setup` | ESLint, Prettier, husky/lint-staged, CODEOWNERS |
| `pr-standards` | PR size limits, description templates, review SLAs |

</details>

<details>
<summary><strong>Performance</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `profiling-guide` | Chrome DevTools, cProfile, pprof, flame graphs |
| `caching-strategies` | Redis, CDN, browser cache, stale-while-revalidate |
| `lazy-loading-patterns` | Code splitting, dynamic imports, React.lazy, Suspense |

</details>

<details>
<summary><strong>Claude API</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `anthropic-sdk-guide` | Python/TS SDK, messages API, streaming, prompt caching |
| `prompt-engineering` | System prompts, few-shot, chain-of-thought, structured output |
| `tool-use-patterns` | Tool schemas, multi-tool orchestration, parallel tool use |

</details>

<details>
<summary><strong>MCP Development</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `mcp-server-creation` | Server scaffolding, transport, lifecycle hooks, testing |
| `mcp-tool-design` | Naming, input schemas, error responses, pagination |
| `mcp-resource-patterns` | Resource URIs, templates, subscriptions, dynamic resources |

</details>

<details>
<summary><strong>Agent Patterns</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `multi-agent-orchestration` | Orchestrator, pipeline, consensus, delegation patterns |
| `context-management` | Context window optimization, summarization, RAG, pruning |
| `agent-communication` | Message passing, shared state, event-driven, pub/sub |

</details>

<details>
<summary><strong>Hooks</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `pre-post-hooks` | PreToolUse, PostToolUse, Stop hooks, matcher patterns |
| `automation-triggers` | Auto-format, auto-lint, auto-test, file-change reactions |
| `hook-recipes` | Ready-to-use recipes: prettier, tsc, secret leak prevention |

</details>

<details>
<summary><strong>Agent Orchestration</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `subagent-patterns` | When to use subagents, types, result handling |
| `parallel-task-execution` | Fan-out/fan-in, parallel tool calls, background agents |
| `task-coordination` | Task dependencies, owner assignment, status tracking |

</details>

<details>
<summary><strong>Memory Management</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `memory-patterns` | MEMORY.md structure, topic files, save vs skip decisions |
| `context-optimization` | Token budgeting, progressive disclosure, subagent firewalls |
| `knowledge-persistence` | Learning from corrections, pattern extraction |

</details>

<details>
<summary><strong>Testing</strong> (3 skills)</summary>

| Skill | Description |
|-------|-------------|
| `tdd-workflow` | Red-green-refactor, test-first, 80%+ coverage targets |
| `test-architecture` | Test organization, fixtures, factories, isolation |
| `mocking-strategies` | Mocks vs stubs vs spies, DI for testing, when NOT to mock |

</details>

---

## Rules

Rules enforce coding standards across your entire project. They are loaded automatically by Claude Code.

| Rule | Content |
|------|---------|
| `coding-style` | Immutability, file organization, naming, small functions |
| `git-workflow` | Conventional commits, branch naming, PR process |
| `testing` | TDD, 80% coverage, test types, isolation |
| `security` | Secrets, input validation, injection prevention |
| `performance` | Profile first, caching, lazy loading |
| `api-design` | REST conventions, error format, pagination |
| `database` | Normalization, indexing, migrations, N+1 prevention |
| `agents` | Agent orchestration, when to use which agent |

---

## Hooks

Automation triggers that run on Claude Code tool events. All hooks are non-blocking (warnings only) since this is a starter kit. Edit `hooks/hooks.json` to customize behavior.

- Tmux reminder for long-running commands
- Review reminder before git push
- Package install security check
- Prettier reminder after JS/TS edits
- Console.log warning on edited files
- TypeScript check reminder

---

## Cross-AI Compatibility

This plugin includes configuration files for other AI coding assistants, so the same best practices apply regardless of which tool you use.

| File | AI Tool | Description |
|------|---------|-------------|
| `AGENTS.md` | OpenAI Codex | Development conventions and agent context |
| `.github/copilot-instructions.md` | GitHub Copilot | Short instruction statements |
| `.cursor/rules/claude-initial-setup.mdc` | Cursor (modern) | MDC rules with metadata |
| `.cursorrules` | Cursor (legacy) | Plain markdown rules |

---

## Repository Structure

```
claude-initial-setup/
  .claude-plugin/
    plugin.json              # Plugin manifest
    marketplace.json         # Marketplace metadata
  agents/                    # 14 specialized subagents
  commands/                  # 15 slash commands
  hooks/
    hooks.json               # Automation triggers
  rules/                     # 8 coding standards
  skills/                    # 75 skills across 25 categories
    <category>/
      <skill-name>/
        SKILL.md
  .github/
    copilot-instructions.md  # GitHub Copilot
  .cursor/
    rules/
      claude-initial-setup.mdc  # Cursor
  AGENTS.md                  # OpenAI Codex
  .cursorrules               # Cursor (legacy)
  install.sh                 # Symlink installer
  uninstall.sh               # Symlink remover
```

---

## Customization

### Modifying Skills

Edit any `SKILL.md` directly. Changes take effect in the next Claude Code session.

### Adding Reference Files

For skills that need deeper content, add a `references/` subdirectory:

```
skills/typescript/strict-typescript/
  SKILL.md
  references/
    compiler-options.md
    migration-guide.md
```

### Creating New Skills

1. Create a directory under the appropriate category in `skills/`
2. Add a `SKILL.md` with YAML frontmatter (`name` and `description` are required fields)
3. Run `./install.sh` to symlink the new skill into `~/.claude/skills/`

### Disabling a Skill

Remove its symlink without deleting the source file:

```bash
rm ~/.claude/skills/<skill-name>
```

---

## Uninstall

Remove all symlinked skills:

```bash
./uninstall.sh
```

Or remove individual skills:

```bash
rm ~/.claude/skills/<skill-name>
```

---

## Contributing

Contributions are welcome. To add a new skill, agent, or command:

1. Fork the repository
2. Create a feature branch (`git checkout -b feat/new-skill-name`)
3. Add your files following the existing directory structure
4. Ensure any new `SKILL.md` has valid YAML frontmatter with `name` and `description`
5. Test by running `./install.sh` and verifying the skill loads in Claude Code
6. Open a pull request with a clear description of what the skill covers and why it is useful

For bug reports or feature requests, open an issue on the [GitHub Issues](https://github.com/VersoXBT/claude-initial-setup/issues) page.

---

## License

[MIT](https://github.com/VersoXBT/claude-initial-setup/blob/main/LICENSE)
