# API Fundamentals

## What is an API?

Application Programming Interface (API) is a set of rules and protocols that allows different software applications to communicate with each other.

## API Architecture Styles

### REST (Representational State Transfer)
- **Most popular** for web APIs
- Resource-based
- Uses HTTP methods: GET, POST, PUT, DELETE, PATCH
- Stateless communication
- JSON/XML responses

### GraphQL
- Query language for APIs
- Request only needed data
- Strong typing
- Single endpoint

### SOAP (Simple Object Access Protocol)
- XML-based
- More complex
- Enterprise systems
- WSDL contracts

### gRPC
- High-performance
- Protocol Buffers
- Bi-directional streaming

## HTTP Methods

```
GET     → Retrieve data (idempotent)
POST    → Create new data
PUT     → Replace entire resource
PATCH   → Partial update
DELETE  → Remove data
HEAD    → Like GET but no response body
OPTIONS → Describe communication options
```

## HTTP Status Codes

### Success (2xx)
- **200 OK**: Request successful
- **201 Created**: Resource created
- **204 No Content**: Success, no body

### Client Error (4xx)
- **400 Bad Request**: Invalid input
- **401 Unauthorized**: Authentication required
- **403 Forbidden**: Access denied
- **404 Not Found**: Resource not found
- **429 Too Many Requests**: Rate limited

### Server Error (5xx)
- **500 Internal Server Error**: Server error
- **503 Service Unavailable**: Temporarily down

## REST API Design

### Resource-Based URLs
```
❌ Bad:
GET  /getUsers
POST /createUser
PUT  /updateUser/1
DELETE /removeUser/1

✅ Good:
GET    /users              # Get all users
POST   /users              # Create user
GET    /users/1            # Get user with id=1
PUT    /users/1            # Update user with id=1
DELETE /users/1            # Delete user with id=1
```

### Query Parameters
```
GET /users?page=1&limit=10  # Pagination
GET /users?status=active    # Filtering
GET /users?sort=-created    # Sorting
```

### Request/Response Format

**Request**
```json
POST /users
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com",
  "role": "admin"
}
```

**Response**
```json
HTTP/1.1 201 Created
Content-Type: application/json

{
  "id": 123,
  "name": "John Doe",
  "email": "john@example.com",
  "role": "admin",
  "created_at": "2024-01-15T10:30:00Z"
}
```

## Authentication Methods

### API Key
```
# Header
Authorization: Bearer sk_live_abc123xyz

# Query Parameter
GET /users?api_key=abc123xyz
```

### Basic Auth
```
Authorization: Basic base64(username:password)
```

### OAuth 2.0
```
Authorization: Bearer <access_token>
```

### JWT (JSON Web Token)
```
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

## API Response Structure

### Successful Response
```json
{
  "status": "success",
  "data": {
    "id": 1,
    "name": "John"
  },
  "timestamp": "2024-01-15T10:30:00Z"
}
```

### Error Response
```json
{
  "status": "error",
  "error": {
    "code": "INVALID_EMAIL",
    "message": "Email format is invalid"
  },
  "timestamp": "2024-01-15T10:30:00Z"
}
```

## Pagination

### Offset-based
```
GET /users?offset=20&limit=10
```

### Cursor-based
```
GET /users?cursor=abc123&limit=10
```

### Page-based
```
GET /users?page=3&limit=10
```

## Rate Limiting

```
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 950
X-RateLimit-Reset: 1705323600
```

## CORS (Cross-Origin Resource Sharing)

```
Access-Control-Allow-Origin: *
Access-Control-Allow-Methods: GET, POST, PUT, DELETE
Access-Control-Allow-Headers: Content-Type, Authorization
Access-Control-Max-Age: 86400
```

## API Versioning

### URL Path
```
GET /api/v1/users
GET /api/v2/users
```

### Header
```
Accept: application/vnd.api+json;version=1
```

### Query Parameter
```
GET /users?api-version=1.0
```

## Best Practices

!!! note "API Best Practices"
    - Use consistent naming conventions
    - Implement proper authentication
    - Use appropriate HTTP status codes
    - Version your APIs
    - Document endpoints thoroughly
    - Implement rate limiting
    - Use pagination for large datasets
    - Validate input data
    - Use HTTPS only
    - Implement proper error handling
    - Log all requests
    - Use idempotent operations

## Common API Patterns

### Filtering
```
GET /users?role=admin&status=active
```

### Sorting
```
GET /users?sort=name ASC
GET /users?sort=-created_at
```

### Including Related Data
```
GET /users/1?include=posts,comments
```

### Sparse Fieldsets
```
GET /users?fields=name,email
```

---

**Next**: Continue to [REST Concepts](rest-concepts.md)
