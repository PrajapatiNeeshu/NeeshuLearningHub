# Playwright Best Practices

## Test Organization

### Fixture Pattern
```python
import pytest
from playwright.sync_api import sync_playwright

@pytest.fixture(scope="session")
def browser():
    """Single browser instance for entire session"""
    with sync_playwright() as p:
        yield p.chromium.launch()

@pytest.fixture
def context(browser):
    """New context for each test"""
    ctx = browser.new_context()
    yield ctx
    ctx.close()

@pytest.fixture
def page(context):
    """New page for each test"""
    page = context.new_page()
    yield page
    page.close()

def test_login(page):
    page.goto("https://example.com")
    # Test code
```

## Page Object Model (POM)

```python
class LoginPage:
    """Page object for login functionality"""
    
    def __init__(self, page):
        self.page = page
        self.username_input = "input[name='username']"
        self.password_input = "input[name='password']"
        self.login_button = "button[type='submit']"
    
    def navigate(self):
        self.page.goto("https://example.com/login")
    
    def login(self, username, password):
        self.page.fill(self.username_input, username)
        self.page.fill(self.password_input, password)
        self.page.click(self.login_button)
    
    def get_error_message(self):
        return self.page.text_content(".error-message")

class DashboardPage:
    def __init__(self, page):
        self.page = page
        self.welcome_heading = "h1:has-text('Welcome')"
    
    def is_logged_in(self):
        return self.page.is_visible(self.welcome_heading)

# Usage
def test_successful_login(page):
    login_page = LoginPage(page)
    login_page.navigate()
    login_page.login("user@example.com", "password123")
    
    dashboard = DashboardPage(page)
    assert dashboard.is_logged_in()
```

## Wait Strategies

### ❌ Bad: Sleep

```python
import time
page.click("button")
time.sleep(2)  # Unreliable!
```

### ✅ Good: Explicit Waits

```python
# Wait for element to appear
page.wait_for_selector("button.success")

# Wait for specific condition
page.wait_for_function("() => document.querySelectorAll('li').length > 5")

# Wait for navigation
page.click("a", wait_until="networkidle")

# Wait for loader to disappear
page.wait_for_load_state("networkidle")
```

## Error Handling

```python
from playwright.sync_api import TimeoutError

def test_element_with_retry(page):
    try:
        page.wait_for_selector("button", timeout=3000)
    except TimeoutError:
        # Take screenshot for debugging
        page.screenshot(path="error.png")
        raise

def test_with_optional_element(page):
    # Check if element exists without error
    if page.query_selector("popup.close-button"):
        page.click("popup.close-button")
    
    # Continue with test
    assert page.is_visible("main-content")
```

## Parallel Execution

### Using pytest-xdist

```bash
# Install
pip install pytest-xdist

# Run in parallel
pytest -n auto tests/
```

### Configuration
```python
# pytest.ini
[pytest]
addopts = -n auto

# conftest.py
def pytest_configure(config):
    config.addinivalue_line(
        "markers", "ui: mark test as UI test"
    )
```

## Running Tests

### Command-line Options

```bash
# Headed mode (see browser)
pytest --headed

# Specific browser
pytest --browser chromium

# With tracing
pytest --tracing on

# Record video
pytest --video on

# Verbose output
pytest -v

# Stop on first failure
pytest -x

# Disable parallelization
pytest -n 0
```

## Debugging

### Using Debugger

```python
def test_with_debugger(page):
    page.goto("https://example.com")
    page.pause()  # Pause here to debug
    page.click("button")
```

### Using Inspector

```bash
# Launch Codegen to record
playwright codegen https://example.com

# View trace
playwright show-trace trace.zip
```

### Using trace-viewer

```python
context = browser.new_context()
context.tracing.start(screenshots=True, snapshots=True, sources=True)

page = context.new_page()
page.goto("https://example.com")
page.click("button")

context.tracing.stop(path="trace.zip")
```

## Performance Testing

```python
def test_page_load_performance(page):
    import time
    
    start = time.time()
    page.goto("https://example.com", wait_until="networkidle")
    load_time = time.time() - start
    
    print(f"Page load time: {load_time:.2f}s")
    assert load_time < 3, "Page too slow"

def test_first_contentful_paint(page):
    metrics = page.evaluate("() => JSON.stringify(window.performance.timing)")
    # Parse and assert metrics
```

## Security in Tests

```python
# Use environment variables for credentials
import os

def test_login_secure(page):
    username = os.getenv("TEST_USERNAME")
    password = os.getenv("TEST_PASSWORD")
    
    page.goto("https://example.com/login")
    page.fill("input[name='username']", username)
    page.fill("input[name='password']", password)
    page.click("button[type='submit']")
```

## Test Data Management

```python
import json

class TestData:
    @staticmethod
    def load_test_users():
        with open("test_data/users.json") as f:
            return json.load(f)

def test_with_multiple_users(page):
    users = TestData.load_test_users()
    
    for user in users:
        page.goto("https://example.com/login")
        page.fill("input[name='username']", user["username"])
        page.fill("input[name='password']", user["password"])
        page.click("button[type='submit']")
        
        if user["should_login"]:
            assert page.is_visible("text=Dashboard")
        else:
            assert page.is_visible("text=Invalid credentials")
```

## CI/CD Integration

### GitHub Actions Example

```yaml
name: Playwright Tests

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
      - run: pip install -r requirements-test.txt
      
      - run: playwright install
      - run: pytest --headed=false
      
      - uses: actions/upload-artifact@v3
        if: always()
        with:
          name: playwright-report
          path: playwright-report/
```

## Common Pitfalls

| Issue | Solution |
|-------|----------|
| Flaky tests | Use explicit waits, avoid hard sleeps |
| Timeout errors | Increase timeout, check selector |
| Navigation issues | Use wait_until parameter |
| Stale elements | Re-query elements, don't cache |
| Synchronization | Use proper wait strategies |
| Resource leaks | Always close browser/context/page |

## Checklist

- [ ] Use Page Object Model
- [ ] Use role selectors when possible
- [ ] Wait for elements explicitly
- [ ] Handle errors gracefully
- [ ] Use fixtures for setup/teardown
- [ ] Run tests in parallel
- [ ] Monitor performance
- [ ] Clear test data after tests
- [ ] Use CI/CD integration
- [ ] Document complex test flows

---

**Back to**: [Playwright Basics](playwright-basics.md)
