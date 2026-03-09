# Testing Requirements

## Minimum Coverage: 80%

All projects must maintain at least 80% test coverage across statements, branches, and functions.

## Test Types

### Unit Tests

Test individual functions, utilities, and components in isolation.

```typescript
describe('calculateDiscount', () => {
  it('applies percentage discount correctly', () => {
    const result = calculateDiscount(100, { type: 'percent', value: 20 })
    expect(result).toBe(80)
  })

  it('returns original price for zero discount', () => {
    const result = calculateDiscount(100, { type: 'percent', value: 0 })
    expect(result).toBe(100)
  })

  it('throws for negative prices', () => {
    expect(() => calculateDiscount(-10, { type: 'percent', value: 20 }))
      .toThrow('Price must be non-negative')
  })
})
```

### Integration Tests

Test interactions between modules, API endpoints, and database operations.

```typescript
describe('POST /api/users', () => {
  it('creates a user and returns 201', async () => {
    const response = await request(app)
      .post('/api/users')
      .send({ email: 'test@example.com', name: 'Test User' })

    expect(response.status).toBe(201)
    expect(response.body.data.email).toBe('test@example.com')
  })

  it('returns 400 for invalid email', async () => {
    const response = await request(app)
      .post('/api/users')
      .send({ email: 'not-an-email', name: 'Test' })

    expect(response.status).toBe(400)
    expect(response.body.error).toContain('email')
  })
})
```

### E2E Tests

Test critical user flows end-to-end with Playwright or Cypress.

```typescript
test('user can sign up and access dashboard', async ({ page }) => {
  await page.goto('/signup')
  await page.fill('[name="email"]', 'new@example.com')
  await page.fill('[name="password"]', 'SecurePass123!')
  await page.click('button[type="submit"]')

  await expect(page).toHaveURL('/dashboard')
  await expect(page.locator('h1')).toContainText('Welcome')
})
```

## Test-Driven Development (TDD)

Follow the Red-Green-Refactor cycle:

1. **RED** — Write a failing test that describes the desired behavior
2. **GREEN** — Write the minimum code to make the test pass
3. **REFACTOR** — Clean up the implementation while keeping tests green

```
Write test → Run (FAIL) → Implement → Run (PASS) → Refactor → Run (PASS)
```

## Test Isolation

- Each test must be independent — no shared mutable state
- Use `beforeEach` / `afterEach` for setup and teardown
- Mock external dependencies (APIs, databases, file system)
- Tests should pass in any order and run in parallel

```typescript
// WRONG: Shared mutable state
let counter = 0
test('first', () => { counter++; expect(counter).toBe(1) })
test('second', () => { counter++; expect(counter).toBe(2) }) // Fragile!

// CORRECT: Isolated state
test('first', () => { const counter = 0; expect(counter + 1).toBe(1) })
test('second', () => { const counter = 0; expect(counter + 1).toBe(1) })
```

## Troubleshooting Failures

1. Check test isolation — is state leaking between tests?
2. Verify mocks match the real interface
3. Fix the implementation, not the test (unless the test is wrong)
4. Run the failing test in isolation to confirm
