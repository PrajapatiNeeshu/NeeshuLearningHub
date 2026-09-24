# API Automation Using Playwright + Python

## 1. Can Playwright be used for API Testing?

### Answer

Yes. Playwright provides built-in API testing capabilities through:

```python
playwright.request.new_context()
```

This allows testers to execute:

- GET Requests
- POST Requests
- PUT Requests
- PATCH Requests
- DELETE Requests

without opening a browser.

### Benefits

✅ Fast Execution

✅ Built-in Authentication Support

✅ API + UI Validation in Same Framework

✅ Supports CI/CD

✅ Easy Request Chaining

---

## 2. How Do You Make a GET Request Using Playwright?

```python
from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    request_context = p.request.new_context()

    response = request_context.get(
        "https://api.example.com/users"
    )

    print(response.status)
    print(response.json())
```

---

## 3. How Do You Make a POST Request?

```python
payload = {
    "name": "Neeshu",
    "role": "SDET"
}

response = request_context.post(
    "https://api.example.com/users",
    data=payload
)

assert response.status == 201
```

---

## 4. How Do You Pass Headers?

```python
response = request_context.get(
    "/users",
    headers={
        "Authorization": "Bearer token",
        "Content-Type": "application/json"
    }
)
```

---

## 5. How To Handle Authentication?

### Bearer Token

```python
headers={
    "Authorization": f"Bearer {token}"
}
```

---

### API Key

```python
headers={
    "x-api-key": api_key
}
```

---

### Basic Authentication

```python
headers={
    "Authorization": "Basic encoded_value"
}
```

---

## 6. How Do You Validate API Responses?

### Status Code Validation

```python
assert response.status == 200
```

### Response Body Validation

```python
data = response.json()

assert data["name"] == "Neeshu"
```

### Header Validation

```python
assert response.headers["content-type"] == "application/json"
```

---

## 7. How Do You Perform API Chaining?

### Create User

```python
create_response = request_context.post(
    "/users",
    data=payload
)

user_id = create_response.json()["id"]
```

### Get User

```python
get_response = request_context.get(
    f"/users/{user_id}"
)

assert get_response.status == 200
```

---

## 8. How Do You Handle Dynamic Values?

Examples:

- IDs
- Timestamps
- UUIDs
- Session Tokens

Instead of:

```python
assert response["id"] == 100
```

Use:

```python
assert response["id"] is not None
```

Validate:

- Presence
- Format
- Length
- Pattern

---

## 9. How Do You Implement Data-Driven Testing?

Using PyTest Parameterization.

```python
import pytest

@pytest.mark.parametrize(
    "user_id",
    [1,2,3]
)
def test_get_user(user_id):
    pass
```

---

## 10. How Do You Generate API Reports?

Popular Reporting Tools:

- Allure Reports
- PyTest HTML Reports
- Playwright HTML Reports

Example:

```bash
pytest --alluredir=allure-results
```

Generate Report:

```bash
allure serve allure-results
```

---

## 11. What Framework Structure Do You Use?

```text
api_framework/
│
├── config/
├── test_data/
├── endpoints/
├── payloads/
├── utils/
├── tests/
│   ├── api/
│   └── ui/
├── reports/
├── conftest.py
├── requirements.txt
└── pytest.ini
```

---

## 12. What Is the Advantage of Playwright API Testing Over RestAssured?

### RestAssured

- Java Based
- API Only
- Highly Popular

### Playwright

- Python/JavaScript/.NET/Java
- API + UI Automation
- Shared Authentication Context
- Faster E2E Validation

### Example

Login Through API:

```python
token = login_api()
```

Open UI:

```python
page.goto(url)
```

Validate logged-in user directly without UI login.

This reduces execution time significantly.

---

# Playwright API Interview Questions

### Basic

1. Can Playwright be used for API automation?
2. How do you make GET and POST requests?
3. How do you pass headers and tokens?
4. How do you validate API responses?

### Intermediate

5. How do you chain API requests?
6. How do you perform data-driven API testing?
7. How do you share authentication between API and UI tests?
8. How do you validate API contracts?

### Advanced

9. How do you build a scalable API framework using Playwright + PyTest?
10. How do you manage environments (QA/Staging/Prod)?
11. How do you implement retries and logging?
12. How do you integrate API automation into Jenkins or GitHub Actions?


Since your current stack is:
Playwright + Python ✅
PyTest ✅
API Testing ✅
Jenkins ✅
Allure ✅
AWS/Cloud ✅
