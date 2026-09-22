# Security Basics

## Security Testing Overview

Security testing is the practice of testing software to identify and eliminate security vulnerabilities and weaknesses.

## Security Goals (CIA Triad)

```
┌─────────────────────────────────┐
│      Confidentiality             │  Only authorized access
├─────────────────────────────────┤
│      Integrity                   │  Data not modified
├─────────────────────────────────┤
│      Availability                │  System accessible
└─────────────────────────────────┘
```

## Common Security Threats

### Authentication Issues
- Weak passwords
- Credential stuffing
- Session hijacking
- Default credentials

### Authorization Issues
- Privilege escalation
- Insecure direct object reference (IDOR)
- Missing access controls
- Role-based access control (RBAC) bypass

### Injection Attacks
- SQL Injection
- Command Injection
- LDAP Injection
- XML Injection

### Data Protection
- Unencrypted data transmission
- Unencrypted data storage
- Insufficient cryptography
- Data leakage

### Session Management
- Session fixation
- Cross-Site Request Forgery (CSRF)
- Session timeout issues
- Cookie security

## HTTP Security Headers

### Content Security Policy
```
Content-Security-Policy: default-src 'self'; script-src 'self' 'unsafe-inline'
```

### Strict Transport Security
```
Strict-Transport-Security: max-age=31536000; includeSubDomains
```

### X-Frame-Options (Clickjacking Protection)
```
X-Frame-Options: DENY
X-Frame-Options: SAMEORIGIN
X-Frame-Options: ALLOW-FROM uri
```

### X-Content-Type-Options (MIME Type Sniffing)
```
X-Content-Type-Options: nosniff
```

### X-XSS-Protection
```
X-XSS-Protection: 1; mode=block
```

### Referrer-Policy
```
Referrer-Policy: strict-origin-when-cross-origin
```

## HTTPS/TLS

### Why HTTPS?
```
HTTP:  Plain text transmission → Vulnerable
HTTPS: Encrypted transmission  → Secure
       + Certificate authentication
       + Data integrity
```

### Certificate Best Practices
- Use reputable Certificate Authorities
- Implement certificate pinning
- Regular certificate renewal
- Monitor certificate expiration

## Password Security

### Password Requirements
```
✅ Minimum 12 characters
✅ Mix of uppercase, lowercase, numbers, symbols
✅ Not dictionary words
✅ Unique for different accounts
✅ Changed regularly
✅ Hashed & salted when stored
```

### Hashing Algorithms
```
❌ MD5 (broken)
❌ SHA-1 (deprecated)
❌ Plain text (never!)
✅ bcrypt
✅ scrypt
✅ PBKDF2
✅ Argon2 (best)
```

## OWASP Top 10 Categories

The OWASP Top 10 represents the most critical security risks:

1. **Broken Access Control**
2. **Cryptographic Failures**
3. **Injection**
4. **Insecure Design**
5. **Security Misconfiguration**
6. **Vulnerable Components**
7. **Authentication Failures**
8. **Software & Data Integrity Failures**
9. **Logging & Monitoring Failures**
10. **Server-Side Request Forgery (SSRF)**

## Secure Coding Practices

### Input Validation
```python
# ❌ Bad
user_id = request.args.get('id')
data = db.query(f"SELECT * FROM users WHERE id={user_id}")

# ✅ Good
user_id = request.args.get('id', type=int)
if user_id < 1:
    raise ValueError("Invalid user ID")
data = db.query("SELECT * FROM users WHERE id=?", (user_id,))
```

### Output Encoding
```python
# ❌ Bad - XSS vulnerability
{{ user_comment }}

# ✅ Good - Escaped output
{{ user_comment | escape }}
```

### Error Handling
```python
# ❌ Bad - Reveals sensitive info
except Exception as e:
    return f"Error: {e}"

# ✅ Good - Generic message
except Exception as e:
    logger.error(f"Database error: {e}")
    return "An error occurred. Please try again."
```

## Environment Security

### Configuration Management
```
❌ Secrets in code
❌ Secrets in version control
❌ Default credentials

✅ Environment variables
✅ Secrets management tools (AWS Secrets Manager)
✅ Encrypted configuration files
```

### Dependency Management

```bash
# Check for vulnerabilities
npm audit                    # Node.js
pip install safety && safety check  # Python
mvn dependency-check:check  # Java
dotnet list package --vulnerable  # .NET
```

## Security Testing Checklist

- [ ] Validate all inputs
- [ ] Encode all outputs
- [ ] Use parameterized queries
- [ ] Implement HTTPS/TLS
- [ ] Validate SSL certificates
- [ ] Implement authentication
- [ ] Implement authorization
- [ ] Secure session management
- [ ] Use strong cryptography
- [ ] Log security events
- [ ] Monitor for attacks
- [ ] Regular security updates
- [ ] Security testing in CI/CD
- [ ] Dependency vulnerability scanning
- [ ] Code review for security

## Testing Tools

- **OWASP ZAP**: Open source security scanner
- **Burp Suite**: Web application security testing
- **SonarQube**: Code quality and security
- **Snyk**: Dependency vulnerability scanning
- **AQUA**: Container security
- **Checkmarx**: Static application security testing (SAST)

## Secure API Testing

```python
import requests
from requests.auth import HTTPBasicAuth

def test_api_security():
    # Test HTTPS enforcement
    response = requests.get("http://api.example.com/users", allow_redirects=False)
    assert response.status_code == 301  # Should redirect to HTTPS
    
    # Test authentication required
    response = requests.get("https://api.example.com/admin")
    assert response.status_code == 401
    
    # Test authorization
    headers = {"Authorization": "Bearer user_token"}
    response = requests.delete("https://api.example.com/users/admin_user", headers=headers)
    assert response.status_code == 403  # Forbidden
    
    # Test input validation
    payload = {"name": "'; DROP TABLE users; --"}
    response = requests.post("https://api.example.com/users", json=payload)
    assert response.status_code == 400
```

---

**Next**: Continue to [OWASP Top 10](owasp-top-10.md)
