# Playwright Basics

## What is Playwright?

Playwright is a modern automation library for testing and automating web applications across all major browsers: Chromium, Firefox, and WebKit.

## Key Features

- 🎭 **Cross-browser**: Chromium, Firefox, WebKit
- ⚡ **Fast**: Optimized for speed
- 🔄 **Sync & Async**: Support for both
- 📱 **Mobile Testing**: Built-in mobile emulation
- 🎥 **Recording**: Codegen for test recording
- 🔍 **Debugging**: Inspector and trace viewer
- 🌐 **Multiple Languages**: Python, JavaScript, Java, .NET

## Installation

### Python

```bash
# Install Playwright
pip install playwright

# Install browsers
playwright install
```

### Node.js

```bash
npm install -D @playwright/test
npx playwright install
```

## Basic Setup (Python)

```python
from playwright.sync_api import sync_playwright

def test_example():
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()
        page.goto("https://example.com")
        print(page.title())
        browser.close()
```

## Common Operations

### Navigation
```python
page.goto("https://example.com")
page.go_back()
page.go_forward()
page.reload()
```

### Selectors
```python
# CSS selector
page.click("button.submit")

# XPath
page.click("//button[@class='submit']")

# Playwright selectors
page.click("text=Click me")
```

### Waiting

```python
# Wait for element
page.wait_for_selector("button")

# Wait for navigation
page.wait_for_load_state("networkidle")

# Wait for timeout
page.wait_for_timeout(1000)
```

### Forms

```python
# Fill input
page.fill("input[name='username']", "testuser")

# Select option
page.select_option("select#country", "USA")

# Check checkbox
page.check("input[type='checkbox']")

# Submit form
page.click("button[type='submit']")
```

### Getting Information

```python
# Get text
text = page.text_content("h1")

# Get attribute
href = page.get_attribute("a", "href")

# Check if element exists
exists = page.query_selector("button") is not None

# Get inner HTML
html = page.inner_html("div.container")
```

## Screenshots & Videos

```python
# Take screenshot
page.screenshot(path="screenshot.png")

# Record video
context = browser.new_context(record_video_dir="videos/")
page = context.new_page()
# ... perform actions ...
context.close()

# Record trace
context = browser.new_context()
context.tracing.start(screenshots=True, snapshots=True)
# ... perform actions ...
context.tracing.stop(path="trace.zip")
```

## Browser Context

```python
# Create new context (like new incognito window)
context = browser.new_context(
    viewport={"width": 1920, "height": 1080},
    locale="en-US",
    timezone_id="US/Eastern"
)

page = context.new_page()
# Use page
context.close()
```

## Handling Popups & Dialogs

```python
# Handle alert
page.on("dialog", lambda dialog: dialog.accept())

# Handle popup
with page.expect_popup() as popup_info:
    page.click("a[target='_blank']")
popup = popup_info.value
```

## Network Interception

```python
# Mock responses
def handler(route):
    if "api/data" in route.request.url:
        route.abort()
    else:
        route.continue_()

page.route("**/*", handler)
```

## Performance Testing

```python
# Measure page load time
import time
start = time.time()
page.goto("https://example.com", wait_until="networkidle")
load_time = time.time() - start
print(f"Load time: {load_time}s")
```

## Best Practices

!!! note "Playwright Best Practices"
    - Use modern selectors (text=, role=)
    - Wait for conditions, not fixed times
    - Use fixtures for setup/teardown
    - Always close browser resources
    - Use headless mode for CI/CD
    - Implement proper waits
    - Handle errors gracefully
    - Use page.expect_* for navigation
    - Avoid XPath when possible
    - Use parallel execution

## Testing Framework Integration

### pytest Example

```python
import pytest
from playwright.sync_api import sync_playwright

@pytest.fixture
def browser():
    with sync_playwright() as p:
        yield p.chromium.launch()

@pytest.fixture
def page(browser):
    context = browser.new_context()
    page = context.new_page()
    yield page
    context.close()

def test_login(page):
    page.goto("https://app.example.com")
    page.fill("input[name='username']", "user")
    page.fill("input[name='password']", "pass")
    page.click("button[type='submit']")
    assert page.is_visible("text=Dashboard")
```

## Debugging

```python
# Use inspector
# Run in code: page.pause()

# Enable trace
context.tracing.start(screenshots=True, snapshots=True)

# View trace
# npx playwright show-trace trace.zip
```

## Common Issues

| Issue | Solution |
|-------|----------|
| Element not found | Use proper wait, check selector |
| Timeout | Wait for network idle, increase timeout |
| Flaky tests | Use explicit waits, avoid sleep() |
| Slow tests | Parallel execution, optimize selectors |

---

**Next**: Continue to [Advanced Selectors](advanced-selectors.md)
