# OWASP Top 10

## 1. Broken Access Control

### Description
Users can access resources they shouldn't have permission to access.

### Examples
```python
# ❌ VULNERABLE: Insecure Direct Object Reference (IDOR)
@app.route('/users/<user_id>/profile')
def get_user_profile(user_id):
    user = User.query.get(user_id)  # No permission check!
    return user.profile

# ✅ SECURE: Verify user has permission
@app.route('/users/<user_id>/profile')
def get_user_profile(user_id):
    current_user = get_current_user()
    if current_user.id != int(user_id) and not current_user.is_admin:
        return "Forbidden", 403
    user = User.query.get(user_id)
    return user.profile
```

### Prevention
- Implement access control checks
- Use role-based access control (RBAC)
- Deny by default
- Verify ownership before operations

---

## 2. Cryptographic Failures

### Description
Sensitive data exposed due to encryption failures or use of weak algorithms.

### Examples
```python
# ❌ VULNERABLE: Storing passwords in plain text
user = User(username="john", password="password123")
db.save(user)

# ❌ VULNERABLE: Using weak hashing
import hashlib
password_hash = hashlib.md5("password123".encode()).hexdigest()

# ✅ SECURE: Use proper hashing
from werkzeug.security import generate_password_hash, check_password_hash
password_hash = generate_password_hash("password123")
if check_password_hash(password_hash, provided_password):
    # Login successful
    pass
```

### Prevention
- Use strong encryption (AES-256)
- Use modern hashing (bcrypt, Argon2)
- Don't store sensitive data unnecessarily
- Use HTTPS for data in transit
- Implement key management

---

## 3. Injection

### Description
Untrusted data inserted into application commands (SQL, OS, LDAP, etc.).

### Examples

**SQL Injection**
```python
# ❌ VULNERABLE
query = f"SELECT * FROM users WHERE username='{username}'"
# Input: ' OR '1'='1  → Returns all users!

# ✅ SECURE: Use parameterized queries
query = "SELECT * FROM users WHERE username=?"
db.execute(query, (username,))
```

**Command Injection**
```python
# ❌ VULNERABLE
os.system(f"ls -la {user_directory}")
# Input: "; rm -rf /  → Dangerous!

# ✅ SECURE
import subprocess
subprocess.run(["ls", "-la", user_directory], check=True)
```

**XSS Injection**
```python
# ❌ VULNERABLE
return f"<h1>Welcome {user_input}</h1>"
# Input: <script>alert('XSS')</script>

# ✅ SECURE: Escape output
from markupsafe import escape
return f"<h1>Welcome {escape(user_input)}</h1>"
```

### Prevention
- Use parameterized queries/prepared statements
- Validate and sanitize inputs
- Use ORMs
- Escape output
- Avoid dynamic SQL construction

---

## 4. Insecure Design

### Description
Missing security controls from the beginning of the design process.

### Prevention
- Threat modeling
- Secure design patterns
- Security requirements from the start
- Security code reviews
- Architecture reviews

---

## 5. Security Misconfiguration

### Description
Weak defaults, incomplete setups, or unnecessary features enabled.

### Examples
```python
# ❌ VULNERABLE: Debug mode enabled in production
DEBUG = True  # In production!

# ✅ SECURE: Use environment-based configuration
DEBUG = os.getenv('DEBUG', 'False') == 'True'

# ❌ VULNERABLE: Default credentials
DB_USER = "admin"
DB_PASSWORD = "admin"

# ✅ SECURE: Use environment variables
DB_USER = os.getenv('DB_USER')
DB_PASSWORD = os.getenv('DB_PASSWORD')
```

### Prevention
- Secure defaults
- Minimal installations
- Remove unnecessary features
- Update and patch regularly
- Security headers configured
- Error messages don't leak info

---

## 6. Vulnerable Components

### Description
Using libraries, frameworks, or modules with known vulnerabilities.

### Prevention
```bash
# Regular dependency scanning
npm audit
pip install safety && safety check
mvn dependency-check:check

# Keep dependencies updated
npm update
pip install --upgrade -r requirements.txt
```

---

## 7. Authentication Failures

### Description
Weak or missing authentication mechanisms.

### Examples
```python
# ❌ VULNERABLE: Weak password policy
# Can be any string

# ✅ SECURE: Strong password requirements
import re

def validate_password(password):
    if len(password) < 12:
        raise ValueError("Password must be 12+ characters")
    if not re.search(r'[A-Z]', password):
        raise ValueError("Must contain uppercase")
    if not re.search(r'[0-9]', password):
        raise ValueError("Must contain numbers")
    if not re.search(r'[!@#$%^&*]', password):
        raise ValueError("Must contain special characters")
    return True
```

### Prevention
- Implement MFA
- Strong password policies
- Secure session management
- Protect password reset flows
- Implement rate limiting

---

## 8. Software & Data Integrity Failures

### Description
CI/CD pipeline, dependencies, or updates have inadequate integrity verification.

### Prevention
- Verify source integrity
- Use signed commits
- Verify package signatures
- Secure repository access
- Implement code review
- Automated security tests

---

## 9. Logging & Monitoring Failures

### Description
Insufficient logging, monitoring, or incident response capability.

### Examples
```python
import logging

# ✅ SECURE: Log security events
logger = logging.getLogger(__name__)

def login(username, password):
    if not verify_credentials(username, password):
        logger.warning(f"Failed login attempt: {username}")
        return "Invalid credentials", 401
    
    logger.info(f"Successful login: {username}")
    return "Login successful", 200

def unauthorized_access(user, resource):
    logger.error(f"Unauthorized access attempt: {user} tried to access {resource}")
```

### Prevention
- Log authentication events
- Log access control failures
- Log input validation failures
- Centralized logging
- Alerts for suspicious activity
- Regular log review

---

## 10. Server-Side Request Forgery (SSRF)

### Description
Application fetches remote resources without validating user-supplied URLs.

### Examples
```python
# ❌ VULNERABLE
import requests

@app.route('/fetch-url')
def fetch_url():
    url = request.args.get('url')
    response = requests.get(url)  # Could access internal services!
    return response.text

# ✅ SECURE: Validate URL
from urllib.parse import urlparse

def is_safe_url(url):
    parsed = urlparse(url)
    # Only allow HTTPS and specific domains
    if parsed.scheme not in ('http', 'https'):
        return False
    if parsed.netloc not in ['api.trusted.com', 'cdn.trusted.com']:
        return False
    return True

@app.route('/fetch-url')
def fetch_url():
    url = request.args.get('url')
    if not is_safe_url(url):
        return "Invalid URL", 400
    response = requests.get(url, timeout=5)
    return response.text
```

### Prevention
- Validate and sanitize URLs
- Whitelist allowed domains
- Use network segmentation
- Disable unused URL schemes
- Implement timeouts

---

## Security Testing Workflow

```
1. Identify Assets
   ↓
2. Threat Modeling
   ↓
3. Identify Vulnerabilities
   ↓
4. Assess Risks
   ↓
5. Prioritize Fixes
   ↓
6. Implement Fixes
   ↓
7. Verify
   ↓
8. Monitor
```

---

**Next**: Back to [Security Basics](security-basics.md)
