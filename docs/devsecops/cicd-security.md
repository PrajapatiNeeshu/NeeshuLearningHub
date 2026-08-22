# CI/CD Security

## CI/CD Pipeline Stages

```
Code Commit → Build → Security Tests → Staging → Production
    ↓          ↓            ↓            ↓           ↓
  Scan       Unit      Penetration   Smoke       Monitor
  Code       Tests     Tests         Tests       Logs
  Review     SAST      E2E Tests     Integration
           Lint       Performance    Tests
```

## Secure Pipeline Configuration

### 1. Repository Security

```yaml
# GitHub Branch Protection
# Require:
- Peer review (min 2 approvals)
- Status checks to pass
- Dismiss stale PR reviews
- Require code owner review
- Require up-to-date branches
```

### 2. Build Security

```dockerfile
# Secure build configuration
FROM python:3.11-slim

# Don't run as root
RUN useradd -m appuser

# Minimal dependencies
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=appuser:appuser . /app
WORKDIR /app

USER appuser

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:8000/health

CMD ["python", "app.py"]
```

### 3. Testing Security

```python
# conftest.py - Pytest configuration
import pytest
import os

@pytest.fixture(autouse=True)
def secure_environment():
    """Ensure no secrets in test environment"""
    dangerous_vars = ['API_KEY', 'DATABASE_PASSWORD', 'SECRET_KEY']
    for var in dangerous_vars:
        if os.getenv(var):
            pytest.fail(f"Sensitive env var exposed: {var}")

def test_no_secrets_in_code():
    """Verify no hardcoded secrets"""
    import subprocess
    result = subprocess.run(
        ['truffleHog', 'filesystem', '.'],
        capture_output=True
    )
    assert result.returncode == 0, "Secrets found in code!"
```

## Security in Each Stage

### PR/Merge Request Stage

```yaml
name: PR Security Checks

on: [pull_request]

jobs:
  security:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      
      # Lint checks
      - name: Code Quality
        run: |
          pip install pylint
          pylint src/
      
      # Security linting
      - name: Security Lint
        run: |
          pip install bandit
          bandit -r src/
      
      # Dependency check
      - name: Check Dependencies
        run: pip install safety
               safety check
      
      # Secret scanning
      - name: Scan for Secrets
        run: |
          pip install detect-secrets
          detect-secrets scan --baseline .secrets.baseline
```

### Build Stage

```yaml
name: Secure Build

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2
      
      - name: Build Image
        uses: docker/build-push-action@v4
        with:
          context: .
          file: ./Dockerfile
          tags: ${{ env.IMAGE }}:${{ github.sha }}
          push: false
          cache-from: type=gha
          cache-to: type=gha,mode=max
      
      # Sign image
      - name: Sign Image
        run: |
          cosign sign --key env://COSIGN_KEY \
            ${{ env.IMAGE }}:${{ github.sha }}
        env:
          COSIGN_KEY: ${{ secrets.COSIGN_KEY }}
```

### Deployment Stage

```yaml
name: Secure Deployment

on:
  workflow_run:
    workflows: ["Secure Build"]
    types: [completed]

jobs:
  deploy:
    runs-on: ubuntu-latest
    if: ${{ github.event.workflow_run.conclusion == 'success' }}
    
    permissions:
      id-token: write
      contents: read
    
    steps:
      - uses: actions/checkout@v3
      
      # Authenticate with OIDC (no static credentials)
      - uses: aws-actions/configure-aws-credentials@v2
        with:
          role-to-assume: arn:aws:iam::ACCOUNT:role/github-actions
          aws-region: us-east-1
      
      # Verify image signature
      - name: Verify Image Signature
        run: |
          cosign verify --key env://COSIGN_KEY \
            ${{ env.IMAGE }}:${{ github.sha }}
        env:
          COSIGN_KEY: ${{ secrets.COSIGN_KEY }}
      
      # Deploy with policy checks
      - name: Deploy
        run: |
          kubectl set image deployment/app \
            app=${{ env.IMAGE }}:${{ github.sha }} \
            --record
```

## Secrets Management in CI/CD

### ❌ Bad Practices
```yaml
# ❌ Storing secrets in workflow
- name: Deploy
  env:
    API_KEY: "sk_live_abc123"  # Visible in logs!
    DB_PASS: "password123"
  run: ./deploy.sh

# ❌ Passing secrets as parameters
- run: docker build --build-arg API_KEY=${{ secrets.API_KEY }}
```

### ✅ Good Practices
```yaml
# ✅ Use GitHub secrets
- name: Deploy
  env:
    API_KEY: ${{ secrets.API_KEY }}
  run: ./deploy.sh

# ✅ Use AWS Secrets Manager
- name: Get Secrets from AWS
  run: |
    SECRET=$(aws secretsmanager get-secret-value \
      --secret-id prod/api-key --query SecretString)
    echo "::add-mask::$SECRET"
    echo "API_KEY=$SECRET" >> $GITHUB_ENV

# ✅ Use Vault
- name: Get Secrets from Vault
  uses: hashicorp/vault-action@v2
  with:
    url: https://vault.example.com
    method: jwt
    role: github-actions
    path: secret/data/prod
    tlsSkipVerify: false
```

## Artifact Security

```yaml
# Build and scan artifact
- name: Build Artifact
  run: make build

- name: Scan Artifact
  run: |
    trivy fs artifact.zip
    snyk test artifact.zip

# Sign artifact
- name: Sign Artifact
  run: |
    cosign sign-blob --key env://COSIGN_KEY \
      artifact.zip > artifact.zip.sig
  env:
    COSIGN_KEY: ${{ secrets.COSIGN_KEY }}

# Upload signed artifact
- name: Upload Artifact
  uses: actions/upload-artifact@v3
  with:
    name: artifact
    path: artifact.zip*
```

## Compliance & Audit

```yaml
# Audit CI/CD actions
- name: Audit Pipeline Actions
  run: |
    # Log all deployments
    echo "Deployment at $(date)" >> deployments.log
    echo "By: ${{ github.actor }}" >> deployments.log
    echo "Commit: ${{ github.sha }}" >> deployments.log
    echo "Build: ${{ github.run_id }}" >> deployments.log

# Store audit logs
- name: Store Audit Logs
  run: |
    aws s3 cp deployments.log \
      s3://audit-log-bucket/$(date +%Y/%m/%d)/deployments.log
```

## Post-Deployment Security

```yaml
name: Production Monitoring

on:
  workflow_run:
    workflows: ["Secure Deployment"]
    types: [completed]

jobs:
  monitor:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
      
      # Health checks
      - name: Health Check
        run: |
          curl -f https://api.example.com/health \
            || exit 1
      
      # Security monitoring
      - name: Check Security Headers
        run: |
          curl -I https://api.example.com | \
            grep -E 'Strict-Transport-Security|X-Frame-Options'
      
      # Performance monitoring
      - name: Monitor Performance
        run: |
          # Check page load time
          curl -w "@curl-format.txt" \
            https://api.example.com
```

## Key Principles

1. **Shift Left**: Security early, not last
2. **Automate**: All checks automated
3. **No Secrets**: Use secure secret management
4. **Audit Trail**: Log all actions
5. **Immutable**: Artifacts can't be modified
6. **Verify**: Sign and verify artifacts
7. **Monitor**: Continuous security monitoring

---

**Back to**: [DevSecOps Intro](devsecops-intro.md)
