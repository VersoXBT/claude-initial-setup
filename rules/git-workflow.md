# Git Workflow

## Conventional Commits

Use the following format for all commit messages:

```
<type>: <description>

<optional body>
```

### Commit Types

| Type | Purpose |
|------|---------|
| `feat` | New feature |
| `fix` | Bug fix |
| `refactor` | Code restructuring (no behavior change) |
| `docs` | Documentation only |
| `test` | Adding or updating tests |
| `chore` | Maintenance, dependencies, tooling |
| `perf` | Performance improvement |
| `ci` | CI/CD pipeline changes |

### Examples

```
feat: add user authentication with JWT
fix: prevent race condition in payment processing
refactor: extract validation logic into shared module
test: add integration tests for order API
```

## Branch Naming

```
<type>/<short-description>

feat/user-auth
fix/payment-race-condition
refactor/validation-module
chore/update-dependencies
```

- Use lowercase and hyphens
- Keep branch names under 50 characters
- Include ticket number if applicable: `feat/PROJ-123-user-auth`

## Pull Request Process

1. **Create a feature branch** from `main` or `develop`
2. **Make focused commits** — each commit should be atomic and pass tests
3. **Write a clear PR description**:
   - Summary of changes (1-3 bullet points)
   - Test plan with checklist
   - Screenshots for UI changes
4. **Request review** from at least one team member
5. **Address feedback** with new commits (don't force-push during review)
6. **Squash merge** into the target branch

```bash
# Create feature branch
git checkout -b feat/user-auth main

# Make changes and commit
git add src/auth/
git commit -m "feat: add JWT token generation"

# Push and create PR
git push -u origin feat/user-auth
gh pr create --title "feat: add user authentication" --body "..."
```

## Merge Strategies

- **Squash merge**: Default for feature branches — keeps main history clean
- **Merge commit**: For release branches or long-lived branches
- **Rebase**: For updating feature branches with latest main (local only)

```bash
# Update feature branch with latest main
git fetch origin
git rebase origin/main

# Never rebase shared/pushed branches
```

## Pre-Push Checklist

- [ ] All tests pass locally
- [ ] No linting errors
- [ ] Commit messages follow conventional format
- [ ] Branch is up to date with target branch
- [ ] No secrets or credentials in the diff
- [ ] PR description is complete
