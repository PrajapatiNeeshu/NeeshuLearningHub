# Common Vulnerabilities

## Cross-Site Scripting (XSS)

### Stored XSS
```python
# ❌ VULNERABLE
@app.route('/comment', methods=['POST'])
def add_comment():
    comment = request.form['comment']
    db.comments.insert({"text": comment})  # No sanitization
    return redirect('/')

# Display comments
@app.route('/')
def index():
    comments = db.comments.find()
    return render_template('index.html', comments=comments)

# HTML Template
# ❌ VULNERABLE: {{ comment.text }}

# ✅ SECURE: {{ comment.text | escape }}
```

### Reflected XSS
```python
# ❌ VULNERABLE
@app.route('/search')
def search():
    query = request.args.get('q')
    return f"Search results for: {query}"  # User input in response!

# ✅ SECURE
from markupsafe import escape
@app.route('/search')
def search():
    query = request.args.get('q', '')
    return f"Search results for: {escape(query)}"
```

---

## Cross-Site Request Forgery (CSRF)

### Attack Scenario
```
1. User logs into bank.com
2. User visits evil.com (without logging out)
3. evil.com makes request to bank.com/transfer?amount=1000
4. Request goes through because user is still logged in!

Prevention: CSRF Tokens
```

### Protection Implementation
```python
from flask_wtf.csrf import CSRFProtect

csrf = CSRFProtect(app)

@app.route('/transfer', methods=['POST'])
@csrf.protect
def transfer():
    # Request must include CSRF token
    amount = request.form['amount']
    # Process transfer
    return "Transfer successful"

# Template
# <form method="POST" action="/transfer">
#   <input type="hidden" name="csrf_token" value="{{ csrf_token() }}"/>
#   <input type="number" name="amount">
#   <button>Transfer</button>
# </form>
```

---

## Broken Authentication

### Session Fixation
```python
# ❌ VULNERABLE: Reusing session ID
@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']
    if verify(username, password):
        session['user_id'] = username  # Reuse session ID!
        return "Login successful"

# ✅ SECURE: Generate new session
from flask import session
@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']
    if verify(username, password):
        session.clear()  # Clear old session
        session['user_id'] = username
        session.permanent = False
        return "Login successful"
```

### Credential Stuffing
```python
# ✅ SECURE: Implement rate limiting
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

limiter = Limiter(app, key_func=get_remote_address)

@app.route('/api/login', methods=['POST'])
@limiter.limit("5 per minute")  # 5 attempts per minute
def api_login():
    # Login logic
    pass
```

---

## Insecure Deserialization

### Attack Scenario
```python
# ❌ VULNERABLE: Unsafe pickle
import pickle

data = request.data
obj = pickle.loads(data)  # Can execute arbitrary code!

# ✅ SECURE: Use JSON
import json
obj = json.loads(request.data)  # Safe, JSON only data
```

---

## Using Components with Known Vulnerabilities

### Example: log4j Vulnerability
```
CVE-2021-44228 - Critical RCE in log4j
Affected: log4j < 2.14.1

❌ OLD (vulnerable)
dependencies:
  - org.apache.logging.log4j:log4j-core:2.14.0

✅ FIXED
dependencies:
  - org.apache.logging.log4j:log4j-core:2.17.1
```

### Dependency Scanning
```bash
# Node.js
npm audit
npm audit fix

# Python
pip install safety
safety check

# Java
mvn dependency-check:check

# .NET
dotnet list package --vulnerable
```

---

## Sensitive Data Exposure

### Database Breach Scenario
```python
# ❌ VULNERABLE: Storing passwords unencrypted
class User(db.Model):
    username = db.Column(db.String)
    password = db.Column(db.String)  # Plain text!

# ✅ SECURE: Hash passwords
from werkzeug.security import generate_password_hash

class User(db.Model):
    username = db.Column(db.String)
    password_hash = db.Column(db.String)
    
    def set_password(self, password):
        self.password_hash = generate_password_hash(password)
```

### Unencrypted Data in Transit
```python
# ❌ VULNERABLE: HTTP
requests.get("http://api.example.com/sensitive-data")

# ✅ SECURE: HTTPS only
requests.get("https://api.example.com/sensitive-data")

# ✅ SECURE: Verify certificate
import ssl
context = ssl.create_default_context()
requests.get("https://api.example.com", verify=True)
```

---

## Race Conditions

### TOC/TOU Vulnerability
```python
# ❌ VULNERABLE: Check-Then-Act
def transfer_money(from_account, to_account, amount):
    if from_account.balance >= amount:  # Check
        time.sleep(1)  # Race condition window!
        from_account.balance -= amount  # Act
        to_account.balance += amount

# ✅ SECURE: Atomic operation
def transfer_money(from_account, to_account, amount):
    with db.transaction():
        # Lock account for duration of transfer
        account = db.query("SELECT * FROM accounts WHERE id=? FOR UPDATE", from_account.id)
        if account.balance >= amount:
            account.balance -= amount
            # Other account update
```

---

## Brute Force Attacks

### Password Guessing
```python
# ❌ VULNERABLE: Unlimited attempts
@app.route('/login', methods=['POST'])
def login():
    user = User.query.filter_by(username=username).first()
    if user and verify_password(user.password, password):
        return "Login successful"
    return "Invalid credentials"

# ✅ SECURE: Rate limiting + account lockout
from flask_limiter import Limiter

limiter = Limiter(app)

@app.route('/login', methods=['POST'])
@limiter.limit("5 per minute")
def login():
    user = User.query.filter_by(username=username).first()
    
    if user and user.locked:
        return "Account locked. Try again in 30 minutes"
    
    if user and verify_password(user.password, password):
        user.failed_attempts = 0
        return "Login successful"
    
    if user:
        user.failed_attempts += 1
        if user.failed_attempts >= 5:
            user.locked = True
            user.locked_until = datetime.now() + timedelta(minutes=30)
    
    return "Invalid credentials"
```

---

## Vulnerability Disclosure Process

```
1. Identify vulnerability
   ↓
2. Document details (reproduction steps, impact, severity)
   ↓
3. Responsible disclosure (contact vendor privately)
   ↓
4. Wait for patch (usually 90 days)
   ↓
5. Public disclosure with CVE
   ↓
6. Users can apply patches
```

---

**Back to**: [Security Basics](security-basics.md)
