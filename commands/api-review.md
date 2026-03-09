---
description: Review API design for REST conventions and best practices
---

# API Review

Review API endpoints for adherence to REST conventions, proper error handling, and documentation.

## Steps

1. Inventory all API endpoints:
   - List every route with its HTTP method, path, and handler.
   - Group endpoints by resource (users, orders, products, etc.).
   - Identify any endpoints that do not follow RESTful naming conventions.

2. Check REST conventions:
   - Verify correct HTTP methods: GET (read), POST (create), PUT/PATCH (update), DELETE (remove).
   - Verify resource-based URLs (nouns, not verbs): `/users/:id` not `/getUser`.
   - Verify plural resource names: `/users` not `/user`.
   - Check that nested resources are properly scoped: `/users/:id/orders`.
   - Verify consistent URL casing (kebab-case preferred).

3. Validate request handling:
   - All request bodies are validated with a schema before processing.
   - Query parameters are validated and sanitized.
   - Path parameters are validated (type, format, existence).
   - Content-Type headers are checked and enforced.

4. Review error responses:
   - Verify consistent error response format across all endpoints.
   - Check that appropriate HTTP status codes are used (400, 401, 403, 404, 409, 422, 500).
   - Confirm error messages are helpful but do not leak internal details.
   - Verify that validation errors return specific field-level messages.

5. Check pagination, filtering, and sorting:
   - List endpoints return paginated results (not unbounded queries).
   - Pagination uses consistent parameters (page/limit or cursor-based).
   - Filtering and sorting are supported where appropriate.
   - Response includes total count and pagination metadata.

6. Review authentication and authorization:
   - All protected endpoints require authentication.
   - Authorization checks enforce proper access levels per endpoint.
   - Public endpoints are intentionally and explicitly public.

7. Check API documentation:
   - All endpoints are documented with request/response schemas.
   - Examples are provided for common use cases.
   - Error responses are documented.

## If Issues Are Found

- Fix naming convention violations for unreleased APIs.
- For released APIs, document inconsistencies and plan a versioned migration.
- Fix missing validation and error handling immediately.

## Output

An API review report listing each endpoint with its status (PASS/FAIL), specific issues found, and recommended fixes.
