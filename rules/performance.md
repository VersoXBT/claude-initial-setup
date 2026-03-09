# Performance Optimization

## Profile Before Optimizing

Never guess where bottlenecks are. Measure first, optimize second.

```typescript
// Use built-in profiling
console.time('operation')
const result = await heavyOperation()
console.timeEnd('operation')

// Node.js: Use --prof flag
// node --prof app.js
// node --prof-process isolate-*.log

// Browser: Use Performance API
performance.mark('start')
await operation()
performance.mark('end')
performance.measure('operation', 'start', 'end')
```

## Avoid Premature Optimization

- Write clear, correct code first
- Optimize only when profiling reveals a bottleneck
- Document why an optimization exists if it reduces readability

```typescript
// WRONG: Premature micro-optimization that hurts readability
const len = arr.length
for (let i = 0; i < len; i++) { /* ... */ }

// CORRECT: Clear code, optimize later if profiling shows need
for (const item of arr) { /* ... */ }
```

## Caching Strategies

### In-Memory Cache

```typescript
const cache = new Map<string, { data: unknown; expiresAt: number }>()

function getCached<T>(key: string, ttlMs: number, fetcher: () => Promise<T>): Promise<T> {
  const cached = cache.get(key)
  if (cached && cached.expiresAt > Date.now()) {
    return Promise.resolve(cached.data as T)
  }

  return fetcher().then(data => {
    cache.set(key, { data, expiresAt: Date.now() + ttlMs })
    return data
  })
}
```

### HTTP Caching

```typescript
// Set appropriate cache headers
app.get('/api/products', (req, res) => {
  res.set('Cache-Control', 'public, max-age=300') // 5 minutes
  res.json(products)
})

// Use ETags for conditional requests
app.use(compression())
app.set('etag', 'strong')
```

## Lazy Loading

Load resources only when needed.

```typescript
// Dynamic imports for code splitting
const AdminPanel = lazy(() => import('./AdminPanel'))

// Intersection Observer for images
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const img = entry.target as HTMLImageElement
      img.src = img.dataset.src!
      observer.unobserve(img)
    }
  })
})
```

## Database Performance

- Add indexes on columns used in WHERE, JOIN, and ORDER BY
- Use `EXPLAIN ANALYZE` to understand query plans
- Batch operations instead of N+1 queries
- Use pagination for large result sets

```typescript
// WRONG: N+1 query problem
const users = await db.query('SELECT * FROM users')
for (const user of users) {
  user.orders = await db.query('SELECT * FROM orders WHERE user_id = $1', [user.id])
}

// CORRECT: Single query with JOIN or batch
const usersWithOrders = await db.query(`
  SELECT u.*, json_agg(o.*) as orders
  FROM users u
  LEFT JOIN orders o ON o.user_id = u.id
  GROUP BY u.id
`)
```

## Network Optimization

- Compress responses with gzip/brotli
- Use connection pooling for database connections
- Implement request batching where appropriate
- Set appropriate timeouts on all external calls

```typescript
// Connection pooling
import { Pool } from 'pg'
const pool = new Pool({
  max: 20,
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 2000,
})
```
