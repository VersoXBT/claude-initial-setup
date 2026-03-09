# Coding Style

## Immutability

ALWAYS create new objects instead of mutating existing ones.

```javascript
// WRONG: Mutation
function updateUser(user, name) {
  user.name = name
  return user
}

// CORRECT: Immutability
function updateUser(user, name) {
  return { ...user, name }
}
```

```javascript
// WRONG: Array mutation
function addItem(list, item) {
  list.push(item)
  return list
}

// CORRECT: New array
function addItem(list, item) {
  return [...list, item]
}
```

## File Organization

Prefer many small files over few large files:

- **Target size**: 200-400 lines per file
- **Hard limit**: 800 lines maximum
- **One concern per file**: Each file should have a single, clear purpose
- **Feature-based structure**: Organize by feature/domain, not by type

```
# WRONG: Organized by type
src/
  controllers/
  models/
  services/

# CORRECT: Organized by feature
src/
  users/
    user.model.ts
    user.service.ts
    user.controller.ts
  orders/
    order.model.ts
    order.service.ts
    order.controller.ts
```

## Naming Conventions

- **Variables/functions**: `camelCase` — descriptive, no abbreviations
- **Classes/types**: `PascalCase`
- **Constants**: `SCREAMING_SNAKE_CASE`
- **Files**: `kebab-case.ts` or match the default export name
- **Booleans**: Prefix with `is`, `has`, `should`, `can`

```typescript
// WRONG
const d = new Date()
const flag = true
function proc(x) { ... }

// CORRECT
const createdAt = new Date()
const isVisible = true
function processPayment(order) { ... }
```

## Small Functions

Keep functions under 50 lines. If a function is longer, extract helpers.

```typescript
// WRONG: Large function doing too much
function processOrder(order) {
  // 80 lines of validation, calculation, formatting...
}

// CORRECT: Composed from small functions
function processOrder(order) {
  const validated = validateOrder(order)
  const calculated = calculateTotals(validated)
  return formatResponse(calculated)
}
```

## No Deep Nesting

Maximum 4 levels of indentation. Use early returns and extraction.

```typescript
// WRONG: Deep nesting
function check(user) {
  if (user) {
    if (user.role === 'admin') {
      if (user.isActive) {
        if (user.hasPermission('write')) {
          return true
        }
      }
    }
  }
  return false
}

// CORRECT: Early returns
function check(user) {
  if (!user) return false
  if (user.role !== 'admin') return false
  if (!user.isActive) return false
  return user.hasPermission('write')
}
```

## Code Quality Checklist

Before marking work complete:

- [ ] Code is readable and well-named
- [ ] Functions are small (<50 lines)
- [ ] Files are focused (<800 lines)
- [ ] No deep nesting (>4 levels)
- [ ] Proper error handling
- [ ] No `console.log` statements left in production code
- [ ] No hardcoded values — use constants or config
- [ ] Immutable patterns used throughout
