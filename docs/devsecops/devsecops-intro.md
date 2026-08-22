# DevSecOps Introduction

## What is DevSecOps?

DevSecOps integrates security practices into DevOps processes, making security a shared responsibility throughout the software development lifecycle.

## Traditional vs DevSecOps

### Traditional Security (Waterfall)
```
Design → Development → Testing → Security Review → Deployment
                                      ↓
                               Issues found late!
                               Expensive to fix
```

### DevSecOps (Continuous)
```
Design       Development       Testing       Deployment
  ↓             ↓               ↓              ↓
Security    Security        Security      Security
Review      Testing         Scanning      Monitoring
  ↓             ↓               ↓              ↓
Continuous Process → Security embedded at each stage
Early issue detection → Lower cost fixes
```

## DevSecOps Pillars

### 1. Secure Development
- Secure coding practices
- Code reviews
- Static analysis
- Dependency management

### 2. Secure Testing
- Security testing
- Penetration testing
- Vulnerability scanning
- Performance testing under load

### 3. Secure Deployment
- Infrastructure as Code (IaC)
- Container scanning
- Runtime security
- Secrets management

### 4. Secure Operations
- Monitoring and logging
- Incident response
- Compliance tracking
- Vulnerability patching

## Security in CI/CD Pipeline

```
Code Push → SAST → DAST → SCA → Build → Deploy → Monitor
  ↓         ↓       ↓      ↓      ↓       ↓        ↓
 Commit  Static  Dynamic Soft   Artifact Container Runtime
         Tests   Tests   Comp   Scan     Scan     Alerts
```

### SAST (Static Application Security Testing)
- Analyze source code without running
- Find vulnerabilities before runtime
- Tools: SonarQube, Checkmarx, Fortify
- Fast, many false positives

### DAST (Dynamic Application Security Testing)
- Test running application
- Find runtime vulnerabilities
- Tools: OWASP ZAP, Burp Suite
- Slower, more accurate

### SCA (Software Composition Analysis)
- Check dependencies for vulnerabilities
- Tools: Snyk, BlackDuck, FOSSA
- Identify vulnerable libraries

## Secrets Management

### ❌ Bad: Secrets in Code
```python
# .env.example (accidentally committed)
API_KEY=sk_live_abc123xyz
DATABASE_PASSWORD=supersecret123
```

### ✅ Good: Environment Variables
```bash
# .gitignore
.env
*.secrets

# Deploy with secrets
export API_KEY=sk_live_abc123xyz
export DATABASE_PASSWORD=supersecret123
python app.py
```

### ✅ Better: Secrets Manager
```python
import boto3

# Use AWS Secrets Manager
client = boto3.client('secretsmanager')
secret = client.get_secret_value(SecretId='prod/db/password')
db_password = secret['SecretString']
```

## Infrastructure as Code (IaC)

### Secure Configuration (Terraform Example)
```hcl
# ✅ SECURE: Enable encryption
resource "aws_s3_bucket" "assets" {
  bucket = "my-assets"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "assets" {
  bucket = aws_s3_bucket.assets.id
  
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# ✅ SECURE: Enable versioning
resource "aws_s3_bucket_versioning" "assets" {
  bucket = aws_s3_bucket.assets.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

# ✅ SECURE: Block public access
resource "aws_s3_bucket_public_access_block" "assets" {
  bucket = aws_s3_bucket.assets.id
  
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
```

## Container Security

### Scanning Images
```bash
# Scan with Trivy
trivy image myrepo/myapp:1.0

# Scan with Snyk
snyk container test myrepo/myapp:1.0
```

### Secure Dockerfile
```dockerfile
# ❌ VULNERABLE
FROM ubuntu:latest
RUN apt-get update && apt-get install -y curl
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
CMD ["python", "app.py"]

# ✅ SECURE
FROM python:3.11-slim-bullseye
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
COPY . /app
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt
USER appuser
EXPOSE 8000
CMD ["python", "app.py"]
```

## CI/CD Security Example (GitHub Actions)

```yaml
name: Secure CI/CD Pipeline

on: [push, pull_request]

jobs:
  security:
    runs-on: ubuntu-latest
    
    steps:
      # 1. Static Analysis
      - uses: actions/checkout@v3
      - name: SonarQube Scan
        uses: SonarSource/sonarcloud-github-action@master
      
      # 2. Dependency Check
      - name: Dependency Check
        uses: aquasecurity/trivy-action@master
        with:
          scan-type: 'fs'
          scan-ref: '.'
      
      # 3. Secret Scanning
      - name: TruffleHog Secret Scan
        uses: trufflesecurity/trufflehog@main
      
      # 4. SAST with Semgrep
      - name: Semgrep Scan
        uses: returntocorp/semgrep-action@v1
      
      # 5. Build & Container Scan
      - name: Build Docker Image
        run: docker build -t myapp:${{ github.sha }} .
      
      - name: Scan Docker Image
        uses: aquasecurity/trivy-action@master
        with:
          image-ref: myapp:${{ github.sha }}
          format: 'sarif'
          output: 'trivy-results.sarif'
      
      # 6. Upload Results
      - name: Upload Scan Results
        uses: github/codeql-action/upload-sarif@v2
        with:
          sarif_file: 'trivy-results.sarif'
```

## Vulnerability Management

```
Discover → Assess → Prioritize → Remediate → Verify → Monitor
   ↓         ↓          ↓           ↓          ↓        ↓
Scanning  Determine  Critical   Patch/     Test     Alert on
Tools     Severity   First      Upgrade    Systems  Regression
```

## Security Checklist (Before Deployment)

- [ ] Code review completed
- [ ] SAST scan passed
- [ ] DAST scan passed
- [ ] Dependency check passed
- [ ] No secrets in code
- [ ] Security headers configured
- [ ] SSL/TLS enabled
- [ ] Database encrypted
- [ ] Backups configured
- [ ] Monitoring enabled
- [ ] Incident response plan ready
- [ ] Compliance checks passed

## Tools Ecosystem

| Category | Tools |
|----------|-------|
| SAST | SonarQube, Checkmarx, Fortify |
| DAST | OWASP ZAP, Burp Suite |
| SCA | Snyk, Black Duck, FOSSA |
| Container | Trivy, Aqua, Anchore |
| IaC Scanning | TFLint, Checkov, CloudSploit |
| Secrets | TruffleHog, GitGuardian |
| Monitoring | CloudWatch, Datadog, New Relic |

---

**Next**: Continue to [CI/CD Security](cicd-security.md)
