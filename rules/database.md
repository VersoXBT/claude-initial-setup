# Database Best Practices

## Normalization

Normalize to Third Normal Form (3NF) by default. Denormalize only when profiling proves a performance need.

```sql
-- WRONG: Denormalized with redundant data
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT,
  user_name VARCHAR(100),    -- Redundant! Already in users table
  user_email VARCHAR(255),   -- Redundant!
  product_name VARCHAR(100), -- Redundant! Already in products table
  total DECIMAL(10, 2)
);

-- CORRECT: Normalized
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
  total DECIMAL(10, 2),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE order_items (
  id SERIAL PRIMARY KEY,
  order_id INT REFERENCES orders(id),
  product_id INT REFERENCES products(id),
  quantity INT NOT NULL CHECK (quantity > 0),
  unit_price DECIMAL(10, 2) NOT NULL
);
```

## Indexing

Index columns used in WHERE, JOIN, ORDER BY, and foreign keys.

```sql
-- Index foreign keys
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);

-- Composite index for common query patterns
CREATE INDEX idx_orders_user_status ON orders(user_id, status);

-- Partial index for specific conditions
CREATE INDEX idx_active_users ON users(email) WHERE is_active = true;
```

Use `EXPLAIN ANALYZE` to verify indexes are being used:

```sql
EXPLAIN ANALYZE SELECT * FROM orders WHERE user_id = 42 AND status = 'pending';
```

## Migrations

ALWAYS use migrations for schema changes. Never modify the database manually.

```typescript
// Migration: 20240315_create_users.ts
export async function up(db: Knex): Promise<void> {
  await db.schema.createTable('users', (table) => {
    table.increments('id').primary()
    table.string('email', 255).notNullable().unique()
    table.string('name', 100).notNullable()
    table.string('password_hash', 255).notNullable()
    table.boolean('is_active').defaultTo(true)
    table.timestamps(true, true)
  })
}

export async function down(db: Knex): Promise<void> {
  await db.schema.dropTable('users')
}
```

### Migration Rules

- Migrations are immutable once deployed — never edit a deployed migration
- Each migration should be reversible (implement `down`)
- Name migrations with timestamps: `20240315120000_add_user_roles`
- Test migrations on a copy of production data before deploying

## Parameterized Queries

ALWAYS use parameterized queries. Never concatenate user input into SQL.

```typescript
// WRONG: SQL injection vulnerability
const result = await db.query(`SELECT * FROM users WHERE email = '${email}'`)

// CORRECT: Parameterized
const result = await db.query('SELECT * FROM users WHERE email = $1', [email])

// CORRECT: Query builder
const user = await knex('users').where({ email }).first()
```

## N+1 Query Detection

Watch for N+1 query patterns — they cause dramatic performance degradation.

```typescript
// WRONG: N+1 queries (1 + N database calls)
const posts = await db.query('SELECT * FROM posts LIMIT 20')
for (const post of posts) {
  post.author = await db.query('SELECT * FROM users WHERE id = $1', [post.author_id])
}

// CORRECT: Eager loading with JOIN
const posts = await db.query(`
  SELECT p.*, row_to_json(u.*) as author
  FROM posts p
  JOIN users u ON u.id = p.author_id
  LIMIT 20
`)

// CORRECT: Batch loading
const posts = await db.query('SELECT * FROM posts LIMIT 20')
const authorIds = [...new Set(posts.map(p => p.author_id))]
const authors = await db.query('SELECT * FROM users WHERE id = ANY($1)', [authorIds])
```

## Connection Pooling

Always use connection pools in production.

```typescript
import { Pool } from 'pg'

const pool = new Pool({
  max: 20,
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 2000,
})

// Use pool.query for single queries
const result = await pool.query('SELECT * FROM users WHERE id = $1', [id])

// Use client checkout for transactions
const client = await pool.connect()
try {
  await client.query('BEGIN')
  await client.query('UPDATE accounts SET balance = balance - $1 WHERE id = $2', [amount, fromId])
  await client.query('UPDATE accounts SET balance = balance + $1 WHERE id = $2', [amount, toId])
  await client.query('COMMIT')
} catch (err) {
  await client.query('ROLLBACK')
  throw err
} finally {
  client.release()
}
```

## Checklist

- [ ] Schema is normalized to 3NF
- [ ] Foreign keys have indexes
- [ ] All queries use parameterized inputs
- [ ] No N+1 query patterns
- [ ] Migrations are reversible and tested
- [ ] Connection pooling is configured
