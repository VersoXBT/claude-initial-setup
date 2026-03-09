---
description: Review database schema, queries, and migrations
---

# Database Review

Audit the database schema, query patterns, and migrations for correctness and performance.

## Steps

1. Review the schema:
   - Check that tables and columns use consistent naming conventions (snake_case preferred).
   - Verify all tables have a primary key.
   - Check that foreign keys have proper constraints (ON DELETE, ON UPDATE).
   - Verify NOT NULL constraints are applied to required fields.
   - Check that default values are set where appropriate.
   - Ensure sensitive data columns (passwords, tokens) are not stored in plain text.

2. Check normalization:
   - Identify denormalized data that could cause update anomalies.
   - Verify no data is duplicated across tables without justification.
   - Check that junction tables are used for many-to-many relationships.
   - Note any intentional denormalization and confirm it is documented.

3. Review indexes:
   - Verify indexes exist on all foreign key columns.
   - Check that columns used in WHERE, JOIN, and ORDER BY have appropriate indexes.
   - Identify missing indexes on frequently queried columns.
   - Check for redundant or duplicate indexes that waste space.
   - Verify composite indexes have columns in the correct order.

4. Identify N+1 query patterns:
   - Search for loops that execute individual queries inside them.
   - Check that related data is loaded with JOINs or eager loading, not lazy loading in loops.
   - Verify batch operations are used for bulk inserts and updates.

5. Review query patterns:
   - Check for SELECT * usage — only select needed columns.
   - Verify pagination is used on list queries (no unbounded result sets).
   - Check that complex queries use query builders or named queries, not string concatenation.
   - Verify all queries use parameterized inputs (no raw string interpolation).

6. Review migrations:
   - Check that migrations are sequential and do not conflict.
   - Verify each migration has a corresponding rollback.
   - Check that data migrations handle existing data correctly.
   - Verify destructive migrations (DROP, ALTER column type) have a safety plan.

## If Issues Are Found

- Fix N+1 queries and missing indexes immediately — these are performance-critical.
- Fix missing constraints in a migration with a rollback plan.
- Document schema inconsistencies and plan a migration to resolve them.

## Output

A database review report listing schema issues, missing indexes, query anti-patterns, and migration concerns with recommended fixes.
