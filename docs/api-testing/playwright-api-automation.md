# Playwright API Automation Testing

## Practical Guide with JavaScript and Python

Playwright can test REST APIs directly through `APIRequestContext`. This lets you validate HTTP behavior, response data, authentication, and business workflows without opening a browser. The same API context can also be used alongside UI tests.

> The examples use `https://api.example.com` and `/api/v1/users` as placeholders. Replace them with the API and contract used by your project.

## What You Will Learn

- Configure Playwright API tests in JavaScript and Python
- Create reusable request clients and test fixtures
- Test GET, POST, PUT, PATCH, and DELETE operations
- Validate status codes, headers, body fields, and schemas
- Cover authentication, negative cases, API chaining, and cleanup
- Run API tests in parallel in CI/CD

## 1. Project Setup

### JavaScript / TypeScript

```bash
npm init -y
npm install -D @playwright/test
npx playwright install chromium
```

Recommended structure:

```text
playwright-api/
├── playwright.config.ts
├── tests/
│   ├── users.spec.ts
│   └── auth.spec.ts
├── src/
│   └── api/user-api.ts
└── package.json
```

### Python

```bash
python -m venv .venv
# Windows PowerShell
.venv\Scripts\Activate.ps1
pip install pytest-playwright
playwright install chromium
```

Recommended structure:

```text
playwright-api/
├── pytest.ini
├── tests/
│   ├── test_users.py
│   └── test_auth.py
└── clients/
    └── user_api.py
```

## 2. Configuration

### JavaScript / TypeScript

```typescript
// playwright.config.ts
import { defineConfig } from '@playwright/test';

export default defineConfig({
  testDir: './tests',
  timeout: 30_000,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 4 : 2,
  reporter: [['list'], ['html', { open: 'never' }]],
  use: {
    baseURL: process.env.API_BASE_URL ?? 'https://api.example.com',
    extraHTTPHeaders: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
    trace: 'on-first-retry',
  },
});
```

Run against another environment:

```bash
# PowerShell
$env:API_BASE_URL = 'https://staging-api.example.com'; npx playwright test

# Linux/macOS
API_BASE_URL=https://staging-api.example.com npx playwright test
```

### Python

```ini
# pytest.ini
[pytest]
addopts = -q
base_url = https://api.example.com
```

For environment-specific values, read an environment variable in a fixture rather than committing credentials:

```python
# tests/conftest.py
import os
import pytest
from playwright.sync_api import APIRequestContext, Playwright


@pytest.fixture(scope="session")
def api_context(playwright: Playwright) -> APIRequestContext:
    context = playwright.request.new_context(
        base_url=os.getenv("API_BASE_URL", "https://api.example.com"),
        extra_http_headers={
            "Accept": "application/json",
            "Content-Type": "application/json",
        },
    )
    yield context
    context.dispose()
```

## 3. First GET Test

### JavaScript / TypeScript

```typescript
// tests/users.spec.ts
import { test, expect } from '@playwright/test';

test('GET /users returns a list', async ({ request }) => {
  const response = await request.get('/api/v1/users', {
    params: { page: 1, limit: 10 },
  });

  expect(response.status()).toBe(200);
  expect(response.headers()['content-type']).toContain('application/json');

  const body = await response.json();
  expect(body).toHaveProperty('data');
  expect(Array.isArray(body.data)).toBe(true);
  expect(body.data.length).toBeLessThanOrEqual(10);
});
```

### Python

```python
# tests/test_users.py
from playwright.sync_api import APIRequestContext, expect


def test_get_users_returns_a_list(api_context: APIRequestContext):
    response = api_context.get(
        "/api/v1/users",
        params={"page": 1, "limit": 10},
    )

    expect(response).to_be_ok()
    assert response.status == 200
    assert "application/json" in response.headers["content-type"]

    body = response.json()
    assert isinstance(body["data"], list)
    assert len(body["data"]) <= 10
```

## 4. Complete CRUD Coverage

A reliable CRUD suite validates both the operation and its resulting state. Use unique test data and clean it up even when a test fails.

### Create: POST

```typescript
// JavaScript / TypeScript
const payload = {
  name: 'Alice Johnson',
  email: `alice-${Date.now()}@example.test`,
  role: 'viewer',
};

const createResponse = await request.post('/api/v1/users', { data: payload });
expect(createResponse.status()).toBe(201);

const createdUser = await createResponse.json();
expect(createdUser).toMatchObject({
  name: payload.name,
  email: payload.email,
  role: payload.role,
});
expect(createdUser.id).toEqual(expect.any(String));
```

```python
# Python
payload = {
    "name": "Alice Johnson",
    "email": f"alice-{unique_id}@example.test",
    "role": "viewer",
}

create_response = api_context.post("/api/v1/users", data=payload)
assert create_response.status == 201
created_user = create_response.json()
assert created_user["name"] == payload["name"]
assert isinstance(created_user["id"], str)
```

### Read: GET by ID

```typescript
// JavaScript / TypeScript
const getResponse = await request.get(`/api/v1/users/${createdUser.id}`);
expect(getResponse.status()).toBe(200);
const user = await getResponse.json();
expect(user.id).toBe(createdUser.id);
expect(user).not.toHaveProperty('password');
```

```python
# Python
get_response = api_context.get(f"/api/v1/users/{created_user['id']}")
assert get_response.status == 200
user = get_response.json()
assert user["id"] == created_user["id"]
assert "password" not in user
```

### Update: PUT and PATCH

`PUT` normally replaces the complete resource. `PATCH` changes only the fields included in the request. Assert that the intended field changed and protected fields did not change unexpectedly.

```typescript
// JavaScript / TypeScript
const patchResponse = await request.patch(`/api/v1/users/${createdUser.id}`, {
  data: { role: 'editor' },
});
expect(patchResponse.status()).toBe(200);
const patchedUser = await patchResponse.json();
expect(patchedUser.role).toBe('editor');
expect(patchedUser.id).toBe(createdUser.id);
```

```python
# Python
patch_response = api_context.patch(
    f"/api/v1/users/{created_user['id']}",
    data={"role": "editor"},
)
assert patch_response.status == 200
patched_user = patch_response.json()
assert patched_user["role"] == "editor"
assert patched_user["id"] == created_user["id"]
```

### Delete: DELETE

```typescript
// JavaScript / TypeScript
const deleteResponse = await request.delete(`/api/v1/users/${createdUser.id}`);
expect(deleteResponse.status()).toBe(204);

const verifyResponse = await request.get(`/api/v1/users/${createdUser.id}`);
expect(verifyResponse.status()).toBe(404);
```

```python
# Python
delete_response = api_context.delete(f"/api/v1/users/{created_user['id']}")
assert delete_response.status == 204

verify_response = api_context.get(f"/api/v1/users/{created_user['id']}")
assert verify_response.status == 404
```

## 5. Request Construction

### Headers and Query Parameters

```typescript
// JavaScript / TypeScript
const response = await request.get('/api/v1/reports', {
  headers: {
    Authorization: `Bearer ${process.env.API_TOKEN}`,
    'X-Tenant-ID': 'test-tenant',
    'X-Request-ID': `test-${Date.now()}`,
  },
  params: {
    status: 'active',
    page: 2,
    limit: 25,
  },
});
```

```python
# Python
response = api_context.get(
    "/api/v1/reports",
    headers={
        "Authorization": f"Bearer {api_token}",
        "X-Tenant-ID": "test-tenant",
        "X-Request-ID": f"test-{unique_id}",
    },
    params={"status": "active", "page": 2, "limit": 25},
)
```

For request bodies, use `data` for JSON, `form` for URL-encoded forms, and `multipart` for file uploads.

```typescript
await request.post('/oauth/token', {
  form: {
    grant_type: 'client_credentials',
    client_id: process.env.CLIENT_ID,
    client_secret: process.env.CLIENT_SECRET,
  },
});
```

```python
api_context.post(
    "/oauth/token",
    form={
        "grant_type": "client_credentials",
        "client_id": client_id,
        "client_secret": client_secret,
    },
)
```

## 6. Authentication and Authorization

Keep tokens in environment variables or CI secret stores. Never commit real credentials.

### Bearer Token

```typescript
// JavaScript / TypeScript
const tokenResponse = await request.post('/oauth/token', {
  form: {
    grant_type: 'client_credentials',
    client_id: process.env.CLIENT_ID,
    client_secret: process.env.CLIENT_SECRET,
  },
});
expect(tokenResponse.status()).toBe(200);
const { access_token: token } = await tokenResponse.json();

const protectedResponse = await request.get('/api/v1/profile', {
  headers: { Authorization: `Bearer ${token}` },
});
expect(protectedResponse.status()).toBe(200);
```

```python
# Python
token_response = api_context.post(
    "/oauth/token",
    form={
        "grant_type": "client_credentials",
        "client_id": client_id,
        "client_secret": client_secret,
    },
)
assert token_response.status == 200
token = token_response.json()["access_token"]

protected_response = api_context.get(
    "/api/v1/profile",
    headers={"Authorization": f"Bearer {token}"},
)
assert protected_response.status == 200
```

### Negative Authentication Tests

```typescript
// JavaScript / TypeScript
for (const [name, headers, expectedStatus] of [
  ['missing token', {}, 401],
  ['invalid token', { Authorization: 'Bearer invalid-token' }, 401],
  ['wrong role', { Authorization: `Bearer ${viewerToken}` }, 403],
] as const) {
  test(`${name} is rejected`, async ({ request }) => {
    const response = await request.get('/api/v1/admin/users', { headers });
    expect(response.status()).toBe(expectedStatus);
  });
}
```

```python
# Python
import pytest


@pytest.mark.parametrize(
    ("name", "headers", "expected_status"),
    [
        ("missing token", {}, 401),
        ("invalid token", {"Authorization": "Bearer invalid-token"}, 401),
    ],
)
def test_authentication_boundaries(api_context, name, headers, expected_status):
    response = api_context.get("/api/v1/admin/users", headers=headers)
    assert response.status == expected_status, name
```

## 7. API Chaining

API chaining passes a value from one response into the next request. Use `test.step` in JavaScript or clear helper functions in Python so failures identify the broken workflow step.

```typescript
// JavaScript / TypeScript
import { test, expect } from '@playwright/test';

test('customer can create and cancel an order', async ({ request }) => {
  const userResponse = await test.step('create customer', async () => {
    return request.post('/api/v1/users', {
      data: { name: 'Test Customer', email: `customer-${Date.now()}@example.test` },
    });
  });
  expect(userResponse.status()).toBe(201);
  const customer = await userResponse.json();

  const orderResponse = await test.step('create order', async () => {
    return request.post('/api/v1/orders', {
      data: { customerId: customer.id, items: [{ productId: 'prod-1', quantity: 1 }] },
    });
  });
  expect(orderResponse.status()).toBe(201);
  const order = await orderResponse.json();

  const cancelResponse = await test.step('cancel order', async () => {
    return request.patch(`/api/v1/orders/${order.id}/cancel`, {
      data: { reason: 'test cleanup' },
    });
  });
  expect(cancelResponse.status()).toBe(200);
});
```

```python
# Python
def test_customer_can_create_and_cancel_order(api_context):
    user_response = api_context.post(
        "/api/v1/users",
        data={"name": "Test Customer", "email": f"customer-{unique_id}@example.test"},
    )
    assert user_response.status == 201
    customer = user_response.json()

    order_response = api_context.post(
        "/api/v1/orders",
        data={"customerId": customer["id"], "items": [{"productId": "prod-1", "quantity": 1}]},
    )
    assert order_response.status == 201
    order = order_response.json()

    cancel_response = api_context.patch(
        f"/api/v1/orders/{order['id']}/cancel",
        data={"reason": "test cleanup"},
    )
    assert cancel_response.status == 200
```

## 8. Reusable API Clients

Put endpoint paths and common request logic in a client. Keep test files focused on scenarios and assertions.

```typescript
// src/api/user-api.ts
import { APIRequestContext } from '@playwright/test';

export class UserApi {
  constructor(private readonly request: APIRequestContext) {}

  async create(payload: object) {
    const response = await this.request.post('/api/v1/users', { data: payload });
    if (response.status() !== 201) {
      throw new Error(`Create user failed: ${response.status()}`);
    }
    return response.json();
  }

  async getById(id: string) {
    const response = await this.request.get(`/api/v1/users/${id}`);
    if (response.status() !== 200) {
      throw new Error(`Get user failed: ${response.status()}`);
    }
    return response.json();
  }

  async delete(id: string) {
    return this.request.delete(`/api/v1/users/${id}`);
  }
}
```

```python
# clients/user_api.py
from playwright.sync_api import APIRequestContext


class UserApi:
    def __init__(self, context: APIRequestContext):
        self.context = context

    def create(self, payload: dict) -> dict:
        response = self.context.post("/api/v1/users", data=payload)
        if response.status != 201:
            raise AssertionError(f"Create user failed: {response.status}")
        return response.json()

    def get_by_id(self, user_id: str) -> dict:
        response = self.context.get(f"/api/v1/users/{user_id}")
        if response.status != 200:
            raise AssertionError(f"Get user failed: {response.status}")
        return response.json()

    def delete(self, user_id: str):
        return self.context.delete(f"/api/v1/users/{user_id}")
```

## 9. Negative, Boundary, and Security Coverage

For every endpoint, include these groups:

| Group | Examples | Typical assertions |
| --- | --- | --- |
| Happy path | Valid request and expected data | `200`, `201`, response fields |
| Validation | Missing fields, invalid type, bad format | `400` or `422`, error contract |
| Authentication | Missing, expired, malformed token | `401` |
| Authorization | Wrong role or tenant | `403` |
| Resource state | Unknown ID, duplicate data | `404` or `409` |
| Boundaries | Empty, minimum, maximum, over-limit values | Contract-defined result |
| Security | BOLA, sensitive fields, injection payloads | Access denied, no leakage |

Example assertions:

```typescript
// JavaScript / TypeScript
const response = await request.post('/api/v1/users', {
  data: { name: '', email: 'not-an-email' },
});
expect(response.status()).toBe(400);
const error = await response.json();
expect(error).toHaveProperty('error');
expect(error.error).toEqual(expect.any(String));
```

```python
# Python
response = api_context.post(
    "/api/v1/users",
    data={"name": "", "email": "not-an-email"},
)
assert response.status == 400
error = response.json()
assert isinstance(error["error"], str)
```

Always verify that responses do not expose passwords, password hashes, tokens, payment data, or internal identifiers. Test object-level authorization by attempting to access another user's resource with a valid but different user's token.

## 10. Response and Schema Validation

Validate in layers: status, headers, structure, values, types, and business rules. For larger contracts, use a schema library such as Zod in TypeScript or `jsonschema`/Pydantic in Python.

```typescript
// JavaScript / TypeScript with Zod
import { z } from 'zod';

const UserSchema = z.object({
  id: z.string(),
  name: z.string().min(1),
  email: z.string().email(),
  role: z.enum(['admin', 'editor', 'viewer']),
});

const body = await response.json();
const user = UserSchema.parse(body);
expect(user.email).toContain('@');
```

```python
# Python with jsonschema
from jsonschema import validate

USER_SCHEMA = {
    "type": "object",
    "required": ["id", "name", "email", "role"],
    "properties": {
        "id": {"type": "string"},
        "name": {"type": "string", "minLength": 1},
        "email": {"type": "string", "format": "email"},
        "role": {"enum": ["admin", "editor", "viewer"]},
    },
}

body = response.json()
validate(instance=body, schema=USER_SCHEMA)
```

## 11. API and UI in One Test

Create data quickly through the API, verify it in the browser, and clean it up through the API.

```typescript
// JavaScript / TypeScript
import { test, expect } from '@playwright/test';

test('new user appears in the dashboard', async ({ request, page }) => {
  const payload = { name: 'UI Test User', email: `ui-${Date.now()}@example.test` };
  const createResponse = await request.post('/api/v1/users', { data: payload });
  expect(createResponse.status()).toBe(201);
  const { id } = await createResponse.json();

  await page.goto('/admin/users');
  await expect(page.getByText(payload.email)).toBeVisible();

  await request.delete(`/api/v1/users/${id}`);
});
```

Python uses the same approach with the `page` fixture:

```python
# Python

def test_new_user_appears_in_dashboard(api_context, page):
    payload = {"name": "UI Test User", "email": f"ui-{unique_id}@example.test"}
    create_response = api_context.post("/api/v1/users", data=payload)
    assert create_response.status == 201
    user_id = create_response.json()["id"]

    page.goto("/admin/users")
    expect(page.get_by_text(payload["email"])).to_be_visible()

    api_context.delete(f"/api/v1/users/{user_id}")
```

## 12. CI/CD Commands

### JavaScript / TypeScript

```bash
npx playwright test
npx playwright test tests/users.spec.ts
npx playwright test --grep "GET /users"
npx playwright test --project=api
npx playwright show-report
```

### Python

```bash
pytest
pytest tests/test_users.py -q
pytest -k "users"
pytest --tracing retain-on-failure
```

Example GitHub Actions steps:

```yaml
- uses: actions/checkout@v4
- uses: actions/setup-node@v4
  with:
    node-version: 20
- run: npm ci
- run: npx playwright test
  env:
    API_BASE_URL: ${{ secrets.API_BASE_URL }}
    API_TOKEN: ${{ secrets.API_TOKEN }}
```

For Python, replace the setup with `actions/setup-python@v5`, install `pytest-playwright`, install the browser, and run `pytest`. Store URLs and credentials in CI secrets, not in the repository.

## 13. Production Checklist

- [ ] Base URLs and credentials come from environment variables or CI secrets
- [ ] Every test has clear status and response assertions
- [ ] Tests use unique data and clean up created resources
- [ ] Positive, negative, boundary, authentication, and authorization cases exist
- [ ] Sensitive response fields are explicitly checked
- [ ] Repeated endpoint logic is moved into API clients or fixtures
- [ ] Tests are isolated and safe to run in parallel
- [ ] Retries are limited to CI and investigated rather than masking failures
- [ ] HTML, JSON, or trace artifacts are retained for failed runs
- [ ] Contract or schema validation protects important response shapes

## Quick Reference

| Need | JavaScript / TypeScript | Python |
| --- | --- | --- |
| GET | `request.get(url)` | `context.get(url)` |
| POST JSON | `request.post(url, { data })` | `context.post(url, data=data)` |
| Query params | `{ params: { page: 1 } }` | `params={"page": 1}` |
| Headers | `{ headers: { Authorization } }` | `headers={"Authorization": token}` |
| Status | `expect(response.status()).toBe(200)` | `assert response.status == 200` |
| JSON | `await response.json()` | `response.json()` |
| Test command | `npx playwright test` | `pytest` |

The strongest API suites focus on behavior and contracts rather than only checking that a request returned `200`. Test what the response means, what data changed, what access is allowed, and whether the system remains correct when inputs are invalid or unexpected.
