# Playwright API Automation Testing
### Practical Enterprise Guide

JavaScript · TypeScript · Playwright Test · CI/CD · REST APIs

- Complete API Lifecycle Coverage
- Production-Ready Framework Architecture
- Automation Architect Interview Guide
- CI/CD · Multi-Environment · Parallel Execution

Enterprise QA Series · 2026 Edition

---

## Table of Contents

1. HTTP & REST Foundations for API Testing — 13
2. Playwright Test & APIRequestContext Essentials — 18
3. Complete CRUD Operations — GET, POST, PUT, PATCH, DELETE — 26
4. Request Construction — Headers, Params, Bodies — 38
5. Response Validation & Assertions — 46
6. Authentication & Authorization — 54
7. Environment Configuration & Multi-Env Strategy — 62
8. Test Data Management & Dynamic Data — 68
9. Positive, Negative & Boundary Testing — 76
10. Schema & Contract Validation — 84
11. API Chaining & Dependent Test Flows — 90
12. Reusable Utilities, Fixtures & Hooks — 97
13. Parallel Execution, Retries & Timeouts — 105
14. Logging, Debugging & Tracing — 112
15. CI/CD Integration — 118
16. API + UI Integration Testing — 126
17. Security Considerations in API Automation — 133
18. Framework Architecture & Production Strategy — 140
A. Appendix — Quick Reference, Checklists & Troubleshooting — 152

---

## 01 — HTTP & REST Foundations for API Testing
*Protocol basics every API automation engineer must know*

### 1.1 What is REST and Why Does It Matter for Testing?

REST (Representational State Transfer) is an architectural style for distributed systems. Every REST API test you write operates over HTTP — understanding the protocol eliminates root-cause guesswork and makes you a sharper automation architect.

**HTTP Request Anatomy**

A complete HTTP request has four components:

| Component | Example | Testing Relevance |
|---|---|---|
| Request Line | `POST /api/v1/users HTTP/1.1` | Method + path + version |
| Headers | `Authorization: Bearer {token}` | Auth, content-type, custom headers |
| Query Params | `?status=active&page=2` | Filtering, pagination, sorting |
| Body | `{"name":"Alice","email":"a@b.com"}` | POST/PUT/PATCH payloads |

### 1.2 HTTP Methods — Complete Reference

| Method | Semantics | Idempotent? | Request Body? | Typical Status |
|---|---|---|---|---|
| GET | Retrieve resource | Yes | No | 200 OK |
| POST | Create resource | No | Yes | 201 Created |
| PUT | Replace full resource | Yes | Yes | 200 / 204 |
| PATCH | Partial update | No | Yes | 200 / 204 |
| DELETE | Remove resource | Yes | No | 200 / 204 |
| HEAD | Metadata only | Yes | No | 200 OK |
| OPTIONS | CORS / capability check | Yes | No | 200 OK |

### 1.3 HTTP Status Codes — Test Assertion Map

Knowing exactly which status to assert prevents false positives.

| Code | Meaning | Assert In Test When… |
|---|---|---|
| 200 | OK | GET / PUT / PATCH returns data |
| 201 | Created | POST successfully creates resource |
| 204 | No Content | DELETE or PUT with no body response |
| 400 | Bad Request | Negative test: missing/invalid payload |
| 401 | Unauthorized | Negative test: missing/expired token |
| 403 | Forbidden | Negative test: insufficient permissions |
| 404 | Not Found | Negative test: non-existent resource ID |
| 409 | Conflict | Duplicate resource creation |
| 422 | Unprocessable | Business rule violation |
| 429 | Too Many Requests | Rate-limit test |
| 500 | Internal Server Error | Server fault — circuit breaker test |

### 1.4 REST API URL Conventions

```bash
# Resource collections
GET /api/v1/users          # list users
POST /api/v1/users         # create user

# Single resource (path parameter)
GET /api/v1/users/{id}     # retrieve
PUT /api/v1/users/{id}     # replace
PATCH /api/v1/users/{id}   # partial update
DELETE /api/v1/users/{id}  # remove

# Nested resources
GET /api/v1/users/{id}/orders     # user's orders
POST /api/v1/users/{id}/orders    # create order for user

# Query parameters
GET /api/v1/users?role=admin&page=1&limit=25
```

### 1.5 JSON Fundamentals for API Testing

```json
// Full user object — types you will encounter in assertions
{
  "id": "usr_9f3a2b",             // string (UUID)
  "name": "Alice Johnson",        // string
  "age": 29,                      // number (integer)
  "score": 98.5,                  // number (float)
  "active": true,                 // boolean
  "deletedAt": null,              // null
  "roles": ["admin","viewer"],    // array
  "address": {                    // nested object
    "city": "Chennai",
    "state": "Tamil Nadu"
  },
  "createdAt": "2025-06-01T10:30:00Z"  // ISO-8601 date
}
```

### 1.6 Common API Testing Interview Questions

**Q: What is the difference between PUT and PATCH?**
A: PUT replaces the entire resource — omitting a field deletes it. PATCH applies partial updates — only sent fields change. Always assert the right fields after each operation.

**Q: Why do we assert both status code AND response body?**
A: Status code confirms HTTP semantics; body validates business logic. A 200 with an error field in the body is a common API bug that status-only assertions miss.

**Q: What is idempotency and why does it matter in test design?**
A: An idempotent operation returns the same result regardless of how many times you call it. GET, PUT, DELETE are idempotent. POST is not. This affects test data cleanup strategy — DELETE can be retried safely; POST cannot.

---

## 02 — Playwright Test & APIRequestContext Essentials
*Core API testing primitives and project setup*

### 2.1 Why Playwright for API Testing?

| Capability | Playwright | Supertest / Axios | Postman/Newman |
|---|---|---|---|
| Native API Client | ✓ Built-in | ✓ Built-in | ✓ Built-in |
| UI + API in same test | ✓ Native | ✗ Complex setup | Limited |
| Parallel Execution | ✓ Worker-level | Manual setup | Limited |
| HAR / Trace recording | ✓ Native | ✗ | ✗ |
| TypeScript support | ✓ First-class | ✓ Good | Partial |
| CI Integration | ✓ Excellent | Good | Good |
| Fixture system | ✓ Powerful | Manual | ✗ |
| Browser Cookie sharing | ✓ Native | ✗ | ✗ |

### 2.2 Project Setup — Production Structure

```bash
# 1. Initialize project
npm init -y
npm install -D @playwright/test typescript ts-node
npm install -D @faker-js/faker zod dotenv

# 2. Install browsers (only needed for UI tests)
npx playwright install chromium
```

**Recommended Project Structure**

```
playwright-api/
├── playwright.config.ts       # global config
├── .env                       # local secrets (git-ignored)
├── .env.staging                # staging env vars
├── src/
│   ├── api/
│   │   ├── userApi.ts          # API client per domain
│   │   ├── orderApi.ts
│   │   └── authApi.ts
│   ├── fixtures/
│   │   └── apiFixtures.ts      # extended test fixtures
│   ├── models/
│   │   └── user.schema.ts      # Zod schemas
│   ├── utils/
│   │   ├── apiHelper.ts        # request wrapper
│   │   ├── assertHelper.ts     # assertion helpers
│   │   └── dataFactory.ts      # test data generators
│   └── config/
│       └── envConfig.ts        # env configuration
├── tests/
│   ├── user/
│   │   ├── user.create.spec.ts
│   │   ├── user.retrieve.spec.ts
│   │   └── user.delete.spec.ts
│   ├── auth/
│   │   └── auth.spec.ts
│   └── e2e/
│       └── order.flow.spec.ts
└── reports/                     # test artifacts
```

### 2.3 playwright.config.ts — Production Configuration

```ts
// playwright.config.ts
import { defineConfig } from '@playwright/test';
import * as dotenv from 'dotenv';

// Load env-specific config
const ENV = process.env.TEST_ENV || 'dev';
dotenv.config({ path: `.env.${ENV}` });

export default defineConfig({
  testDir: './tests',
  timeout: 30_000,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 4 : 2,
  reporter: [
    ['list'],
    ['json', { outputFile: 'reports/results.json' }],
    ['html', { outputFolder: 'reports/html', open: 'never' }],
  ],
  use: {
    baseURL: process.env.API_BASE_URL,
    extraHTTPHeaders: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'x-api-version': 'v1',
    },
    trace: 'on-first-retry',
  },
  projects: [
    { name: 'api-smoke', testMatch: '**/*.smoke.spec.ts' },
    { name: 'api-full', testMatch: '**/*.spec.ts' },
    { name: 'api-contract', testMatch: '**/contract/*.spec.ts' },
  ],
});
```

### 2.4 APIRequestContext — Core API

APIRequestContext is Playwright's HTTP client. It can be scoped to a single test or shared across the entire suite via global setup.

```ts
// Basic APIRequestContext usage
import { test, expect } from '@playwright/test';

test('GET /users returns list', async ({ request }) => {
  // 'request' is an APIRequestContext auto-provided by Playwright
  const response = await request.get('/api/v1/users');

  // Always assert status first
  expect(response.status()).toBe(200);

  // Parse and assert body
  const body = await response.json();
  expect(body).toHaveProperty('data');
  expect(Array.isArray(body.data)).toBe(true);
});
```

**APIRequestContext Methods Reference**

| Method | Signature | Use Case |
|---|---|---|
| `request.get()` | `get(url, options?)` | Read resources |
| `request.post()` | `post(url, options?)` | Create resources |
| `request.put()` | `put(url, options?)` | Replace resources |
| `request.patch()` | `patch(url, options?)` | Partial update |
| `request.delete()` | `delete(url, options?)` | Remove resources |
| `request.head()` | `head(url, options?)` | Check headers only |
| `request.fetch()` | `fetch(url, options?)` | Full control / any method |
| `request.dispose()` | `dispose()` | Release context resources |

### 2.5 APIResponse — Key Properties

```ts
const response = await request.post('/api/v1/users', {
  data: { name: 'Alice', email: 'alice@example.com' },
});

// Status
response.status();      // 201
response.statusText();  // 'Created'
response.ok();          // true if 200-299

// Headers
response.headers();       // Record<string, string>
response.headersArray();  // [{name,value}] — preserves dupes
response.header('location'); // single header value

// Body
await response.json();  // parsed JSON object
await response.text();  // raw string
await response.body();  // Buffer (for binary)

// URL
response.url();  // final request URL (after redirects)
```

> **TIP:** Always call `response.json()` only once per response. Playwright buffers the body, but calling it twice in the same test can cause unexpected behavior in some environments. Store the result in a variable.

**Q: What is the difference between 'request' fixture and creating a custom APIRequestContext?**
A: The 'request' fixture is auto-scoped to the test and shares baseURL from playwright.config. A custom context via `playwright.request.newContext()` lets you set per-context defaults (base URL, headers, storage state) — ideal for multi-user scenarios or service-level clients.

---

## 03 — Complete CRUD — GET, POST, PUT, PATCH, DELETE
*End-to-end User API automation with real assertions*

### 3.1 The Reference Scenario

All examples in this chapter use a User Management API — a realistic enterprise domain. The same pattern applies to orders, products, accounts, or any REST resource.

```bash
Base URL: https://api.example.com
Resource: /api/v1/users

POST /api/v1/users        → 201 Created
GET /api/v1/users         → 200 OK (list)
GET /api/v1/users/{id}    → 200 OK (single)
PUT /api/v1/users/{id}    → 200 OK (full replace)
PATCH /api/v1/users/{id}  → 200 OK (partial update)
DELETE /api/v1/users/{id} → 204 No Content
```

### 3.2 POST — Create User

```ts
// tests/user/user.create.spec.ts
import { test, expect } from '@playwright/test';
import { UserFactory } from '../../src/utils/dataFactory';

test.describe('POST /api/v1/users', () => {

  test('creates a new user with valid payload', async ({ request }) => {
    const payload = UserFactory.validUser();

    const response = await request.post('/api/v1/users', {
      data: payload,
    });

    // Status Assertion
    expect(response.status()).toBe(201);

    // Body Assertions
    const body = await response.json();
    expect(body).toMatchObject({
      id: expect.stringMatching(/^usr_[a-z0-9]{6,}/),
      name: payload.name,
      email: payload.email,
      active: true,
    });
    expect(body.password).toBeUndefined(); // never return password

    // Header Assertions
    expect(response.header('content-type')).toContain('application/json');
    const location = response.header('location');
    expect(location).toMatch(/\/api\/v1\/users\/usr_/);
  });

  test('returns 409 on duplicate email', async ({ request }) => {
    const payload = UserFactory.validUser({ email: 'existing@company.com' });
    await request.post('/api/v1/users', { data: payload }); // first create
    const response = await request.post('/api/v1/users', { data: payload });
    expect(response.status()).toBe(409);
    const body = await response.json();
    expect(body.error).toContain('email');
  });
});
```

### 3.3 GET — Retrieve User

```ts
test.describe('GET /api/v1/users', () => {

  let userId: string;

  test.beforeAll(async ({ request }) => {
    // Create a user to retrieve
    const res = await request.post('/api/v1/users', {
      data: UserFactory.validUser(),
    });
    userId = (await res.json()).id;
  });

  test('GET /users returns paginated list', async ({ request }) => {
    const response = await request.get('/api/v1/users', {
      params: { page: 1, limit: 10, status: 'active' },
    });
    expect(response.status()).toBe(200);
    const body = await response.json();
    expect(body).toHaveProperty('data');
    expect(body.data.length).toBeLessThanOrEqual(10);
    expect(body).toHaveProperty('meta.total');
    expect(body.meta.page).toBe(1);
  });

  test('GET /users/{id} returns specific user', async ({ request }) => {
    const response = await request.get(`/api/v1/users/${userId}`);
    expect(response.status()).toBe(200);
    const user = await response.json();
    expect(user.id).toBe(userId);
    expect(user).toHaveProperty('name');
    expect(user).toHaveProperty('email');
    expect(user).not.toHaveProperty('password');
    expect(user).not.toHaveProperty('internalScore');
  });

  test('GET /users/{id} returns 404 for unknown id', async ({ request }) => {
    const response = await request.get('/api/v1/users/usr_nonexistent');
    expect(response.status()).toBe(404);
  });
});
```

### 3.4 PUT — Full Update

```ts
test('PUT /users/{id} replaces user completely', async ({ request }) => {
  // Setup
  const createRes = await request.post('/api/v1/users', {
    data: UserFactory.validUser({ department: 'Engineering' }),
  });
  const { id } = await createRes.json();

  // Full replacement payload — all fields required
  const updatePayload = {
    name: 'Alice Johnson Updated',
    email: 'alice.updated@example.com',
    role: 'admin',
    department: 'Leadership', // changed
    active: true,
  };

  const response = await request.put(`/api/v1/users/${id}`, {
    data: updatePayload,
  });

  expect(response.status()).toBe(200);
  const updated = await response.json();
  expect(updated.name).toBe(updatePayload.name);
  expect(updated.department).toBe('Leadership');
  // Verify id is preserved
  expect(updated.id).toBe(id);
});
```

### 3.5 PATCH — Partial Update

```ts
test('PATCH /users/{id} updates only sent fields', async ({ request }) => {
  const createRes = await request.post('/api/v1/users', {
    data: UserFactory.validUser({ role: 'viewer', department: 'QA' }),
  });
  const { id } = await createRes.json();

  // Only change the role — department should remain 'QA'
  const response = await request.patch(`/api/v1/users/${id}`, {
    data: { role: 'editor' },
  });

  expect(response.status()).toBe(200);
  const patched = await response.json();
  expect(patched.role).toBe('editor');       // changed
  expect(patched.department).toBe('QA');     // unchanged
  expect(patched.id).toBe(id);               // preserved
});
```

### 3.6 DELETE — Remove Resource

```ts
test('DELETE /users/{id} removes user', async ({ request }) => {
  // Setup: create a user to delete
  const createRes = await request.post('/api/v1/users', {
    data: UserFactory.validUser(),
  });
  const { id } = await createRes.json();

  // DELETE the user
  const deleteRes = await request.delete(`/api/v1/users/${id}`);
  expect(deleteRes.status()).toBe(204);

  // Verify it no longer exists
  const getRes = await request.get(`/api/v1/users/${id}`);
  expect(getRes.status()).toBe(404);
});

test('DELETE on already-deleted resource returns 404', async ({ request }) => {
  const res = await request.post('/api/v1/users', { data: UserFactory.validUser() });
  const { id } = await res.json();
  await request.delete(`/api/v1/users/${id}`);
  // Second delete
  const secondDelete = await request.delete(`/api/v1/users/${id}`);
  expect(secondDelete.status()).toBe(404);
});
```

> **ARCHITECT INSIGHT:** Always verify deletion with a subsequent GET. A 204 on DELETE proves the server accepted the request, but only a 404 on the follow-up GET proves the resource is truly gone. This two-step pattern catches soft-delete bugs.

---

## 04 — Request Construction — Headers, Params, Bodies
*Precise control over every request component*

### 4.1 Request Options — Complete Reference

| Option | Type | Purpose | Example |
|---|---|---|---|
| `data` | object \| string \| Buffer | JSON/text body | `{ name: "Alice" }` |
| `form` | object | form-urlencoded | `{ grant_type: 'client_credentials' }` |
| `multipart` | object | multipart/form-data | `{ file: fs.readFileSync(...) }` |
| `headers` | object | Per-request headers | `{ 'X-Tenant-ID': 'acme' }` |
| `params` | object | Query string | `{ page: 1, limit: 10 }` |
| `timeout` | number | Override global | `15000` (ms) |
| `failOnStatusCode` | boolean | Throw on 4xx/5xx | `false` (default) |
| `maxRedirects` | number | Follow redirects | `0` to disable |
| `ignoreHTTPSErrors` | boolean | Skip TLS check | `true` (test only) |

### 4.2 Headers — Types and Usage

```ts
// Per-request headers override global defaults
const response = await request.post('/api/v1/orders', {
  data: orderPayload,
  headers: {
    'Authorization': `Bearer ${token}`,
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-Tenant-ID': process.env.TENANT_ID!,
    'X-Idempotency-Key': crypto.randomUUID(), // for safe retries
    'X-Request-ID': `test-${Date.now()}`,     // for log tracing
    'Accept-Language': 'en-US',
  },
});
```

### 4.3 Query Parameters — All Patterns

```ts
// 1. Object shorthand (recommended)
const response = await request.get('/api/v1/users', {
  params: {
    status: 'active',
    role: 'admin',
    page: 2,
    limit: 25,
    sortBy: 'createdAt',
    sortOrder: 'desc',
  },
});
// Resulting URL: /api/v1/users?status=active&role=admin&page=2&limit=25...

// 2. Array values (multi-value params)
const filteredRes = await request.get('/api/v1/reports', {
  params: { 'ids[]': ['r1', 'r2', 'r3'] },
});

// 3. URL template literal (path params)
const userId = 'usr_9f3a2b';
const userRes = await request.get(`/api/v1/users/${userId}`);

// 4. Encoded special characters (handled automatically)
const searchRes = await request.get('/api/v1/search', {
  params: { q: 'John Doe & Associates' }, // auto-encoded
});
```

### 4.4 Request Body — All Content Types

```ts
// JSON body (default when 'data' is object)
await request.post('/api/v1/users', {
  data: { name: 'Alice', email: 'alice@co.com', role: 'admin' },
});

// Form URL-encoded (OAuth token requests, legacy APIs)
await request.post('/oauth/token', {
  form: {
    grant_type: 'client_credentials',
    client_id: process.env.CLIENT_ID!,
    client_secret: process.env.CLIENT_SECRET!,
    scope: 'users:read orders:write',
  },
});

// Multipart form-data (file upload)
import * as fs from 'fs';
await request.post('/api/v1/users/avatar', {
  multipart: {
    userId: 'usr_9f3a2b',
    file: {
      name: 'avatar.png',
      mimeType: 'image/png',
      buffer: fs.readFileSync('tests/fixtures/avatar.png'),
    },
  },
});

// Raw string / XML body
await request.post('/api/v1/xml-endpoint', {
  data: '<user><name>Alice</name></user>',
  headers: { 'Content-Type': 'application/xml' },
});
```

### 4.5 Nested and Complex Payloads

```ts
// Realistic order creation payload
const orderPayload = {
  customerId: 'cust_7x9k2m',
  items: [
    { productId: 'prod_abc', quantity: 2, unitPrice: 49.99 },
    { productId: 'prod_xyz', quantity: 1, unitPrice: 129.00 },
  ],
  shippingAddress: {
    line1: '123 Main Street',
    city: 'Chennai',
    state: 'Tamil Nadu',
    postalCode: '600001',
    country: 'IN',
  },
  payment: {
    method: 'card',
    cardToken: 'tok_visa_test_4242',
  },
  metadata: {
    channel: 'web',
    campaignId: 'SUMMER25',
  },
};

const res = await request.post('/api/v1/orders', { data: orderPayload });
expect(res.status()).toBe(201);
const order = await res.json();
expect(order.totalAmount).toBe(228.98);
expect(order.items).toHaveLength(2);
```

**Q: When should you use 'data' vs 'form' vs 'multipart' in Playwright requests?**
A: 'data' with an object sends JSON (Content-Type: application/json) — use for REST APIs. 'form' sends application/x-www-form-urlencoded — use for OAuth token endpoints and legacy forms. 'multipart' sends multipart/form-data — use for file uploads. Never mix them.

---

## 05 — Response Validation & Assertions
*Status, body, headers, schema — complete assertion patterns*

### 5.1 Assertion Strategy Pyramid

Every API response test should assert in layers — stop on the first failure to give meaningful error messages.

| Layer | What to Assert | Playwright Matcher |
|---|---|---|
| 1 — Status | HTTP status code | `expect(res.status()).toBe(200)` |
| 2 — Headers | Content-Type, Location, CORS | `expect(res.header('content-type')).toContain(…)` |
| 3 — Structure | Required fields present | `expect(body).toHaveProperty('id')` |
| 4 — Values | Exact field values | `expect(body.email).toBe(payload.email)` |
| 5 — Types | Field data types | `expect(typeof body.id).toBe('string')` |
| 6 — Format | Regex patterns, date formats | `expect(body.id).toMatch(/^usr_/)` |
| 7 — Business | Derived/computed values | `expect(body.total).toBe(item1 + item2)` |
| 8 — Security | Sensitive fields absent | `expect(body.password).toBeUndefined()` |

### 5.2 Playwright Assertion Methods — API Reference

```ts
const response = await request.get(`/api/v1/users/${userId}`);
const body = await response.json();

// Status
expect(response.status()).toBe(200);
expect(response.ok()).toBeTruthy();

// Equality
expect(body.id).toBe(userId);   // strict equality
expect(body.age).not.toBe(0);

// Object shape
expect(body).toHaveProperty('email');
expect(body).toHaveProperty('address.city', 'Chennai'); // nested
expect(body).toMatchObject({    // partial match
  name: 'Alice',
  active: true,
});

// Array assertions
expect(body.roles).toContain('admin');
expect(body.roles).toHaveLength(2);
expect(body.items).toEqual(
  expect.arrayContaining([
    expect.objectContaining({ productId: 'prod_abc' }),
  ])
);

// String matchers
expect(body.id).toMatch(/^usr_[a-z0-9]+$/);
expect(body.email).toContain('@');

// Number matchers
expect(body.price).toBeGreaterThan(0);
expect(body.discount).toBeLessThanOrEqual(100);
expect(body.score).toBeCloseTo(98.5, 1); // float precision

// Null / undefined
expect(body.deletedAt).toBeNull();
expect(body.password).toBeUndefined();
```

### 5.3 Custom Assertion Helpers

```ts
// src/utils/assertHelper.ts
import { APIResponse } from '@playwright/test';
import { expect } from '@playwright/test';

export const assertAPI = {

  async success(response: APIResponse, statusCode = 200) {
    expect(response.status(), `Expected ${statusCode}, got ${response.status()}`
    ).toBe(statusCode);
    expect(response.header('content-type')).toContain('application/json');
    return response.json();
  },

  async clientError(response: APIResponse, statusCode: number) {
    expect(response.status()).toBe(statusCode);
    const body = await response.json();
    expect(body).toHaveProperty('error');
    return body;
  },

  assertPagination(body: any, expectedPage = 1) {
    expect(body).toHaveProperty('data');
    expect(Array.isArray(body.data)).toBe(true);
    expect(body).toHaveProperty('meta.total');
    expect(body).toHaveProperty('meta.page', expectedPage);
    expect(body).toHaveProperty('meta.limit');
  },

  assertTimestamps(body: any) {
    const isoRegex = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}/;
    expect(body.createdAt).toMatch(isoRegex);
    expect(body.updatedAt).toMatch(isoRegex);
    const created = new Date(body.createdAt);
    expect(created.getTime()).toBeLessThanOrEqual(Date.now());
  },
};
```

### 5.4 Soft Assertions — Non-Blocking Validation

```ts
// Collect all failures before throwing
test('validate complete user profile', async ({ request }) => {
  const response = await request.get(`/api/v1/users/${userId}`);
  const body = await response.json();

  // Soft assertions — all run regardless of failure
  expect.soft(response.status()).toBe(200);
  expect.soft(body.id).toMatch(/^usr_/);
  expect.soft(body.name).toBeTruthy();
  expect.soft(body.email).toContain('@');
  expect.soft(body.createdAt).toMatch(/^\d{4}/);
  expect.soft(body.password).toBeUndefined();

  // Hard assertion at end — throws if any soft failed
  expect(response.ok()).toBeTruthy();
});
```

> **TIP:** Use soft assertions for field-level validation where you want a complete failure report in a single test run. Use hard assertions for status code and critical structure checks — no point validating fields on a 500 response.

**Q: What is the difference between toEqual and toMatchObject?**
A: toEqual asserts deep strict equality — every property must match. toMatchObject asserts that the received object CONTAINS the expected subset — extra properties are allowed. For API responses with dynamic fields (id, timestamps), always use toMatchObject for partial shape validation.

---

## 06 — Authentication & Authorization
*Bearer tokens, API keys, OAuth 2.0, cookies, and multi-user scenarios*

### 6.1 Authentication Patterns in API Testing

| Pattern | Header/Mechanism | Common Use Case |
|---|---|---|
| Bearer Token (JWT) | `Authorization: Bearer {token}` | Most REST APIs |
| API Key (Header) | `X-API-Key: {key}` | Developer APIs, B2B |
| API Key (Query) | `?api_key={key}` | Legacy/Simple APIs |
| Basic Auth | `Authorization: Basic {base64}` | Internal services |
| OAuth 2.0 CC Flow | `POST /oauth/token` → Bearer | Machine-to-machine |
| OAuth 2.0 PKCE | Browser-based user auth | User-facing flows |
| Cookie Session | `Cookie: session={value}` | Web app testing |
| mTLS | Client certificate | Bank/Fintech APIs |

### 6.2 Bearer Token Authentication

```ts
// src/api/authApi.ts
import { APIRequestContext } from '@playwright/test';

export interface AuthToken {
  accessToken: string;
  tokenType: string;
  expiresIn: number;
  refreshToken?: string;
}

export class AuthAPI {
  constructor(private request: APIRequestContext) {}

  async loginUser(email: string, password: string): Promise<AuthToken> {
    const response = await this.request.post('/api/v1/auth/login', {
      data: { email, password },
    });
    if (!response.ok()) {
      throw new Error(`Login failed: ${response.status()}`);
    }
    return response.json();
  }

  async refreshToken(refreshToken: string): Promise<AuthToken> {
    const response = await this.request.post('/api/v1/auth/refresh', {
      data: { refresh_token: refreshToken },
    });
    return response.json();
  }
}
```

```ts
// Using token in tests
test('authenticated request with bearer token', async ({ request }) => {
  const authAPI = new AuthAPI(request);
  const { accessToken } = await authAPI.loginUser(
    process.env.TEST_USER_EMAIL!,
    process.env.TEST_USER_PASSWORD!
  );

  const response = await request.get('/api/v1/profile', {
    headers: { 'Authorization': `Bearer ${accessToken}` },
  });
  expect(response.status()).toBe(200);
});
```

### 6.3 OAuth 2.0 — Client Credentials Flow

```ts
// src/utils/oauthHelper.ts
export class OAuthHelper {
  private tokenCache: { token: string; expiresAt: number } | null = null;

  async getClientToken(request: APIRequestContext): Promise<string> {
    // Return cached token if still valid (with 60s buffer)
    if (this.tokenCache && Date.now() < this.tokenCache.expiresAt - 60_000) {
      return this.tokenCache.token;
    }

    const response = await request.post(
      `${process.env.AUTH_SERVER_URL}/oauth/token`,
      {
        form: {
          grant_type: 'client_credentials',
          client_id: process.env.CLIENT_ID!,
          client_secret: process.env.CLIENT_SECRET!,
          scope: 'users:read users:write',
        },
      }
    );

    const { access_token, expires_in } = await response.json();
    this.tokenCache = {
      token: access_token,
      expiresAt: Date.now() + expires_in * 1000,
    };
    return access_token;
  }
}
```

### 6.4 Authorization Testing — RBAC Scenarios

```ts
// Test role-based access control
test.describe('RBAC — Role-based Access Control', () => {

  const roles = [
    { role: 'admin', endpoint: '/api/v1/admin/users', expected: 200 },
    { role: 'editor', endpoint: '/api/v1/admin/users', expected: 403 },
    { role: 'viewer', endpoint: '/api/v1/admin/users', expected: 403 },
  ];

  for (const { role, endpoint, expected } of roles) {
    test(`${role} accessing admin endpoint → ${expected}`, async ({ request }) => {
      const token = await getTokenForRole(request, role);
      const response = await request.get(endpoint, {
        headers: { Authorization: `Bearer ${token}` },
      });
      expect(response.status()).toBe(expected);
    });
  }
});
```

### 6.5 Authentication Negative Tests

```ts
test.describe('Auth negative scenarios', () => {

  test('returns 401 with no token', async ({ request }) => {
    const res = await request.get('/api/v1/users');
    expect(res.status()).toBe(401);
  });

  test('returns 401 with expired token', async ({ request }) => {
    const expiredToken = 'eyJhbGciOiJSUzI1NiJ9.EXPIRED.sig';
    const res = await request.get('/api/v1/users', {
      headers: { Authorization: `Bearer ${expiredToken}` },
    });
    expect(res.status()).toBe(401);
    const body = await res.json();
    expect(body.error).toMatch(/expired|invalid/i);
  });

  test('returns 401 with malformed token', async ({ request }) => {
    const res = await request.get('/api/v1/users', {
      headers: { Authorization: 'Bearer not-a-real-token' },
    });
    expect(res.status()).toBe(401);
  });
});
```

> **ARCHITECT INSIGHT:** Always test authentication at the boundary: no token, expired token, wrong-role token, token for wrong tenant (multi-tenancy), and tampered payload. These are the most commonly exploited API vulnerabilities — your test suite is also a security check.

---

## 07 — Environment Configuration & Multi-Env Strategy
*Dev, Staging, Production — environment-agnostic test suites*

### 7.1 Environment Configuration Design

```bash
# .env.dev
TEST_ENV=dev
API_BASE_URL=https://dev-api.example.com
AUTH_SERVER_URL=https://dev-auth.example.com
TEST_USER_EMAIL=testuser@dev.example.com
TEST_USER_PASSWORD=Dev@12345
CLIENT_ID=dev-client-001
CLIENT_SECRET=dev-secret-abc
TENANT_ID=tenant-dev
LOG_LEVEL=debug

# .env.staging
TEST_ENV=staging
API_BASE_URL=https://staging-api.example.com
AUTH_SERVER_URL=https://staging-auth.example.com
LOG_LEVEL=info
```

```ts
// src/config/envConfig.ts
import * as dotenv from 'dotenv';

const ENV = process.env.TEST_ENV || 'dev';
dotenv.config({ path: `.env.${ENV}`, override: true });

function require(key: string): string {
  const val = process.env[key];
  if (!val) throw new Error(`Missing env var: ${key}`);
  return val;
}

export const Config = {
  env: ENV,
  baseURL: require('API_BASE_URL'),
  authServerURL: require('AUTH_SERVER_URL'),
  testUserEmail: require('TEST_USER_EMAIL'),
  testUserPass: require('TEST_USER_PASSWORD'),
  clientId: require('CLIENT_ID'),
  clientSecret: require('CLIENT_SECRET'),
  tenantId: process.env.TENANT_ID || 'default',
  logLevel: process.env.LOG_LEVEL || 'info',
  isCI: Boolean(process.env.CI),
} as const;

// Validate at import time
console.log(`[Config] ENV=${Config.env} BASE=${Config.baseURL}`);
```

### 7.2 Running Tests Per Environment

```bash
# Run against dev (default)
npx playwright test

# Run against staging
TEST_ENV=staging npx playwright test

# Run specific project on staging
TEST_ENV=staging npx playwright test --project=api-smoke

# Override base URL inline (quick spot-check)
API_BASE_URL=https://pr-123-api.example.com npx playwright test

# Production read-only smoke tests
TEST_ENV=prod npx playwright test tests/smoke/ --project=api-smoke
```

> **WARNING:** Never commit .env files containing credentials to version control. Use .gitignore for all .env.* files. In CI/CD, inject secrets via environment variables through your CI system (GitHub Secrets, GitLab CI Variables, AWS Parameter Store).

### 7.3 Global Setup — Authenticate Once Per Suite

```ts
// src/global-setup.ts
import { chromium, request } from '@playwright/test';
import { Config } from './config/envConfig';

async function globalSetup() {
  const apiContext = await request.newContext({
    baseURL: Config.baseURL,
  });

  const tokenRes = await apiContext.post('/oauth/token', {
    form: {
      grant_type: 'client_credentials',
      client_id: Config.clientId,
      client_secret: Config.clientSecret,
    },
  });

  const { access_token } = await tokenRes.json();
  // Store token for all workers via env
  process.env.API_ACCESS_TOKEN = access_token;
  await apiContext.dispose();
  console.log('[Global Setup] Auth token acquired');
}

export default globalSetup;

// playwright.config.ts — register global setup
// globalSetup: './src/global-setup.ts'
```

---

## 08 — Test Data Management & Dynamic Data
*Factories, Faker, seeding, and isolation strategies*

### 8.1 Test Data Strategies

| Strategy | How It Works | When to Use |
|---|---|---|
| Data Factory | Generate fresh data per test | Unit/Integration tests |
| Database Seed | Pre-load fixed data before suite | Regression suites |
| API-created | Create via API in beforeEach/All | Integration tests |
| Static Fixtures | JSON files checked into repo | Contract/Schema tests |
| Shared Pool | Shared read-only test accounts | E2E smoke tests |

### 8.2 Data Factory with Faker.js

```ts
// src/utils/dataFactory.ts
import { faker } from '@faker-js/faker';

export const UserFactory = {
  validUser(overrides: Partial<UserPayload> = {}): UserPayload {
    return {
      name: faker.person.fullName(),
      email: faker.internet.email({ provider: 'testmail.example.com' }),
      phone: faker.phone.number('+91 ##########'),
      role: 'viewer',
      department: faker.commerce.department(),
      active: true,
      address: {
        line1: faker.location.streetAddress(),
        city: faker.location.city(),
        state: faker.location.state(),
        postalCode: faker.location.zipCode(),
        country: 'IN',
      },
      ...overrides,
    };
  },

  adminUser(overrides = {}): UserPayload {
    return this.validUser({ role: 'admin', department: 'Leadership', ...overrides });
  },

  minimalUser(): Pick<UserPayload, 'name' | 'email'> {
    return {
      name: faker.person.fullName(),
      email: faker.internet.email({ provider: 'testmail.example.com' }),
    };
  },
};

export const OrderFactory = {
  singleItemOrder(customerId: string) {
    return {
      customerId,
      items: [{
        productId: `prod_${faker.string.alphanumeric(6)}`,
        quantity: faker.number.int({ min: 1, max: 5 }),
        unitPrice: parseFloat(faker.commerce.price({ min: 10, max: 500 })),
      }],
    };
  },
};
```

### 8.3 Isolated Test Data via beforeEach/afterEach

```ts
test.describe('User CRUD with isolated data', () => {
  let userId: string;

  test.beforeEach(async ({ request }) => {
    // Create fresh user before each test
    const res = await request.post('/api/v1/users', {
      data: UserFactory.validUser(),
    });
    expect(res.status()).toBe(201);
    userId = (await res.json()).id;
  });

  test.afterEach(async ({ request }) => {
    // Clean up after each test (best-effort)
    if (userId) {
      await request.delete(`/api/v1/users/${userId}`).catch(() => {});
    }
  });

  test('can retrieve created user', async ({ request }) => {
    const res = await request.get(`/api/v1/users/${userId}`);
    expect(res.status()).toBe(200);
  });

  test('can update created user', async ({ request }) => {
    const res = await request.patch(`/api/v1/users/${userId}`, {
      data: { role: 'editor' },
    });
    expect(res.status()).toBe(200);
  });
});
```

### 8.4 Static Test Fixtures

```ts
// tests/fixtures/users.json
{
  "validUsers": [
    { "name": "Alice Admin", "email": "alice@fixture.com", "role": "admin" },
    { "name": "Bob Editor", "email": "bob@fixture.com", "role": "editor" },
    { "name": "Carol Viewer", "email": "carol@fixture.com", "role": "viewer" }
  ],
  "invalidUsers": [
    { "name": "", "email": "valid@email.com" },
    { "name": "John", "email": "not-an-email" },
    { "name": "Jane", "email": "" }
  ]
}

// Usage in test
import users from '../fixtures/users.json';

for (const invalidUser of users.invalidUsers) {
  test(`rejects invalid user: ${JSON.stringify(invalidUser)}`, async ({ request }) => {
    const res = await request.post('/api/v1/users', { data: invalidUser });
    expect(res.status()).toBe(400);
  });
}
```

---

## 09 — Positive, Negative & Boundary Testing
*Complete test coverage strategy for every API endpoint*

### 9.1 Test Coverage Matrix

For each endpoint, structure your tests in four quadrants:

| Quadrant | Focus | Assert |
|---|---|---|
| Positive (Happy Path) | Valid input, expected output | 200/201 + body shape |
| Negative (Client Error) | Invalid input, missing fields | 400/409/422 + error message |
| Auth Boundary | Token absent/expired/wrong role | 401/403 |
| Edge Cases | Empty strings, max length, nulls | 400 or 200 per contract |

### 9.2 Comprehensive Negative Test Suite — POST /users

```ts
const negativeScenarios = [
  // Missing required fields
  { desc: 'missing name', data: { email: 'a@b.com' }, status: 400 },
  { desc: 'missing email', data: { name: 'Alice' }, status: 400 },
  { desc: 'empty body', data: {}, status: 400 },
  // Invalid formats
  { desc: 'invalid email', data: { name: 'A', email: 'not-email' }, status: 400 },
  { desc: 'name too long', data: { name: 'A'.repeat(256), email: 'a@b.com' }, status: 400 },
  { desc: 'name empty string', data: { name: '', email: 'a@b.com' }, status: 400 },
  // Invalid types
  { desc: 'name is number', data: { name: 123, email: 'a@b.com' }, status: 400 },
  { desc: 'role invalid value', data: { name: 'A', email: 'a@b.com', role: 'superuser' }, status: 400 },
  // XSS / injection attempts
  { desc: 'XSS in name', data: { name: '<script>alert(1)</script>', email: 'a@b.com' }, status: 400 },
  { desc: 'SQL injection', data: { name: "'; DROP TABLE users;--", email: 'a@b.com' }, status: 400 },
];

for (const scenario of negativeScenarios) {
  test(`POST /users — ${scenario.desc}`, async ({ request }) => {
    const res = await request.post('/api/v1/users', { data: scenario.data });
    expect(res.status()).toBe(scenario.status);
    const body = await res.json();
    expect(body).toHaveProperty('error');
    expect(typeof body.error).toBe('string');
  });
}
```

### 9.3 Boundary Value Analysis — Field Limits

```ts
// Boundary Value Analysis for 'name' field (min:2, max:100 chars)
const nameBVA = [
  { desc: 'below min (1 char)', value: 'A', expected: 400 },
  { desc: 'at min (2 chars)', value: 'Al', expected: 201 },
  { desc: 'just above min (3 chars)', value: 'Ali', expected: 201 },
  { desc: 'nominal (20 chars)', value: 'A'.repeat(20), expected: 201 },
  { desc: 'just below max (99)', value: 'A'.repeat(99), expected: 201 },
  { desc: 'at max (100 chars)', value: 'A'.repeat(100), expected: 201 },
  { desc: 'above max (101 chars)', value: 'A'.repeat(101), expected: 400 },
];

for (const { desc, value, expected } of nameBVA) {
  test(`name BVA: ${desc}`, async ({ request }) => {
    const res = await request.post('/api/v1/users', {
      data: { name: value, email: `bva_${Date.now()}@test.com` },
    });
    expect(res.status()).toBe(expected);
  });
}
```

---

## 10 — Schema & Contract Validation
*Zod schemas, consumer-driven contracts, breaking change detection*

### 10.1 Why Contract Testing?

Contract testing verifies that the API response structure matches the documented contract. It catches breaking changes before they reach production and decouples consumer and provider development cycles.

| Level | What It Validates | Tool |
|---|---|---|
| JSON Schema | Field names, types, required fields | Zod / AJV |
| Response Shape | Object structure, array elements | Playwright + Zod |
| Consumer Contract | Consumer's expectations of provider | Pact.js |
| OpenAPI Validation | Response matches OpenAPI spec | dredd / schemathesis |

### 10.2 Zod Schema Validation

```ts
// src/models/user.schema.ts
import { z } from 'zod';

export const AddressSchema = z.object({
  line1: z.string().min(1),
  city: z.string().min(1),
  state: z.string().optional(),
  postalCode: z.string().regex(/^\d{5,10}$/),
  country: z.string().length(2),
});

export const UserResponseSchema = z.object({
  id: z.string().regex(/^usr_[a-z0-9]{6,}$/),
  name: z.string().min(2).max(100),
  email: z.string().email(),
  role: z.enum(['admin', 'editor', 'viewer']),
  active: z.boolean(),
  department: z.string().optional(),
  address: AddressSchema.optional(),
  createdAt: z.string().datetime(),
  updatedAt: z.string().datetime(),
  // Sensitive fields must NOT appear
  password: z.undefined(),
  internalScore: z.undefined(),
});

export const UserListSchema = z.object({
  data: z.array(UserResponseSchema),
  meta: z.object({
    total: z.number().nonnegative(),
    page: z.number().positive(),
    limit: z.number().positive(),
  }),
});
```

```ts
// Using Zod schemas in tests
import { UserResponseSchema, UserListSchema } from '../../src/models/user.schema';

test('GET /users response matches schema', async ({ request }) => {
  const res = await request.get('/api/v1/users', {
    params: { page: 1, limit: 5 },
  });
  expect(res.status()).toBe(200);
  const body = await res.json();

  // Parse validates structure + types — throws on mismatch
  const validated = UserListSchema.parse(body);
  expect(validated.data.length).toBeLessThanOrEqual(5);
});

test('POST /users response matches schema', async ({ request }) => {
  const res = await request.post('/api/v1/users', {
    data: UserFactory.validUser(),
  });
  expect(res.status()).toBe(201);
  const body = await res.json();

  const result = UserResponseSchema.safeParse(body);
  if (!result.success) {
    console.error('Schema errors:', result.error.format());
  }
  expect(result.success).toBe(true);
});
```

---

## 11 — API Chaining & Dependent Test Flows
*End-to-end workflows, response threading, and state management*

### 11.1 API Chaining Pattern

Real business flows span multiple API calls. API chaining uses output from one request as input to the next — modelling actual user journeys.

```ts
// Complete Order Flow: Register → Auth → Create Order → Verify → Cancel
test('End-to-end order lifecycle', async ({ request }) => {

  // Step 1: Create Customer
  const userRes = await request.post('/api/v1/users', {
    data: UserFactory.validUser(),
  });
  expect(userRes.status()).toBe(201);
  const { id: customerId } = await userRes.json();

  // Step 2: Authenticate
  const authRes = await request.post('/api/v1/auth/login', {
    data: { userId: customerId, apiKey: process.env.API_KEY },
  });
  expect(authRes.status()).toBe(200);
  const { accessToken } = await authRes.json();
  const authHeaders = { Authorization: `Bearer ${accessToken}` };

  // Step 3: Create Order
  const orderRes = await request.post('/api/v1/orders', {
    data: OrderFactory.singleItemOrder(customerId),
    headers: authHeaders,
  });
  expect(orderRes.status()).toBe(201);
  const { id: orderId, status: initialStatus } = await orderRes.json();
  expect(initialStatus).toBe('pending');

  // Step 4: Retrieve Order
  const getOrderRes = await request.get(`/api/v1/orders/${orderId}`, {
    headers: authHeaders,
  });
  expect(getOrderRes.status()).toBe(200);
  const order = await getOrderRes.json();
  expect(order.customerId).toBe(customerId);

  // Step 5: Cancel Order
  const cancelRes = await request.patch(`/api/v1/orders/${orderId}/cancel`, {
    headers: authHeaders,
    data: { reason: 'Customer request' },
  });
  expect(cancelRes.status()).toBe(200);
  expect((await cancelRes.json()).status).toBe('cancelled');

  // Step 6: Cleanup
  await request.delete(`/api/v1/users/${customerId}`, { headers: authHeaders });
});
```

> **ARCHITECT INSIGHT:** Long chained tests are harder to debug because a failure in step 2 cascades to steps 3-6. Use descriptive `test.step()` blocks to isolate exactly which step failed. For very long flows (10+ steps), consider splitting into independent tests connected via test.describe shared state.

---

## 12 — Reusable Utilities, Fixtures & Hooks
*DRY test infrastructure with Playwright's extension model*

### 12.1 Custom API Fixtures

```ts
// src/fixtures/apiFixtures.ts
import { test as base, APIRequestContext } from '@playwright/test';
import { UserAPI } from '../api/userApi';
import { AuthAPI } from '../api/authApi';
import { OAuthHelper } from '../utils/oauthHelper';
import { Config } from '../config/envConfig';

type APIFixtures = {
  userAPI: UserAPI;
  authAPI: AuthAPI;
  adminRequest: APIRequestContext;
  viewerRequest: APIRequestContext;
  createdUser: { id: string; email: string };
};

export const test = base.extend<APIFixtures>({

  userAPI: async ({ request }, use) => {
    await use(new UserAPI(request));
  },

  authAPI: async ({ request }, use) => {
    await use(new AuthAPI(request));
  },

  adminRequest: async ({ playwright }, use) => {
    const ctx = await playwright.request.newContext({
      baseURL: Config.baseURL,
      extraHTTPHeaders: {
        Authorization: `Bearer ${process.env.ADMIN_TOKEN}`,
        'Content-Type': 'application/json',
      },
    });
    await use(ctx);
    await ctx.dispose();
  },

  createdUser: async ({ request }, use) => {
    // Setup: create user before test
    const api = new UserAPI(request);
    const user = await api.create(UserFactory.validUser());
    await use({ id: user.id, email: user.email });
    // Teardown: cleanup after test
    await api.delete(user.id).catch(() => {});
  },
});

export { expect } from '@playwright/test';
```

```ts
// Using fixtures in tests — clean, zero-boilerplate
import { test, expect } from '../../src/fixtures/apiFixtures';

test('admin can view all users', async ({ adminRequest }) => {
  const res = await adminRequest.get('/api/v1/users');
  expect(res.status()).toBe(200);
});

test('update created user role', async ({ userAPI, createdUser }) => {
  const updated = await userAPI.patch(createdUser.id, { role: 'editor' });
  expect(updated.role).toBe('editor');
  // createdUser cleanup runs automatically after this test
});
```

### 12.2 Hooks Reference

| Hook | Scope | Typical Use |
|---|---|---|
| `test.beforeAll()` | Once per describe block | Authenticate, seed shared test data |
| `test.afterAll()` | Once per describe block | Delete test users, clear shared state |
| `test.beforeEach()` | Each test | Create isolated test user/resource |
| `test.afterEach()` | Each test | Delete test resource, reset state |
| `globalSetup` | Entire suite | Acquire auth tokens, start test server |
| `globalTeardown` | Entire suite | Stop test server, final DB cleanup |

### 12.3 Reusable API Client Classes

```ts
// src/api/userApi.ts
import { APIRequestContext } from '@playwright/test';
import { UserResponseSchema } from '../models/user.schema';

export class UserAPI {
  private readonly base = '/api/v1/users';

  constructor(private request: APIRequestContext) {}

  async create(payload: UserPayload) {
    const res = await this.request.post(this.base, { data: payload });
    if (res.status() !== 201) throw new Error(`Create failed: ${res.status()}`);
    return UserResponseSchema.parse(await res.json());
  }

  async getById(id: string) {
    const res = await this.request.get(`${this.base}/${id}`);
    if (res.status() !== 200) throw new Error(`Get failed: ${res.status()}`);
    return UserResponseSchema.parse(await res.json());
  }

  async patch(id: string, updates: Partial<UserPayload>) {
    const res = await this.request.patch(`${this.base}/${id}`, { data: updates });
    return UserResponseSchema.parse(await res.json());
  }

  async delete(id: string): Promise<void> {
    await this.request.delete(`${this.base}/${id}`);
  }

  async list(params = {}) {
    const res = await this.request.get(this.base, { params });
    return res.json();
  }
}
```

---

## 13 — Parallel Execution, Retries & Timeouts
*Speed, resilience, and reliability at scale*

### 13.1 Parallel Execution Architecture

Playwright runs each spec file in a separate worker process. API tests are ideal for parallelism because they don't share browser state.

```ts
// playwright.config.ts — parallel tuning
export default defineConfig({
  workers: process.env.CI ? 8 : 4,   // CI: use more workers
  fullyParallel: true,                // parallelize within spec files too

  // Per-project worker override
  projects: [
    {
      name: 'api-smoke',
      testMatch: '**/*.smoke.spec.ts',
      // Smoke runs fast — no worker override needed
    },
    {
      name: 'api-load-simulation',
      testMatch: '**/load/*.spec.ts',
      workers: 1, // sequential for rate-sensitive suites
    },
  ],
});
```

### 13.2 Test Isolation for Parallel Safety

```ts
// WRONG — shared state breaks parallel tests
let sharedUserId: string;
test.beforeAll(async ({ request }) => {
  sharedUserId = (await createUser(request)).id; // race condition risk
});

// RIGHT — each test owns its data
test('update user role', async ({ request }) => {
  // Create, use, delete — all within one test
  const { id } = await createUser(request, UserFactory.validUser());
  const res = await request.patch(`/api/v1/users/${id}`, {
    data: { role: 'editor' },
  });
  expect(res.status()).toBe(200);
  await request.delete(`/api/v1/users/${id}`);
});
```

### 13.3 Retries Configuration

```ts
// playwright.config.ts
export default defineConfig({
  retries: process.env.CI ? 2 : 0,

  // Per-test retry override
});

// tests/flaky-third-party.spec.ts
test('call flaky payment gateway', async ({ request }) => {
  // ... test code
});
test.describe.configure({ retries: 3 }); // describe-level retry

// Retry with custom logic
test('idempotent operation with retry', async ({ request }, testInfo) => {
  if (testInfo.retry > 0) {
    console.log(`Retry attempt ${testInfo.retry}`);
    await new Promise(r => setTimeout(r, 2000 * testInfo.retry)); // backoff
  }
  const res = await request.post('/api/v1/payments', { data: paymentPayload });
  expect(res.status()).toBe(201);
});
```

### 13.4 Timeout Configuration Hierarchy

| Level | Config Key | Default | Scope |
|---|---|---|---|
| Global test | `timeout` | 30s | Each test function |
| Global action | `actionTimeout` | none | Each request/action |
| Per-test override | `test.setTimeout()` | — | Single test |
| Per-request | `options.timeout` | 30s | Single API call |
| `expect().toPass()` | `timeout` param | 0 | Polling assertion |

```ts
// Timeout examples
export default defineConfig({
  timeout: 30_000, // 30s per test
  use: {
    actionTimeout: 10_000, // 10s per API call
  },
});

// Override in test
test('long-running export job', async ({ request }) => {
  test.setTimeout(120_000); // 2 minutes for this test

  const res = await request.post('/api/v1/reports/export', {
    data: { format: 'csv', dateRange: '90d' },
    timeout: 60_000, // 60s for this specific request
  });
  expect(res.status()).toBe(202); // async job accepted
});
```

---

## 14 — Logging, Debugging & Tracing
*Root-cause API failures fast with structured diagnostics*

### 14.1 Request/Response Logging Utility

```ts
// src/utils/apiLogger.ts
import { APIResponse } from '@playwright/test';

export async function logResponse(
  label: string,
  response: APIResponse,
  logBody = true
): Promise<void> {
  const status = response.status();
  const url = response.url();
  const emoji = status < 300 ? '✓' : status < 500 ? '⚠' : '✗';

  console.log(`[${emoji} ${label}] ${status} ${url}`);

  if (logBody && status !== 204) {
    try {
      const body = await response.json();
      console.log(JSON.stringify(body, null, 2));
    } catch {
      const text = await response.text();
      console.log(text.substring(0, 500));
    }
  }
}

// Usage in tests
const res = await request.post('/api/v1/users', { data: payload });
await logResponse('Create User', res);
expect(res.status()).toBe(201);
```

### 14.2 Playwright Trace for API Tests

```ts
// playwright.config.ts
use: {
  trace: 'on-first-retry', // capture on first retry
  // Options: 'off' | 'on' | 'retain-on-failure' | 'on-first-retry'
},

// Manual trace capture in test
import { request } from '@playwright/test';

const apiContext = await request.newContext();
// Start recording
await apiContext.storageState(); // triggers trace on context

// Open the trace viewer
// npx playwright show-trace trace.zip
```

### 14.3 Troubleshooting Guide

| Symptom | Likely Root Cause | Solution |
|---|---|---|
| 401 Unexpectedly | Token expired mid-test | Refresh token in beforeEach |
| Connection refused | Wrong baseURL env var | Print Config.baseURL on startup |
| Request timeout | Slow API, too-short timeout | Increase timeout, check server logs |
| 429 Too Many Requests | Tests too fast, rate-limited | Add delay, reduce workers |
| Flaky parallel tests | Shared test data mutation | Use per-test data isolation |
| JSON parse error | API returned HTML (error page) | Check response.text() first |
| ECONNRESET | Network blip in CI | Add retry=2, increase timeout |
| Schema validation fail | API contract changed | Update Zod schema, notify API team |

---

## 15 — CI/CD Integration
*GitHub Actions, GitLab CI, Jenkins — production pipeline patterns*

### 15.1 GitHub Actions — Complete Pipeline

```yaml
# .github/workflows/api-tests.yml
name: API Automation Tests

on:
  push: { branches: [main, develop] }
  pull_request: { branches: [main] }
  schedule: [{ cron: '0 */4 * * *' }] # Every 4 hours

jobs:
  api-tests:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        env: [dev, staging]
    steps:
      - uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with: { node-version: '20', cache: 'npm' }

      - name: Install dependencies
        run: npm ci

      - name: Run API tests
        run: npx playwright test --project=api-full
        env:
          TEST_ENV: ${{ matrix.env }}
          API_BASE_URL: ${{ secrets[format('{0}_API_URL', matrix.env)] }}
          CLIENT_ID: ${{ secrets.CLIENT_ID }}
          CLIENT_SECRET: ${{ secrets.CLIENT_SECRET }}
          TEST_USER_EMAIL: ${{ secrets.TEST_USER_EMAIL }}
          TEST_USER_PASSWORD: ${{ secrets.TEST_USER_PASSWORD }}
          CI: true

      - name: Upload Playwright Report
        if: always()
        uses: actions/upload-artifact@v4
        with:
          name: playwright-report-${{ matrix.env }}
          path: reports/html/
          retention-days: 14
```

### 15.2 Test Execution Commands

```bash
# Run all API tests
npx playwright test

# Run specific project
npx playwright test --project=api-smoke

# Run single test file
npx playwright test tests/user/user.create.spec.ts

# Run tests matching pattern
npx playwright test --grep "POST /users"

# Run with specific workers
npx playwright test --workers=8

# Debug mode (headed, single worker)
npx playwright test --debug

# Generate HTML report after run
npx playwright show-report reports/html

# List all tests without running
npx playwright test --list
```

---

## 16 — API + UI Integration Testing
*Combining API and browser automation in a single Playwright test*

### 16.1 Why Combine API and UI?

| Pattern | Description | Speed Gain |
|---|---|---|
| API Setup + UI Test | Create data via API, verify in UI | 4-10x faster setup |
| UI Test + API Verify | Click in browser, assert via API | Reliable state check |
| API Teardown | Delete test data via API after UI test | No leftover data |
| Token Inject | Get auth token via API, inject to browser | Skip login UI |

### 16.2 API Setup → UI Verification

```ts
// Create user via API, then verify they appear in admin UI
import { test, expect } from '@playwright/test';

test('new user appears in admin dashboard', async ({ request, page }) => {

  // API: Create user (fast)
  const payload = UserFactory.validUser({ role: 'editor' });
  const createRes = await request.post('/api/v1/users', { data: payload });
  expect(createRes.status()).toBe(201);
  const { id: userId } = await createRes.json();

  // UI: Verify in browser
  await page.goto('/admin/users');
  await page.waitForSelector('[data-testid="user-table"]');

  // Search for the created user
  await page.fill('[data-testid="search-input"]', payload.email);
  await expect(page.getByText(payload.name)).toBeVisible();
  await expect(page.getByText('Editor')).toBeVisible();

  // API: Cleanup
  await request.delete(`/api/v1/users/${userId}`);
});
```

### 16.3 Skip UI Login with API Token

```ts
// Get token via API → inject into browser storage → skip login page
test('access dashboard without UI login', async ({ request, page }) => {

  // Get auth token via API (fast)
  const authRes = await request.post('/api/v1/auth/login', {
    data: {
      email: process.env.TEST_USER_EMAIL,
      password: process.env.TEST_USER_PASSWORD,
    },
  });
  const { accessToken } = await authRes.json();

  // Inject token into browser localStorage
  await page.addInitScript((token) => {
    window.localStorage.setItem('auth_token', token);
  }, accessToken);

  // Navigate directly to protected page — no login UI needed
  await page.goto('/dashboard');
  await expect(page.getByTestId('dashboard-header')).toBeVisible();
  expect(page.url()).not.toContain('/login');
});
```

---

## 17 — Security Considerations in API Automation
*Testing for OWASP API Top 10 vulnerabilities*

### 17.1 OWASP API Security Top 10 — Test Coverage

| OWASP Risk | What to Test | Assertion |
|---|---|---|
| API1: BOLA | Access another user's resource by ID | 403 expected |
| API2: Broken Auth | Expired token, no token, wrong format | 401 expected |
| API3: Broken Object Prop Auth | PATCH with admin-only fields | 403 or fields unchanged |
| API4: Unrestricted Resource | Create 1000 resources in loop | 429 rate limit |
| API5: Broken Function Auth | Viewer calling admin endpoint | 403 expected |
| API6: SSRF | URL params pointing to internal hosts | 400 expected |
| API8: Security Misconfiguration | Sensitive headers exposed | Headers checked |
| API10: Unsafe Consumption | Inject via third-party data | 400 expected |

### 17.2 BOLA Test — Access Another User's Data

```ts
test('BOLA: user cannot access another user\'s resource', async ({ request }) => {
  // Create two users
  const [user1, user2] = await Promise.all([
    createUserAndGetToken(request, 'user1@test.com'),
    createUserAndGetToken(request, 'user2@test.com'),
  ]);

  // user2 tries to read user1's private data
  const res = await request.get(`/api/v1/users/${user1.id}/private-data`, {
    headers: { Authorization: `Bearer ${user2.token}` },
  });

  // Must be 403 Forbidden — not 200, not 404 (which reveals resource exists)
  expect(res.status()).toBe(403);
});
```

### 17.3 Sensitive Data Exposure Tests

```ts
test('response does not expose sensitive fields', async ({ request }) => {
  const res = await request.get(`/api/v1/users/${userId}`);
  const user = await res.json();

  // These fields must NEVER appear in any API response
  const sensitiveFields = [
    'password', 'passwordHash', 'salt',
    'internalScore', 'creditCardNumber',
    'ssn', 'taxId', 'authToken',
  ];

  for (const field of sensitiveFields) {
    expect.soft(user[field], `Field '${field}' must not be exposed`
    ).toBeUndefined();
  }
});
```

> **ARCHITECT INSIGHT:** Include at least one security test per endpoint in your regression suite. BOLA and broken auth are the top two API vulnerabilities in production systems. Your automated suite should catch these regressions before every release.

---

## 18 — Framework Architecture & Production Strategy
*Enterprise-grade API automation — architect-level design decisions*

### 18.1 Layered Architecture Diagram

A production API automation framework has four clear layers:

```
┌─────────────────────────────────────────────────────────────────┐
│ TEST LAYER                                                       │
│ spec files │ smoke.spec │ regression.spec │ contract.spec        │
├─────────────────────────────────────────────────────────────────┤
│ FIXTURE LAYER                                                    │
│ apiFixtures.ts │ dataFixtures.ts │ authFixtures.ts               │
├─────────────────────────────────────────────────────────────────┤
│ API CLIENT LAYER                                                 │
│ UserAPI │ OrderAPI │ AuthAPI │ ReportAPI │ PaymentAPI            │
├─────────────────────────────────────────────────────────────────┤
│ UTILITY LAYER                                                    │
│ dataFactory │ assertHelper │ oauthHelper │ apiLogger │ envConfig │
├─────────────────────────────────────────────────────────────────┤
│ INFRASTRUCTURE LAYER                                             │
│ playwright.config.ts │ global-setup.ts │ .env.{env} files        │
└─────────────────────────────────────────────────────────────────┘
```

### 18.2 Architecture Decision Records

| Decision | Choice | Rationale |
|---|---|---|
| Test runner | Playwright Test | Native API client, fixtures, parallel, CI |
| Language | TypeScript | Type safety, IDE support, Zod integration |
| Schema validation | Zod | Runtime type checking, TS inference |
| Test data | Faker.js Factory | Isolated per test, no collision risk |
| Auth strategy | Global setup + token env | Single auth, workers share token |
| Environment config | dotenv per env | Simple, CI-compatible, secret-safe |
| Reporting | HTML + JSON | Human-readable + CI parseable |
| Parallel workers | 8 (CI) / 2 (local) | Speed vs resource balance |
| Retry policy | 2 retries on CI | Handles transient network issues |

### 18.3 Test Suite Structure Recommendation

| Suite Tier | Count | Scope | Runs In |
|---|---|---|---|
| Smoke | 10-20 | Critical happy paths only | Every PR, <2 min |
| Regression | 200-500 | Full CRUD + negative tests | Nightly, PR merge |
| Contract | Per model | Schema validation | Every PR |
| Security | 20-50 | OWASP checks per endpoint | Weekly / pre-release |
| Performance | 5-10 | Response time thresholds | Pre-release |

### 18.4 Production Checklist

- Environment-agnostic: all URLs and secrets in .env files, no hard-coding
- Test isolation: every test creates and destroys its own data
- Typed: TypeScript strict mode, Zod-validated API responses
- Layered: Test → Fixture → API Client → Utility — no logic leaking across layers
- Parallel-safe: no shared mutable state between parallel workers
- Auth coverage: positive + all negative auth scenarios per endpoint
- Contract tests: Zod schema for every response object
- OWASP coverage: BOLA, broken auth, sensitive exposure for every endpoint
- CI pipeline: automated on push + nightly schedule
- Reporting: HTML report uploaded as CI artifact, JSON for dashboards
- Retries: 2 retries with exponential backoff in CI
- Logging: structured request/response logs on test failure
- Secret management: secrets via CI environment variables only
- Cleanup: afterEach/afterAll deletes test data regardless of test outcome

**Q: How would you architect API automation for a microservices system with 50 services?**
A: Organize tests by service domain, not by HTTP method. Each service gets its own API client class, Zod schema, and spec folder. Shared utilities (auth, factories, helpers) live in a common package. Use a monorepo (Nx or Turborepo) with per-service test projects in playwright.config. Global setup handles auth once. CI triggers only affected service tests on PR, full suite nightly.

**Q: What is your strategy for flaky API tests in CI?**
A: First, eliminate root causes: shared test data causes most flakiness — fix with per-test isolation. Second, verify the API isn't inherently unstable (rate limits, async jobs). Third, add retries (max 2) with exponential backoff for genuine transient issues. Fourth, tag flaky tests and track them in a dashboard. Never accept long-term flakiness — it erodes trust in the entire suite.

---

## Appendix A — Quick Reference & Troubleshooting
*Cheat sheets, common errors, and checklist summaries*

### A.1 Playwright API Testing Cheat Sheet

```ts
// Create context
const ctx = await playwright.request.newContext({ baseURL, extraHTTPHeaders });

// CRUD
await request.get('/resource', { params: {}, headers: {} });
await request.post('/resource', { data: {}, headers: {} });
await request.put('/resource/id', { data: {} });
await request.patch('/resource/id', { data: {} });
await request.delete('/resource/id');

// OAuth form post
await request.post('/token', { form: { grant_type, client_id, client_secret } });

// File upload
await request.post('/upload', { multipart: { file: { name, mimeType, buffer } } });

// Response
response.status(); response.ok();
await response.json(); await response.text();
response.headers(); response.header('content-type');

// Assertions
expect(res.status()).toBe(200);
expect(body).toMatchObject({ id: expect.any(String) });
expect(body.roles).toContain('admin');
expect(body.password).toBeUndefined();
const validated = MySchema.parse(body); // Zod

// Run commands
npx playwright test                          # all tests
npx playwright test --project=api-smoke      # project
npx playwright test --grep 'POST'            # pattern
TEST_ENV=staging npx playwright test         # env
```

### A.2 HTTP Status Code Quick Reference

| 2xx — Success | 3xx — Redirect | 4xx — Client Error | 5xx — Server Error |
|---|---|---|---|
| 200 OK | 301 Moved Perm | 400 Bad Request | 500 Internal Error |
| 201 Created | 302 Found | 401 Unauthorized | 501 Not Implemented |
| 202 Accepted | 304 Not Modified | 403 Forbidden | 502 Bad Gateway |
| 204 No Content | 307 Temp Redirect | 404 Not Found | 503 Service Unavail |
| 206 Partial | 308 Perm Redirect | 409 Conflict | 504 Gateway Timeout |
| | | 422 Unprocessable | |
| | | 429 Too Many Reqs | |

### A.3 Automation Architect Interview — Key Questions

**Q: How do you prevent API test suite from becoming a maintenance burden?**
A: Three principles: (1) API Client classes abstract request details — tests only call methods. (2) Data factories generate fresh data — no fragile fixed IDs. (3) Zod schemas catch contract breaks automatically — no manual response field tracking.

**Q: Describe your approach to test data management in a shared environment.**
A: Each test owns its data: create in beforeEach, delete in afterEach with `.catch()`. Use unique identifiers (faker email with timestamp) to prevent collision. Never rely on pre-seeded data that other tests might mutate.

**Q: How do you handle authentication token management at scale?**
A: Acquire one service-level token in globalSetup, store in process.env. Each worker reads the same token. Add a 60-second expiry buffer to refresh proactively. For user-level tokens (RBAC tests), use per-describe fixtures.

**Q: What metrics do you track to measure API test suite health?**
A: Flakiness rate (target <1%), average suite duration, coverage per endpoint (happy path + at least 3 negative cases), contract validation count, and time-to-detect per regression category.

**Q: How would you introduce Playwright API testing into a team using Postman?**
A: Start by migrating smoke tests only (5-10 critical flows). Show the CI integration and HTML reports. Then migrate negative test suites. Keep Postman for exploratory testing and documentation. The transition is gradual — prove value per sprint.

### A.4 Final Production Readiness Checklist

- [ ] 01. playwright.config.ts uses environment variables for baseURL and all secrets
- [ ] 02. globalSetup acquires service token once — no per-test login overhead
- [ ] 03. All API clients are typed with TypeScript interfaces
- [ ] 04. Every response is validated with a Zod schema
- [ ] 05. beforeEach creates test data, afterEach deletes it (with `.catch(() => {})`)
- [ ] 06. No hard-coded user IDs, emails, or tokens in test files
- [ ] 07. Negative tests cover all required fields, type errors, and auth boundaries
- [ ] 08. BOLA test exists for every resource endpoint
- [ ] 09. CI workflow runs on push, PR, and nightly schedule
- [ ] 10. HTML and JSON reports are uploaded as CI artifacts
- [ ] 11. retries: 2 is set in CI environment
- [ ] 12. fullyParallel: true with worker count tuned per environment
- [ ] 13. console.error with response body logged on assertion failure
- [ ] 14. Security scan: sensitive fields asserted absent in all GET responses
- [ ] 15. All secrets are in CI environment variables — never in code or .env in git

---

*Playwright API Automation Testing — Practical Enterprise Guide © 2026 Enterprise QA Series*
