# REST Concepts

## REST Constraints

REST (Representational State Transfer) is an architectural style based on 6 constraints:

### 1. Client-Server
- Separation of concerns
- Client: UI and user experience
- Server: Data storage and business logic
- Allows independent evolution

### 2. Stateless
```
Each request contains all information needed
No session data stored on server
Each request is independent
↓
Easy scalability
Easy caching
```

### 3. Uniform Interface
```
Resources identified in requests (URIs)
Resources manipulation via representations
Self-descriptive messages
Hypermedia As The Engine Of Application State (HATEOAS)
```

### 4. Cacheable
```
Responses marked as cacheable or non-cacheable
HTTP caching headers:
  - Cache-Control
  - ETag
  - Last-Modified
```

### 5. Layered System
```
Architecture divided into layers
Each layer provides service to the layer above
Examples: Load balancer, proxy, cache, API gateway
```

### 6. Code on Demand (Optional)
```
Server can extend client functionality
Example: JavaScript from server
```

## Resource Representation

### Same Resource, Different Representations

**JSON**
```json
GET /users/1 HTTP/1.1
Accept: application/json

{
  "id": 1,
  "name": "John Doe",
  "email": "john@example.com"
}
```

**XML**
```xml
GET /users/1 HTTP/1.1
Accept: application/xml

<?xml version="1.0"?>
<user>
  <id>1</id>
  <name>John Doe</name>
  <email>john@example.com</email>
</user>
```

### Content Negotiation
```
Accept: application/json
Accept: application/xml
Accept: application/json, application/xml;q=0.9

q = quality factor (preference, 0-1)
```

## Idempotency

### Idempotent Operations
```
Multiple identical requests produce same result

GET    /users/1         → Idempotent (returns same user)
PUT    /users/1         → Idempotent (replaces same user)
DELETE /users/1         → Idempotent (deletes same user)
```

### Non-Idempotent Operations
```
POST /users             → NOT idempotent (creates new user each time)
PATCH /users/1/balance → NOT idempotent (different amounts added)
```

## HATEOAS (Hypermedia As The Engine Of Application State)

### Without HATEOAS
```json
GET /users/1
{
  "id": 1,
  "name": "John Doe"
}
```

### With HATEOAS (Level 3 REST)
```json
GET /users/1
{
  "id": 1,
  "name": "John Doe",
  "_links": {
    "self": {"href": "/users/1"},
    "all_users": {"href": "/users"},
    "posts": {"href": "/users/1/posts"},
    "delete": {"href": "/users/1", "method": "DELETE"}
  }
}
```

Benefits:
- Client discovers available actions
- API can change without breaking clients
- Enables dynamic navigation

## Richardson Maturity Model

```
Level 0: Swamp of POX
  Single endpoint: POST /api
  HTTP only for transport

Level 1: Resources
  Multiple endpoints: /users, /posts
  Still mostly POST

Level 2: HTTP Verbs & Status Codes
  GET, POST, PUT, DELETE
  200, 404, 500 status codes
  Mostly RESTful

Level 3: HATEOAS
  Hypermedia links in responses
  Self-describing API
  True REST
```

## API Response Patterns

### List Response
```json
GET /users
{
  "data": [
    {"id": 1, "name": "John"},
    {"id": 2, "name": "Jane"}
  ],
  "pagination": {
    "page": 1,
    "limit": 10,
    "total": 2,
    "pages": 1
  }
}
```

### Single Resource Response
```json
GET /users/1
{
  "data": {
    "id": 1,
    "name": "John",
    "email": "john@example.com"
  }
}
```

### Error Response
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input",
    "details": {
      "email": ["Invalid email format"],
      "age": ["Must be 18 or older"]
    }
  }
}
```

## API Maturity Levels

### Level 1: Single Endpoint
```
POST /api
{ "method": "getUser", "id": 1 }
```

### Level 2: RESTful Endpoints
```
GET    /api/users
POST   /api/users
GET    /api/users/1
PUT    /api/users/1
DELETE /api/users/1
```

### Level 3: RESTful with HATEOAS
```
Previous + Hypermedia links
Self-describing resources
Discoverable API
```

## Path Design Patterns

### Hierarchical Resources
```
/organizations/1/teams/2/members/3

Hierarchical: Organization > Team > Member
```

### Flat Structure
```
/members/3?team_id=2&organization_id=1

All at same level with relationships
```

### Query String vs Path Parameters

**Path Parameters** (Resource identification)
```
GET /users/123      → Get user with ID 123
GET /users/john     → Get user with username john
```

**Query Strings** (Filtering, sorting, pagination)
```
GET /users?role=admin&status=active&sort=name
```

## Request Validation

### Valid Request
```json
POST /users
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com",
  "age": 30
}
```

### Should Validate
- Required fields present
- Data types correct
- Format constraints (email, phone, etc.)
- Business rules (age >= 18)
- Length constraints
- Uniqueness constraints

## Response Caching Headers

```
# Cacheable for 1 hour
Cache-Control: max-age=3600, public

# Don't cache
Cache-Control: no-cache, no-store

# Cache with ETag (revalidate if changed)
ETag: "12345"
If-None-Match: "12345"  → Server responds 304 Not Modified
```

## Versioning Strategies

### URL Path (Most Common)
```
/api/v1/users
/api/v2/users
```

### Subdomain
```
v1.api.example.com
v2.api.example.com
```

### Header
```
API-Version: 2
X-API-Version: 2
```

### Query Parameter
```
/users?version=2
```

---

**Next**: Continue to [Testing Tools](testing-tools.md)
