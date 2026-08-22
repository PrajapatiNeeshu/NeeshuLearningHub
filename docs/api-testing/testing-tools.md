# API Testing Tools

## Popular API Testing Tools

### Postman

**Pros**
- User-friendly GUI
- Great for manual and automated testing
- Excellent documentation
- Newman CLI for CI/CD
- Free and paid versions

**Setup**
```bash
# Install Newman (CLI)
npm install -g newman

# Run collection
newman run collection.json
```

**Example Collection**
```json
{
  "info": {
    "name": "User API Tests",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "Get Users",
      "request": {
        "method": "GET",
        "url": "https://api.example.com/users"
      }
    }
  ]
}
```

### Python - requests

**Simple and Pythonic**

```python
import requests

# GET request
response = requests.get("https://api.example.com/users")
print(response.json())
print(response.status_code)

# POST request
payload = {"name": "John", "email": "john@example.com"}
response = requests.post("https://api.example.com/users", json=payload)

# Headers and auth
headers = {"Authorization": "Bearer token123"}
response = requests.get("https://api.example.com/users", headers=headers)

# Timeouts and retries
response = requests.get(url, timeout=5, retries=3)
```

### Python - httpx

**Modern async support**

```python
import httpx
import asyncio

# Sync
with httpx.Client() as client:
    response = client.get("https://api.example.com/users")

# Async
async def fetch_users():
    async with httpx.AsyncClient() as client:
        response = await client.get("https://api.example.com/users")
        return response.json()

asyncio.run(fetch_users())
```

### pytest-httpserver

**Mock HTTP server for testing**

```python
import pytest
from pytest_httpserver import HTTPServer

def test_api_with_mock(httpserver: HTTPServer):
    httpserver.expect_request("/users").respond_with_json(
        {"status": "success", "data": []}
    )
    
    # Your code that calls the mock server
    response = requests.get(httpserver.url_for("/users"))
    assert response.json()["status"] == "success"
```

### pytest-vcr

**Record and replay HTTP interactions**

```bash
pip install pytest-vcr
```

```python
def test_api_with_vcr(vcr):
    with vcr.use_cassette("cassettes/users.yaml"):
        response = requests.get("https://api.example.com/users")
        assert response.status_code == 200
```

First run records the cassette, subsequent runs replay it.

### REST Assured (Java)

```java
@Test
public void testGetUser() {
    given()
        .header("Authorization", "Bearer token")
    .when()
        .get("https://api.example.com/users/1")
    .then()
        .statusCode(200)
        .body("name", equalTo("John"));
}
```

### Insomnia

**Alternative to Postman**

- Open source
- Lightweight
- Great UI
- Good for REST and GraphQL

## Testing Best Practices

### Arrange-Act-Assert Pattern

```python
import requests

def test_create_user():
    # Arrange
    url = "https://api.example.com/users"
    payload = {
        "name": "John Doe",
        "email": "john@example.com"
    }
    
    # Act
    response = requests.post(url, json=payload)
    
    # Assert
    assert response.status_code == 201
    assert response.json()["name"] == "John Doe"
```

### Test Different Scenarios

```python
class TestUserAPI:
    
    def test_get_existing_user(self):
        response = requests.get("https://api.example.com/users/1")
        assert response.status_code == 200
    
    def test_get_non_existing_user(self):
        response = requests.get("https://api.example.com/users/99999")
        assert response.status_code == 404
    
    def test_create_user_invalid_email(self):
        payload = {"name": "John", "email": "invalid"}
        response = requests.post("https://api.example.com/users", json=payload)
        assert response.status_code == 400
```

### Test Response Schema

```python
from jsonschema import validate

user_schema = {
    "type": "object",
    "properties": {
        "id": {"type": "integer"},
        "name": {"type": "string"},
        "email": {"type": "string", "format": "email"}
    },
    "required": ["id", "name", "email"]
}

def test_user_response_schema():
    response = requests.get("https://api.example.com/users/1")
    validate(instance=response.json(), schema=user_schema)
```

### Performance Testing

```python
import time

def test_api_response_time():
    start = time.time()
    response = requests.get("https://api.example.com/users")
    elapsed = time.time() - start
    
    assert elapsed < 0.5, f"API took {elapsed}s, max allowed is 0.5s"
```

### Load Testing with locust

```bash
pip install locust
```

```python
from locust import HttpUser, task

class APIUser(HttpUser):
    @task
    def get_users(self):
        self.client.get("/users")
    
    @task(3)
    def get_user_details(self):
        self.client.get("/users/1")
```

Run with: `locust -f locustfile.py --host=https://api.example.com`

## API Testing Pyramid

```
       △
      /  \
     / E2E \     Manual tests (Exploratory)
    /______\
      /  \
     / UI  \    Playwright, Selenium
    /______\
    /      \
   /  API   \   Unit + Integration tests
  /________\
   /      \
  / Unit    \  Component testing
 /________\
```

## Continuous Integration Example

```yaml
# .github/workflows/api-tests.yml
name: API Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-python@v4
        with:
          python-version: '3.11'
      
      - run: pip install -r requirements.txt
      - run: pytest tests/api/
      
      - name: Performance Test
        run: pytest tests/performance/ --benchmark-cli
```

## Common Assertions

```python
# Status codes
assert response.status_code == 200

# Response body
assert response.json()["status"] == "success"

# Headers
assert "application/json" in response.headers["Content-Type"]

# Response time
assert response.elapsed.total_seconds() < 1

# Content presence
assert "John" in response.text
```

---

**Back to**: [API Fundamentals](api-fundamentals.md)
