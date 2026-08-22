# Neeshu Learning Hub 🚀

A comprehensive **professional learning portal** for QA Automation Engineers built with **MkDocs Material** + **GitHub Pages**.

![Python](https://img.shields.io/badge/Python-3.11+-blue)
![MkDocs](https://img.shields.io/badge/MkDocs-Material-informational)
![GitHub Pages](https://img.shields.io/badge/Hosted%20on-GitHub%20Pages-success)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📚 Website

**Live Portal:** [https://neeshukumar.github.io/NeeshuLearningHub/](https://neeshukumar.github.io/NeeshuLearningHub/)

---

## 🎯 About

Neeshu Learning Hub is a **production-ready documentation portal** designed to be the ultimate resource for QA Automation Engineers. It features:

- ✅ **Professional Material Design** - Beautiful dark mode & light mode
- ✅ **Search Functionality** - Full-text search across all pages
- ✅ **Well-Organized Content** - Logical structure with clear navigation
- ✅ **Code Examples** - Real-world practical examples
- ✅ **Interactive Features** - Mermaid diagrams, image zoom, code copy
- ✅ **Mobile Optimized** - Works perfectly on all devices
- ✅ **Auto-Deployment** - GitHub Actions powers automatic updates

---

## 📖 Content Structure

```
docs/
├── index.md                          # Homepage
├── aws/
│   ├── aws-basics.md                # AWS fundamentals
│   ├── ec2-fundamentals.md          # EC2 deep dive
│   └── s3-essentials.md             # S3 storage
├── playwright/
│   ├── playwright-basics.md         # Getting started
│   ├── advanced-selectors.md        # Advanced locators
│   └── best-practices.md            # Production patterns
├── api-testing/
│   ├── api-fundamentals.md          # API concepts
│   ├── rest-concepts.md             # REST principles
│   └── testing-tools.md             # Tools & frameworks
├── security/
│   ├── security-basics.md           # Security fundamentals
│   ├── owasp-top-10.md             # OWASP Top 10
│   └── common-vulnerabilities.md    # Real-world vulnerabilities
├── devsecops/
│   ├── devsecops-intro.md          # DevSecOps concepts
│   └── cicd-security.md            # Secure CI/CD pipelines
├── interviews/
│   ├── qa-interview.md             # QA interview prep
│   └── automation-interview.md      # Automation interview prep
└── resources/
    ├── learning-path.md            # Structured learning path
    └── tools-and-references.md     # Tools & quick reference
```

---

## 🚀 Quick Start

### Prerequisites
- Python 3.8+
- Git
- Basic command line knowledge

### Local Development

This repository is intended to be private. Do not publish repository clone URLs, source files, credentials, or deployment tokens in public documentation.

To work locally, open an authorized local checkout and continue with the setup steps below. Only GitHub users explicitly granted repository access can clone a private repository.

1. **Create virtual environment**
```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows
```

2. **Install dependencies**
```bash
pip install -r requirements.txt
```

3. **Run locally**
```bash
mkdocs serve
```

4. **Open in browser**
```
http://localhost:8000
```

### Make the GitHub Repository Private

1. Open the repository on GitHub.
2. Select **Settings** → **General**.
3. Scroll to **Danger Zone**.
4. Select **Change repository visibility** → **Make private**.
5. Confirm the repository name and the visibility change.

Afterward, review **Settings** → **Collaborators** and remove anyone who should no longer have access. A private repository still allows approved collaborators to clone it; removing the clone command from this README does not block authorized cloning.

If GitHub Pages is enabled, verify its visibility and plan requirements after making the repository private. Do not commit secrets as a way to protect the source; revoke and rotate any credential that may already be exposed.

---

## 📝 Content Areas

### 1. AWS ☁️
- AWS fundamentals and architecture
- EC2 instances and scaling
- S3 storage and lifecycle policies
- Networking and security groups
- Cost optimization

### 2. Playwright 🎭
- Browser automation basics
- Advanced selector strategies
- Performance testing
- Best practices and patterns
- Production-ready frameworks

### 3. API Testing 🔌
- REST API fundamentals
- API design principles
- Testing tools and frameworks
- Performance and security testing
- GraphQL basics

### 4. Security Testing 🔒
- OWASP Top 10
- Common vulnerabilities
- Secure coding practices
- Authentication & authorization
- Data protection

### 5. DevSecOps 🚀
- Security in CI/CD
- Container security
- Infrastructure as Code
- Secrets management
- Compliance and audit

### 6. Interview Preparation 💼
- QA fundamentals
- Test automation design
- Real interview questions
- Tips and strategies

### 7. Learning Resources 📚
- Structured learning path
- Tools and references
- Useful commands
- External resources

---

## 🌟 Features

### 🎨 Beautiful Dark Mode
- Eye-friendly dark theme
- Toggle between light and dark
- Automatic system preference detection

### 🔍 Full-Text Search
- Search across all documentation
- Instant results
- Keyboard shortcuts (press `?` for help)

### 📱 Mobile Responsive
- Perfect on all screen sizes
- Touch-friendly navigation
- Optimized for mobile testing

### 📊 Visual Diagrams
- Mermaid diagrams for concepts
- Tables for comparisons
- Code examples with syntax highlighting

### 📋 Code Snippets
- Copy code with one click
- Language-specific syntax highlighting
- Real-world examples

### 🔗 Easy Navigation
- Sidebar navigation
- Breadcrumbs
- Previous/Next links
- Table of contents

---

## 📖 Usage Examples

### Reading Documentation
```bash
# Navigate to http://localhost:8000
# Use sidebar to browse topics
# Use search (Ctrl+K) to find specific content
```

### Adding New Content
```bash
# Create new markdown file
echo "# New Topic" > docs/new-section/topic.md

# Update mkdocs.yml navigation
# Serve with mkdocs serve
# Content appears instantly
```

### Building for Production
```bash
# Build static site
mkdocs build

# Files in 'site/' folder ready to deploy
```

---

## 🔄 Deployment

### Automatic Deployment (GitHub Actions)

Every push to `main` branch automatically:
1. ✅ Builds the documentation
2. ✅ Generates static HTML
3. ✅ Pushes to `gh-pages` branch
4. ✅ Updates live website

### Manual Deployment

```bash
# Build and deploy manually
mkdocs gh-deploy --force
```

### GitHub Pages Configuration

1. Go to **Repository Settings → Pages**
2. Set **Source** to `gh-pages` branch
3. Set **Folder** to `/ (root)`
4. Save

**Your site will be live at:**
```
https://username.github.io/NeeshuLearningHub/
```

---

## 🛠️ Customization

### Change Site Name
Edit `mkdocs.yml`:
```yaml
site_name: Your Learning Hub
site_author: Your Name
```

### Add New Section
1. Create folder in `docs/` (e.g., `docs/python/`)
2. Create markdown files (e.g., `basics.md`)
3. Update navigation in `mkdocs.yml`

### Customize Theme
Edit `mkdocs.yml` theme section:
```yaml
theme:
  palette:
    - scheme: slate              # dark mode
      primary: blue              # primary color
      accent: cyan               # accent color
```

---

## 📋 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-content`)
3. Add/update markdown files
4. Commit changes (`git commit -m "Add amazing content"`)
5. Push to branch (`git push origin feature/amazing-content`)
6. Open Pull Request

---

## ✨ Future Enhancements

- [ ] Integration with real APIs
- [ ] Video tutorials
- [ ] Interactive code editor
- [ ] Practice exercises with solutions
- [ ] Q&A section
- [ ] Contributions from community
- [ ] Multilingual support
- [ ] Certificate generation

---

## 🔗 Resources

### Official Documentation
- [MkDocs Documentation](https://www.mkdocs.org/)
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)

### Related Tools
- [Playwright Documentation](https://playwright.dev/)
- [AWS Documentation](https://docs.aws.amazon.com/)
- [OWASP Documentation](https://owasp.org/)

### Learning Platforms
- [Test Automation University](https://testautomationu.applitools.com/)
- [Ministry of Testing](https://ministryoftesting.com/)
- [Automation Guild](https://automationguild.com/)

---

## 📊 Architecture

```
┌──────────────────────────────────────────┐
│     Neeshu Learning Hub                  │
├──────────────────────────────────────────┤
│ GitHub Repository (Source)               │
│ - Markdown files (.md)                   │
│ - mkdocs.yml configuration               │
│ - GitHub Actions workflow                │
└──────────────────────┬────────────────────┘
                       │
                       ↓ (on push to main)
       ┌───────────────────────────────┐
       │ GitHub Actions Workflow       │
       │ 1. Install MkDocs Material    │
       │ 2. Build static site          │
       │ 3. Deploy to gh-pages branch  │
       └───────────┬───────────────────┘
                   │
                   ↓
       ┌─────────────────────────────┐
       │ GitHub Pages                │
       │ Serves static HTML          │
       └────────┬────────────────────┘
                │
                ↓
    ┌──────────────────────────┐
    │ Live Website             │
    │ https://username.github  │
    │ .io/NeeshuLearningHub/   │
    └──────────────────────────┘
```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 💬 Support

For questions or suggestions:
- Open an issue on GitHub
- Start a discussion
- Check existing documentation for answers

---

## 📊 Stats

- 📄 **Pages**: 20+
- 📚 **Topics**: 7 major areas
- 🚀 **Examples**: 50+
- 📝 **Words**: 30,000+
- ⏱️ **Reading Time**: 20+ hours

---

## 🎓 Learning Philosophy

> *"The best way to learn is by doing. Read → Understand → Practice → Master"*

This portal combines:
- **Theoretical Knowledge**: Core concepts explained
- **Practical Examples**: Real-world code samples
- **Best Practices**: Industry standards
- **Interview Prep**: Common questions and answers

---

## 🔔 Updates

Check back regularly for:
- New technical content
- Updated best practices
- Latest tools and frameworks
- Interview questions
- Community contributions

---

**Last Updated: August 22, 2026**

**Happy Learning! 🎓**

---

Made with ❤️ for QA Automation Engineers
