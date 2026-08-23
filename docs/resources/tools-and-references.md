# Tools & References

## Development Tools

### Code Editors
- **VS Code**: Best for Python/JavaScript automation
- **PyCharm**: Professional IDE for Python
- **IntelliJ IDEA**: Best for Java automation
- **Sublime Text**: Lightweight, fast

### Version Control
- **Git**: Essential for any project
- **GitHub**: Repository hosting + CI/CD
- **GitLab**: Alternative with built-in CI/CD
- **Bitbucket**: Atlassian's solution

### Terminal/Shell
- **PowerShell** (Windows): Modern terminal
- **bash** (Linux/Mac): Standard shell
- **zsh**: Enhanced bash
- **WSL** (Windows): Windows Subsystem for Linux

---

## Testing Tools

### Browser Automation
| Tool | Language | Best For |
|------|----------|----------|
| Playwright | Python/JS/Java | Modern web apps |
| Selenium | Multiple | Cross-browser testing |
| Cypress | JavaScript | React/Vue apps |
| Puppeteer | JavaScript | Chrome automation |

### API Testing
| Tool | Type | Best For |
|------|------|----------|
| Postman | GUI/CLI | REST API testing |
| Insomnia | GUI | REST/GraphQL testing |
| REST Assured | Java | Automated API tests |
| httpx | Python | Modern HTTP client |

### Performance Testing
| Tool | Type | Best For |
|------|------|----------|
| Locust | Python | Load testing |
| k6 | JavaScript | Performance testing |
| JMeter | GUI | Enterprise load testing |
| Apache Bench | CLI | Quick performance checks |

### Security Testing
| Tool | Category | Purpose |
|------|----------|---------|
| OWASP ZAP | DAST | Web app security scanning |
| Burp Suite | DAST | Penetration testing |
| SonarQube | SAST | Code quality/security |
| Snyk | SCA | Dependency scanning |
| Trivy | Container | Container image scanning |

---

## Python Testing Framework

### Essential Libraries

```python
# Testing
pytest                 # Test framework
pytest-xdist          # Parallel execution
pytest-cov            # Coverage reporting
pytest-html           # HTML reports

# Automation
playwright            # Browser automation
selenium              # Alternative automation

# API Testing
requests              # HTTP client
httpx                 # Modern HTTP client
pytest-httpserver    # Mock HTTP server

# Data Handling
pandas                # Data manipulation
faker                 # Generate fake data
factory_boy           # Test data factories

# Utilities
python-dotenv         # Environment variables
pyyaml                # YAML config files
jsonschema            # JSON validation

# Code Quality
pylint                # Code linting
black                 # Code formatter
flake8                # Style guide enforcement
mypy                  # Type checking
```

### Installation
```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows

# Install packages
pip install -r requirements.txt

# Or individual installation
pip install pytest playwright requests
```

---

## AWS Services for QA

### Compute
- **EC2**: Virtual machines for test execution
- **Lambda**: Serverless test execution
- **ECS**: Container orchestration
- **Elastic Beanstalk**: Platform as Service

### Storage
- **S3**: Store test reports and artifacts
- **EBS**: Persistent storage for VMs

### Database
- **RDS**: Managed relational databases
- **DynamoDB**: NoSQL testing

### Networking
- **VPC**: Isolated network for testing
- **ELB**: Load balancer for distributed tests
- **Route 53**: DNS for test environments

### Monitoring
- **CloudWatch**: Logs and metrics
- **CloudTrail**: API audit logging
- **X-Ray**: Application performance monitoring

---

## CI/CD Platforms

### GitHub Actions
```yaml
# Easy to use for GitHub repos
# Free for public repos
# Free tier for private repos
```

### GitLab CI/CD
```yaml
# Built into GitLab
# Generous free tier
# Great for enterprise
```

### Jenkins
```
# Self-hosted
# Maximum flexibility
# Requires maintenance
```

### Azure DevOps
```
# Microsoft's solution
# Integrates with Azure
# Good for enterprises
```

---

## Documentation

### AI Agent Orchestration
- [Ruflo AI Agent Orchestration](ruflo.md) - Open-source agents, swarms, MCP tools, memory, testing, and security workflows

### Official Documentation
- [Playwright Docs](https://playwright.dev)
- [Python Docs](https://python.org/docs)
- [AWS Docs](https://docs.aws.amazon.com)
- [GitHub Docs](https://docs.github.com)
- [pytest Docs](https://docs.pytest.org)

### READMEs in This Portal
- [Playwright Basics](../playwright/playwright-basics.md)
- [API Fundamentals](../api-testing/api-fundamentals.md)
- [Security Basics](../security/security-basics.md)
- [AWS Basics](../aws/aws-basics.md)

---

## Commands Reference

### Git Commands
```bash
# Clone repository
git clone https://github.com/user/repo.git

# Create branch
git checkout -b feature/new-feature

# Stage and commit
git add .
git commit -m "Add new tests"

# Push changes
git push origin feature/new-feature

# Create pull request (web interface)
```

### Python Commands
```bash
# Create virtual environment
python -m venv venv

# Activate virtual environment
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows

# Install dependencies
pip install -r requirements.txt

# Run tests
pytest tests/

# Run with coverage
pytest --cov=src tests/

# Generate HTML report
pytest --html=report.html --self-contained-html
```

### Playwright Commands
```bash
# Install Playwright
pip install playwright

# Install browsers
playwright install

# Run tests
pytest tests/

# Record new test
playwright codegen https://example.com

# Debug test
pytest tests/test_login.py --pdb
```

### Docker Commands
```bash
# Build image
docker build -t myapp:1.0 .

# Run container
docker run -d -p 8000:8000 myapp:1.0

# List containers
docker ps

# Stop container
docker stop container_id

# View logs
docker logs container_id
```

---

## Useful Websites

### Learning
- [Test Automation University](https://testautomationu.applitools.com)
- [Ministry of Testing](https://ministryoftesting.com)
- [Automation Guild](https://automationguild.com)
- [QA Stack Exchange](https://qa.stackexchange.com)

### Tools
- [MkDocs Material](https://squidfunk.github.io/mkdocs-material)
- [GitHub Pages](https://pages.github.com)
- [Docker Hub](https://hub.docker.com)

### Security
- [OWASP Top 10](https://owasp.org/www-project-top-ten)
- [CWE Top 25](https://cwe.mitre.org/top25)
- [HackerRank - Security Challenges](https://www.hackerrank.com/domains/security)

### APIs
- [JSONPlaceholder](https://jsonplaceholder.typicode.com) - Fake API for testing
- [PetStore API](https://petstore.swagger.io) - Sample REST API
- [ReqRes](https://reqres.in) - API testing playground

---

## Cheat Sheets

### Playwright Selectors
```python
# Text selector
page.click("text=Click me")

# Role selector
page.click("role=button[name='Submit']")

# CSS
page.click("button.submit")

# XPath
page.click("//button[@class='submit']")

# Data attribute
page.click("[data-testid='submit']")
```

### pytest Fixtures
```python
@pytest.fixture
def setup_data():
    data = {"user": "test"}
    yield data
    # cleanup

@pytest.fixture(scope="session")
def browser():
    # Session-level fixture
    pass

@pytest.fixture(autouse=True)
def auto_cleanup():
    # Runs for every test automatically
    pass
```

### Assertion Examples
```python
assert status_code == 200
assert "success" in response.text
assert response.json()["status"] == "ok"
assert response_time < 1.0
assert page.is_visible("button")
```

---

## Quick Links

### Useful Articles
- [Selenium vs Playwright Comparison](https://playwright.dev/)
- [Test Pyramid Explained](https://martinfowler.com/bliki/TestPyramid.html)
- [Page Object Model Pattern](https://www.selenium.dev/documentation/test_practices/encouraged/page_object_models)

### Video Tutorials
- [Playwright Tutorial - YouTube](https://youtube.com)
- [AWS Basics - A Cloud Guru](https://acloudguru.com)
- [Security Testing - SANS Cyber Academy](https://www.sans.org)

---

## Staying Updated

### Recommended Follows
- ![Twitter](https://twitter.com/playwright) Playwright
- ![Twitter](https://twitter.com/awscloud) AWS Cloud
- ![Twitter](https://twitter.com/GitHubPages) GitHub Pages

### Newsletters
- Automation Testing Newsletter
- AWS Weekly Newsletter
- Security Digest

### RSS Feeds
- [Testing Google Blog](https://testing.googleblog.com)
- [AWS Blog](https://aws.amazon.com/blogs)
- [OWASP Blog](https://owasp.org/blog)

---

**Bookmark this page for quick access to all tools and resources!**
