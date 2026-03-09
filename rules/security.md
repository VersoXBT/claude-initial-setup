# Security Guidelines

## No Hardcoded Secrets

Never commit API keys, passwords, tokens, or connection strings.

```typescript
// WRONG: Hardcoded secret
const apiKey = 'sk-proj-abc123xyz'

// CORRECT: Environment variable
const apiKey = process.env.API_KEY
if (!apiKey) {
  throw new Error('API_KEY environment variable is required')
}
```

Use `.env` files for local development and add them to `.gitignore`:

```
# .gitignore
.env
.env.local
.env.*.local
```

## Input Validation

ALWAYS validate and sanitize user input at system boundaries.

```typescript
import { z } from 'zod'

const CreateUserSchema = z.object({
  email: z.string().email().max(255),
  name: z.string().min(1).max(100).trim(),
  age: z.number().int().min(0).max(150).optional(),
})

function createUser(input: unknown) {
  const validated = CreateUserSchema.parse(input)
  return userRepository.create(validated)
}
```

## SQL Injection Prevention

ALWAYS use parameterized queries. Never interpolate user input into SQL.

```typescript
// WRONG: SQL injection vulnerability
const query = `SELECT * FROM users WHERE id = '${userId}'`

// CORRECT: Parameterized query
const query = 'SELECT * FROM users WHERE id = $1'
const result = await db.query(query, [userId])
```

## XSS Prevention

Sanitize all user-generated content before rendering in HTML.

```typescript
// WRONG: Direct HTML injection
element.innerHTML = userInput

// CORRECT: Use text content or sanitize
element.textContent = userInput

// Or use a sanitization library
import DOMPurify from 'dompurify'
element.innerHTML = DOMPurify.sanitize(userInput)
```

## CSRF Protection

- Use CSRF tokens for state-changing requests
- Set `SameSite` attribute on cookies
- Validate the `Origin` header on the server

```typescript
// Express CSRF middleware
import csrf from 'csurf'
app.use(csrf({ cookie: { sameSite: 'strict', httpOnly: true } }))
```

## Rate Limiting

Apply rate limiting to all public endpoints.

```typescript
import rateLimit from 'express-rate-limit'

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // limit each IP to 100 requests per window
  standardHeaders: true,
  legacyHeaders: false,
})

app.use('/api/', limiter)
```

## Authentication and Authorization

- Hash passwords with bcrypt (cost factor >= 12)
- Use short-lived JWTs (15 min) with refresh tokens
- Check authorization on every protected route
- Never expose sensitive data in error messages

```typescript
// WRONG: Leaks information
throw new Error(`User ${email} not found in database`)

// CORRECT: Generic message
throw new Error('Invalid credentials')
```

## Pre-Commit Security Checklist

- [ ] No hardcoded secrets in code or config
- [ ] All user inputs validated and sanitized
- [ ] Parameterized queries for all database access
- [ ] XSS prevention on all rendered content
- [ ] CSRF tokens on state-changing endpoints
- [ ] Rate limiting on public endpoints
- [ ] Error messages do not leak internal details
