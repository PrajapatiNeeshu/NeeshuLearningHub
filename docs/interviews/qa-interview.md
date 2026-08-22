# QA Interview Questions

## General QA Concepts

### Q1: What is Quality Assurance (QA)?
**Answer:**
Quality Assurance is a systematic process to ensure that a software product meets defined quality standards and user requirements. It involves:
- Planning and preventing defects
- Testing at multiple levels
- Verifying functionality and performance
- Ensuring compliance and security

Key difference from QC:
- QA = Process-oriented (preventive)
- QC = Product-oriented (detective)

---

### Q2: Explain the Test Pyramid
**Answer:**
```
        △
       / \
      /E2E\      Few, slow, expensive
     /     \
    /-------\
   /  API   \    Medium, faster
  /         \
 /-----------\
/    Unit    \ Many, fast, cheap
/___________\
```

**Best Practice:**
- 70% Unit Tests
- 20% Integration/API Tests
- 10% UI/E2E Tests

---

### Q3: What are Test Levels?
**Answer:**

| Level | Scope | Examples |
|-------|-------|----------|
| Unit Testing | Single function/method | pytest, Unittest |
| Integration Testing | Multiple components | API tests, database tests |
| System Testing | Entire application | End-to-end scenarios |
| User Acceptance Testing | Business requirements | User workflows, real data |

---

### Q4: Types of Testing
**Answer:**

**Functional Testing:**
- Smoke Testing: Verify basic functionality
- Sanity Testing: After bug fixes/patches
- Regression Testing: Existing features still work
- Exploratory Testing: Ad-hoc testing without scripts

**Non-Functional Testing:**
- Performance Testing: Response time, load handling
- Security Testing: Vulnerability identification
- Usability Testing: User experience
- Compatibility Testing: Different browsers/OS

---

## QA Automation

### Q5: Why Automate Tests?
**Answer:**
1. **Speed**: Execute many tests quickly
2. **Coverage**: Test more scenarios
3. **Regression**: Catch regressions early
4. **Cost**: Reduce manual effort over time
5. **Consistency**: Same test every time
6. **CI/CD Integration**: Part of pipeline

---

### Q6: What Makes a Good Test?
**Answer:**
- **Reliable**: Passes consistently
- **Independent**: No dependencies on other tests
- **Fast**: Executes quickly
- **Focused**: Tests one thing
- **Maintainable**: Easy to understand and update
- **Reusable**: Can be reused in different contexts

**Acronym: RIFRMR**

---

### Q7: Test Automation Best Practices
**Answer:**
```python
# ✅ Good Test
def test_user_login_successful(page):
    """Verify user can login with valid credentials"""
    page.goto("https://example.com/login")
    page.fill("input[name='username']", "testuser")
    page.fill("input[name='password']", "password123")
    page.click("button[type='submit']")
    assert page.is_visible("text=Dashboard")

# ❌ Bad Test
def test_stuff(page):
    page.goto("https://example.com")
    page.click("button")
    time.sleep(5)  # Hard wait!
    page.click("input")
    page.fill("input", "sometext")
    page.click("button")
    if "success" in page.content():
        print("passed")
```

Key Practices:
1. One test = one assertion (or related assertions)
2. Clear test names
3. Use explicit waits, not sleeps
4. Independent tests
5. Proper error handling
6. Use fixtures/setup

---

## Bug Reporting

### Q8: Essential Components of Bug Report
**Answer:**

**Template:**
```
Title: Login button unresponsive on Mobile

Environment:
- OS: iOS 15.2
- Browser: Safari
- Device: iPhone 12
- Build Version: 1.2.3

Steps to Reproduce:
1. Open app on iPhone
2. Navigate to login page
3. Click "Login" button

Expected Result:
Login form should appear

Actual Result:
Button click has no effect, form doesn't appear

Severity: Critical (blocking functionality)
Priority: High

Attachments:
- Screenshot showing the issue
- Video of reproduction
- Browser console logs

Additional Info:
Works fine on Android and Desktop chrome
```

---

### Q9: Severity vs Priority
**Answer:**

| Aspect | Severity | Priority |
|--------|----------|----------|
| Definition | Impact on system | Order of fixing |
| Determined by | Technical impact | Business needs |
| Critical + Low | Fix first | Fix last |
| Low + High | Nice to have | Fix immediately |

**Example:**
- Critical + High: Security vulnerability
- Critical + Low: Typo in admin panel (rarely used)
- Low + High: UI issue in frequently-used feature

---

## Test Strategy

### Q10: What Should a Test Strategy Include?
**Answer:**

1. **Scope**: What will be tested
2. **Approach**: Which testing methods
3. **Team Structure**: Roles and responsibilities
4. **Timeline**: Schedule and phases
5. **Test Environment**: System setup required
6. **Entry/Exit Criteria**: Start and end conditions
7. **Resources**: Tools and budget
8. **Risks**: Potential issues and mitigation

---

### Q11: When to Stop Testing?
**Answer:**

Practical criteria:
1. All planned tests executed
2. Critical defects fixed
3. Coverage targets met
4. Risk tolerance satisfied
5. Deadline reached
6. Budget exhausted
7. No major defects found in last cycle

---

## Performance & Load Testing

### Q12: Load Testing vs Stress Testing
**Answer:**

**Load Testing:**
```
Expected Load → Verify Performance
100 users → Response time acceptable?
```

**Stress Testing:**
```
Increase Load → Find Breaking Point
100 → 200 → 500 → 1000 users
At what point does system fail?
```

**Spike Testing:**
```
Sudden Load Increase
Normal: 100 users
Spike: Suddenly 10,000 users
Can system handle it?
```

---

### Q13: Key Performance Metrics
**Answer:**

```
Response Time: Time from request to first byte
Throughput: Requests per second
Error Rate: % of failed requests
CPU Usage: Server CPU consumption
Memory: RAM utilization
Concurrent Users: How many simultaneous users
Latency: Network delay
```

**Acceptable Values (typical):**
- Response Time: < 200ms
- Error Rate: < 1%
- CPU: < 80%
- Memory: < 85%

---

## Test Data Management

### Q14: How to Manage Test Data?
**Answer:**

**Good Practices:**
1. **Separate from production**: Never use prod data
2. **Version controlled**: Track data changes
3. **Refreshable**: Can reset to known state
4. **Secure**: No sensitive information
5. **Representative**: Reflects real scenarios
6. **Minimal**: Only what's needed

**Implementation:**
```python
class TestDataFactory:
    @staticmethod
    def create_test_user():
        return User(
            username="testuser_" + str(uuid.uuid4()),
            email="test@example.com",
            password="SecurePass123!"
        )
    
    @staticmethod
    def create_bulk_users(count):
        return [TestDataFactory.create_test_user() for _ in range(count)]
```

---

### Q15: GDPR Compliance in Testing
**Answer:**

**Considerations:**
1. Use anonymized test data
2. Don't use real customer data
3. Masks for PII (names, emails, phone numbers)
4. Secure test environments
5. Data retention policies
6. Access controls

```python
class DataMasker:
    @staticmethod
    def mask_email(email):
        """Convert john@example.com → j***@example.com"""
        local, domain = email.split('@')
        return f"{local[0]}***@{domain}"
    
    @staticmethod
    def mask_phone(phone):
        """Convert +1-999-999-9999 → +1-999-***-****"""
        return phone[:8] + "***-****"
```

---

## Soft Skills

### Q16: How do you handle communication with developers?
**Answer:**

1. **Collaborative**: Partnership, not adversarial
2. **Factual**: Evidence-based, not opinions
3. **Constructive**: Focus on quality, not blame
4. **Timely**: Communicate issues early
5. **Clear**: Detailed reproduction steps
6. **Professional**: Respectful tone always

**Example Communication:**
❌ "This is broken!"
✅ "I found an issue where the login button doesn't respond on mobile Safari. I've documented the steps to reproduce it here..."

---

### Q17: How do you prioritize multiple bugs?
**Answer:**

**Decision Matrix:**
```
Severity (Impact)     × Priority (Urgency)
|                       |
| High                  | High Priority
|─────────────────────────────────|
| Medium                | Medium Priority
|─────────────────────────────────|
| Low                   | Low Priority
(Business Impact)    (Time Sensitivity)
```

**Additional Factors:**
- User frequency of affected feature
- Workarounds available
- Customer importance
- Deadline proximity

---

## Learning Resources

For more details see:
- [Playwright Best Practices](../playwright/best-practices.md)
- [API Testing](../api-testing/api-fundamentals.md)
- [Security Testing](../security/security-basics.md)

---

**Next**: Continue to [Automation Interview](automation-interview.md)
