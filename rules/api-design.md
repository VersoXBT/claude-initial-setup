# API Design

## RESTful Conventions

Use standard HTTP methods and status codes consistently.

| Method | Purpose | Example |
|--------|---------|---------|
| `GET` | Retrieve resource(s) | `GET /api/users/123` |
| `POST` | Create a resource | `POST /api/users` |
| `PUT` | Replace a resource | `PUT /api/users/123` |
| `PATCH` | Partial update | `PATCH /api/users/123` |
| `DELETE` | Remove a resource | `DELETE /api/users/123` |

### URL Structure

```
# Collection
GET /api/users

# Single resource
GET /api/users/123

# Nested resources
GET /api/users/123/orders

# Filtering, sorting, searching
GET /api/users?role=admin&sort=-createdAt&search=john
```

- Use plural nouns for collections (`/users` not `/user`)
- Use kebab-case for multi-word paths (`/order-items`)
- Nest resources only one level deep
- Use query parameters for filtering, sorting, and pagination

## Consistent Error Format

Return errors in a standard structure across all endpoints.

```typescript
interface ApiError {
  success: false
  error: {
    code: string
    message: string
    details?: Record<string, string[]>
  }
}

// Example: Validation error
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Request validation failed",
    "details": {
      "email": ["Must be a valid email address"],
      "name": ["Must be between 1 and 100 characters"]
    }
  }
}
```

### HTTP Status Codes

| Code | Usage |
|------|-------|
| `200` | Success (GET, PUT, PATCH) |
| `201` | Created (POST) |
| `204` | No Content (DELETE) |
| `400` | Validation error |
| `401` | Not authenticated |
| `403` | Not authorized |
| `404` | Resource not found |
| `409` | Conflict (duplicate) |
| `429` | Rate limited |
| `500` | Internal server error |

## Pagination

Always paginate list endpoints. Support both offset and cursor-based pagination.

```typescript
// Offset pagination
GET /api/users?page=2&limit=20

// Response
{
  "success": true,
  "data": [...],
  "meta": {
    "total": 150,
    "page": 2,
    "limit": 20,
    "totalPages": 8
  }
}

// Cursor pagination (preferred for large datasets)
GET /api/events?cursor=eyJpZCI6MTAwfQ&limit=20

// Response
{
  "success": true,
  "data": [...],
  "meta": {
    "nextCursor": "eyJpZCI6MTIwfQ",
    "hasMore": true
  }
}
```

## Versioning

Use URL path versioning for major API changes.

```
/api/v1/users
/api/v2/users
```

- Maintain backward compatibility within a version
- Deprecate old versions with headers and documentation
- Support at most 2 active versions simultaneously

## Content Negotiation

Support JSON by default. Use `Accept` and `Content-Type` headers.

```typescript
app.use(express.json())

app.get('/api/users', (req, res) => {
  res.type('application/json')
  res.json({ success: true, data: users })
})
```

## Response Envelope

Wrap all responses in a consistent envelope.

```typescript
interface ApiResponse<T> {
  success: boolean
  data?: T
  error?: ApiError
  meta?: {
    total: number
    page: number
    limit: number
  }
}
```
