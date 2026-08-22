# Advanced Selectors

## Playwright Locator Strategy

Playwright provides multiple ways to locate elements with varying levels of specificity and reliability.

## 1. Text Selectors

### Exact Match
```python
page.click("text=Click me")
page.click("text='Exact Match'")
```

### Partial Match
```python
page.click("text=Click")  # Matches "Click me", "Click here"
```

### Case-Insensitive
```python
page.click("text=/click/i")  # Matches "CLICK", "Click", "click"
```

## 2. Role Selectors (Recommended)

```python
# Button by role
page.click("role=button")

# Button with specific name
page.click("role=button[name='Submit']")

# Link
page.click("role=link[name='Home']")

# Form elements
page.click("role=textbox[name='Username']")
page.click("role=checkbox[name='Remember me']")
```

## 3. CSS Selectors

### Basic
```python
page.click("button")                    # Tag name
page.click(".btn")                      # Class
page.click("#submit")                   # ID
page.click("[type='submit']")           # Attribute
```

### Child/Descendant
```python
page.click("form > button")             # Direct child
page.click("form button")               # Any descendant
```

### Complex
```python
page.click("input[name='username'][required]")
page.click("div.container > button.btn-primary")
page.click("form#loginForm input[type='password']")
```

### Pseudo-classes
```python
page.click("button:first-child")
page.click("button:last-of-type")
page.click("input:focus")
page.click("li:nth-child(2)")
```

## 4. XPath Selectors

### Basic
```python
page.click("//button")                  # Any button
page.click("//button[@id='submit']")   # Button with ID
page.click("//div[@class='container']") # Div with class
```

### Navigation
```python
page.click("//input/following-sibling::button")  # Next button
page.click("//div[@id='form']/descendant::input")# Any input in div
page.click("//button/parent::div")               # Parent div
```

### Text Functions
```python
page.click("//button[text()='Click me']")
page.click("//button[contains(text(), 'Click')]")
page.click("//button[starts-with(text(), 'Click')]")
```

!!! warning "XPath Warning"
    Avoid XPath when possible. It's slower and more fragile than other selectors.

## 5. Playwright Locators

### API-based Selector
```python
# Get locator
button = page.locator("button")

# Chain operations
button.click()
text = button.text_content()

# Filter
buttons = page.locators("button")
specific = buttons.filter(has_text="Save")
```

### Combining Locators
```python
# Locator and filter
page.locator("button").filter(has_text="Submit").click()

# Multiple conditions
page.locator("input").filter(has=page.locator("~label:has-text('Required')")).click()
```

## 6. Complex Strategies

### By Visible Text (Recommended)
```python
page.click("text=Login")              # Partial match
page.click("text=/^Login$/")          # Exact match with regex
```

### By Label (For forms)
```python
# Find input by associated label
page.fill("input[aria-label='Email']", "test@example.com")
```

### By Data Attributes
```python
page.click("[data-testid='submit-button']")
page.click("[data-qa='login-form']")
```

### By Placeholder
```python
page.fill("input[placeholder='Enter username']", "user123")
```

## 7. Debugging Selectors

### Inspector (Codegen)
```bash
playwright codegen https://example.com
```

### Using page.locator() with debug
```python
# Get all matching elements
locator = page.locator("button")
print(locator.count())

# Get specific nth element
locator.nth(0).click()

# Get first/last
locator.first.click()
locator.last.click()
```

### Testing Selectors
```python
# Check if element exists
exists = page.query_selector("button.submit") is not None

# Check if visible
visible = page.is_visible("button.submit")

# Check if enabled
enabled = page.is_enabled("button.submit")
```

## 8. Selector Comparison

| Selector Type | Speed | Reliability | Use Case |
|---|---|---|---|
| Text | ⚡⚡ | ⚡⚡ | Labels, buttons |
| Role | ⚡⚡⚡ | ⚡⚡⚡ | Semantic HTML |
| CSS | ⚡⚡⚡ | ⚡⚡ | Complex structures |
| XPath | ⚡ | ⚡ | Last resort |
| Data attributes | ⚡⚡⚡ | ⚡⚡⚡ | Test-specific |

## Best Practice Hierarchy

```
1st Choice: role= selectors (most reliable)
2nd Choice: text= or data-testid (easy & reliable)
3rd Choice: CSS selectors (commonly available)
4th Choice: XPath (avoid if possible)
```

## Real-World Examples

### Login Form
```python
username_input = page.locator("role=textbox[name='Username or email']")
password_input = page.locator("role=textbox[name='Password']")
submit_button = page.locator("role=button[name='Sign in']")

username_input.fill("testuser")
password_input.fill("testpass123")
submit_button.click()
```

### Dynamic Table Row
```python
# Find row by cell text
row = page.locator("xpath=//tr[contains(td, 'John')]")

# Click edit button in that row
row.locator("button:has-text('Edit')").click()
```

### Navigation Menu
```python
# Find link by partial text
menu = page.locator("role=navigation")
about_link = menu.locator("text=/About Us/i")
about_link.click()
```

---

**Next**: Continue to [Best Practices](best-practices.md)
