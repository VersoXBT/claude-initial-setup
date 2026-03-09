# Agent Orchestration

## Available Agents

| Agent | Purpose | When to Use |
|-------|---------|-------------|
| **planner** | Implementation planning | Complex features, multi-file changes, refactoring |
| **architect** | System design | Architectural decisions, tech stack selection |
| **code-reviewer** | Code quality review | After writing or modifying code |
| **security-reviewer** | Security analysis | Before commits, after auth changes |
| **tdd-guide** | Test-driven development | New features, bug fixes |
| **debugger** | Bug investigation | Tracking down root causes |
| **build-error-resolver** | Fix build failures | When builds or CI fail |
| **refactor-cleaner** | Dead code cleanup | Code maintenance, tech debt |
| **doc-updater** | Documentation updates | After API changes, new features |
| **performance-optimizer** | Performance analysis | When profiling shows bottlenecks |
| **database-reviewer** | Database review | Schema changes, query optimization |
| **api-designer** | API design | New endpoints, API restructuring |
| **devops-engineer** | Infrastructure & CI/CD | Deployment, containerization, pipelines |

## When to Use Agents Immediately

No user prompt needed for these scenarios:

1. **Complex feature request** — Use **planner** to break it down first
2. **Code just written** — Use **code-reviewer** for immediate feedback
3. **Bug fix or new feature** — Use **tdd-guide** for test-first approach
4. **Architectural decision** — Use **architect** for design evaluation
5. **Build failure** — Use **build-error-resolver** to diagnose and fix
6. **Security-sensitive change** — Use **security-reviewer** before committing

## Parallel Execution

ALWAYS run independent agents in parallel. This saves significant time.

```
# CORRECT: Parallel (independent tasks)
Launch simultaneously:
  1. security-reviewer → analyze auth module
  2. code-reviewer → review new utility functions
  3. tdd-guide → write tests for payment service

# WRONG: Sequential when tasks are independent
First security-reviewer, wait...
Then code-reviewer, wait...
Then tdd-guide, wait...
```

## Agent Orchestration Patterns

### Pipeline Pattern

Chain agents when each step depends on the previous:

```
planner → tdd-guide → code-reviewer → security-reviewer
  plan  →   build   →    review    →     audit
```

### Fan-Out Pattern

Use multiple agents to analyze the same code from different angles:

```
                ┌─ code-reviewer ──────┐
code change ──> ├─ security-reviewer ──├─> merge findings
                └─ performance-opt ────┘
```

### Split-Role Analysis

For complex problems, get diverse perspectives:

```
Problem ──> Agent 1: "As a security expert, review..."
        ──> Agent 2: "As a performance engineer, review..."
        ──> Agent 3: "As a maintainability advocate, review..."
```

## Best Practices

- Use the **right agent** for the task — don't force a general agent into a specialist role
- Run **independent agents in parallel** to save time
- For complex tasks, **plan first** with the planner agent
- Always run **security-reviewer** before committing auth or data changes
- Use **tdd-guide** proactively, not just when told to write tests
