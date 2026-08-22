# Test Automation Interview

## Automation Framework Design

### Q1: How would you design a test automation framework?
**Answer:**

```
┌─────────────────────────────────┐
│     Test Framework              │
├─────────────────────────────────┤
│ Presentation Layer              │
│ (Test Cases)                    │
├─────────────────────────────────┤
│ Business Logic Layer            │
│ (Page Object Model)             │
├─────────────────────────────────┤
│ API Layer                       │
│ (WebDriver, HTTP Client)        │
├─────────────────────────────────┤
│ Object Repository               │
│ (Selectors, Locators)           │
├─────────────────────────────────┤
│ Utility/Helper Functions        │
│ (Screenshots, Logging)          │
└─────────────────────────────────┘
```

**Components:**
1. Page Object Model (POM)
2. Test Data Management
3. Test Utilities
4. Logger & Reporting
5. Configuration Management
6. Test Execution Engine

---

### Q2: Explain Page Object Model (POM)
**Answer:**

Benefits:
- Code reusability
- Easy maintenance
- Better readability
- Reduced duplication

**Example:**
```python
class LoginPage:
    def __init__(self, page):
        self.page = page
        self.username_field = "input[name='username']"
        self.password_field = "input[name='password']"
        self.login_button = "button[type='submit']"
    
    def login(self, username, password):
        self.page.fill(self.username_field, username)
        self.page.fill(self.password_field, password)
        self.page.click(self.login_button)

class DashboardPage:
    def __init__(self, page):
        self.page = page
        self.welcome_text = "h1:has-text('Welcome')"
    
    def is_displayed(self):
        return self.page.is_visible(self.welcome_text)

# Usage
def test_login(page):
    login = LoginPage(page)
    login.login("user@example.com", "password")
    
    dashboard = DashboardPage(page)
    assert dashboard.is_displayed()
```

---

### Q3: How do you handle synchronization issues?
**Answer:**

**Synchronization Problem:**
```
Application doesn't load in expected time
→ Flaky tests
→ Unreliable results
```

**Solutions:**

1. **Implicit Wait** (Global)
```python
driver.implicitly_wait(10)  # Wait 10s for any element
```

2. **Explicit Wait** (Recommended)
```python
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

element = WebDriverWait(driver, 10).until(
    EC.presence_of_element_located(("id", "myElement"))
)
```

3. **Wait for Conditions**
```python
# Wait for network idle
page.wait_for_load_state("networkidle")

# Wait for element
page.wait_for_selector("button.submit", timeout=5000)

# Wait for function
page.wait_for_function("() => document.querySelectorAll('li').length > 5")
```

4. **Avoid Hard Waits**
```python
# ❌ Bad
import time
time.sleep(5)

# ✅ Good
page.wait_for_selector("button", timeout=5000)
```

---

### Q4: CI/CD Integration
**Answer:**

**GitHub Actions Example:**
```yaml
name: Automation Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-python@v4
        with:
          python-version: '3.11'
      
      - name: Install dependencies
        run: pip install -r requirements.txt
      
      - name: Run tests
        run: pytest tests/ --html=report.html
      
      - name: Upload report
        uses: actions/upload-artifact@v3
        if: always()
        with:
          name: test-report
          path: report.html
```

---

### Q5: How do you handle dynamic elements?
**Answer:**

**Challenge:** Elements appear/disappear dynamically

**Solutions:**

```python
# Solution 1: Wait and check count
elements = page.locators("button")
if elements.count() > 5:
    elements.nth(-1).click()  # Click last button

# Solution 2: Use contains text
page.click("button:has-text('Save')")

# Solution 3: Use data attributes
page.click("[data-testid='save-button']")

# Solution 4: Retry mechanism
def click_with_retry(locator, max_retries=3):
    for i in range(max_retries):
        try:
            page.click(locator)
            return True
        except:
            if i < max_retries - 1:
                time.sleep(1)
            else:
                raise
```

---

### Q6: Performance Testing in Automation
**Answer:**

```python
import time

def test_page_load_performance():
    start = time.time()
    page.goto("https://example.com")
    page.wait_for_load_state("networkidle")
    load_time = time.time() - start
    
    assert load_time < 3, f"Page took {load_time}s to load"

def test_element_visibility_time():
    start = time.time()
    page.wait_for_selector("button", timeout=5000)
    visibility_time = time.time() - start
    
    print(f"Element became visible in {visibility_time}s")

def test_with_performance_metrics():
    metrics = page.evaluate("""
        () => {
            const perf = window.performance.timing;
            return {
                dns: perf.domainLookupEnd - perf.domainLookupStart,
                tcp: perf.connectEnd - perf.connectStart,
                ttfb: perf.responseStart - perf.navigationStart,
                load: perf.loadEventEnd - perf.navigationStart
            }
        }
    """)
    
    print(f"DNS: {metrics['dns']}ms")
    print(f"TCP: {metrics['tcp']}ms")
    print(f"TTFB: {metrics['ttfb']}ms")
    print(f"Load: {metrics['load']}ms")
```

---

### Q7: Parallel Test Execution
**Answer:**

**Using pytest-xdist:**
```bash
# Install
pip install pytest-xdist

# Run in parallel (auto-detect CPU cores)
pytest -n auto

# Run with specific number of workers
pytest -n 4
```

**Configuration (pytest.ini):**
```ini
[pytest]
addopts = -n auto
markers =
    smoke: smoke tests
    regression: regression tests
```

**Considerations:**
- Tests must be independent
- Avoid shared state
- Don't modify global variables
- Clean up test data

---

### Q8: Test Reporting & Metrics
**Answer:**

**Key Metrics:**
```
Test Execution Time: How long tests take
Test Coverage: % of code covered
Pass Rate: % of passing tests
Failure Rate: % of failing tests
Flakiness: How often tests fail intermittently
Defect Density: Bugs per KLOC
```

**HTML Report Generation:**
```python
# Using pytest-html
pytest tests/ --html=report.html --self-contained-html

# Custom reporting
class TestReporter:
    def __init__(self):
        self.results = []
    
    def add_result(self, test_name, status, duration):
        self.results.append({
            'test': test_name,
            'status': status,
            'duration': duration
        })
    
    def generate_report(self):
        # Generate HTML/JSON report
        pass
```

---

### Q9: Flaky Test Handling
**Answer:**

**Causes of Flakiness:**
1. Improper synchronization
2. Environmental issues
3. Resource contention
4. Network latency
5. Timing issues

**Solutions:**
```python
# 1. Proper waits
page.wait_for_selector("element")  # Good
time.sleep(5)  # Bad

# 2. Retry logic
@pytest.mark.flaky(reruns=3)
def test_sometimes_fails():
    assert something()

# 3. Stable selectors
page.click("[data-testid='button']")  # Good
page.click(".dynamic-class-1234")  # Bad

# 4. Independent tests
# Don't share state between tests

# 5. Proper teardown
@pytest.fixture(autouse=True)
def cleanup():
    yield
    # Clean up resources
```

---

### Q10: Test Maintenance Strategy
**Answer:**

**Rules:**
```
If it breaks, ask:
1. Did the app change? → Update test
2. Did the selector change? → Update selector
3. Is it timing issue? → Add proper wait
4. Is test flaky? → Fix sync issue
```

**Best Practices:**
1. Keep tests DRY (Don't Repeat Yourself)
2. Use meaningful names
3. Comment complex logic
4. Version control tests
5. Regular refactoring
6. Remove obsolete tests
7. Document selectors
8. Use constants for locators

```python
# With constants
class Locators:
    LOGIN_BUTTON = "button[type='submit']"
    USERNAME_INPUT = "input[name='username']"
    ERROR_MESSAGE = ".error-message"

# In tests
page.click(Locators.LOGIN_BUTTON)
```

---

## Useful Resources

- [Playwright Documentation](https://playwright.dev/python/)
- [Selenium Documentation](https://www.selenium.dev/)
- [pytest Documentation](https://docs.pytest.org/)
- [Test Automation Best Practices](../playwright/best-practices.md)

---

**Back to**: [QA Interview](qa-interview.md)
