# Cyber Security Roadmap

> **Source:** [roadmap.sh/cyber-security](https://roadmap.sh/cyber-security)  
> **Created:** June 25, 2026

This roadmap takes you from core IT knowledge to practical security engineering, cloud security, and career development. Study the sections in order, then revisit the relevant topics through hands-on labs.

## How to Use This Roadmap

Each stage builds on the previous one. Read the concepts, practice in an authorized lab, write down what you observed, and finish the checkpoint before moving ahead.

## Study Order

| # | Section | Difficulty | Main outcome |
|---|---|---|---|
| 1 | Fundamental IT Skills | Beginner | Understand hardware, software, files, and connections |
| 2 | Operating Systems | Beginner | Administer Windows, Linux, and macOS basics |
| 3 | Networking Knowledge | Beginner-Intermediate | Explain OSI, TCP/IP, ports, DNS, and DHCP |
| 4 | Security Skills and Knowledge | Intermediate | Apply the CIA triad and defense-in-depth thinking |
| 5 | Attack Types and Differences | Intermediate | Recognize common attack paths and their mitigations |
| 6 | Tools, Frameworks, and Incident Response | Intermediate-Advanced | Investigate events and respond using repeatable processes |
| 7 | Cloud Skills and Knowledge | Intermediate | Secure AWS, Azure, and GCP workloads |
| 8 | Programming, Certifications, and CTFs | All levels | Automate tasks and demonstrate practical skills |
| 9 | CISO Career Advice and Industry Insights | All levels | Connect technical skills to risk and business outcomes |
| 10 | Cloud Security | All levels | Combine cloud, Kubernetes, IaC, and DevSecOps security |

## Visual Roadmap

```text
START HERE
    |
    v
1. FUNDAMENTAL IT SKILLS       Hardware, connections, office suites
    |
2. OPERATING SYSTEMS           Windows, Linux, macOS
    |
3. NETWORKING                  OSI model, protocols, ports, DNS, DHCP
    |
4. SECURITY SKILLS             CIA triad, defense in depth, IDS/IPS
    |
5. ATTACK TYPES                Phishing, DDoS, SQL injection, XSS
    |
6. TOOLS AND FRAMEWORKS        Wireshark, Nmap, MITRE ATT&CK, NIST
    |
7. CLOUD SKILLS                AWS, Azure, GCP, IaC, serverless
    |
8. PROGRAMMING AND CERTS       Python, Bash, CompTIA, OSCP
    |
9. CISO CAREER ADVICE          Specializations, strategy, leadership
    |
10. CLOUD SECURITY             AWS, Azure, GCP, Kubernetes, DevSecOps
    |
    v
KEEP LEARNING
```

## 1. Fundamental IT Skills

Learn how computers, storage, memory, operating systems, applications, and users work together. Understand files and permissions, virtualization, troubleshooting, and the difference between local and network resources.

Read the detailed [Fundamental IT Skills](01-fundamental-it-skills.md) notes.

**Checkpoint:** Explain what happens from pressing the power button to opening a web application, and identify where confidentiality, integrity, and availability can fail.

## 2. Operating Systems

Build daily administration skills in Windows and Linux, with basic macOS familiarity. Focus on users and groups, processes, services, logs, package updates, file permissions, environment variables, and scheduled tasks.

**Checkpoint:** Create a least-privilege user, locate authentication logs, apply updates, and explain why administrator access should not be used for routine work.

## 3. Networking Knowledge

Study the OSI and TCP/IP models, IPv4 and IPv6, subnetting, routing, switching, TCP and UDP, HTTP/S, SSH, DNS, DHCP, SMTP, and common ports. Then learn how firewalls, proxies, VPNs, and network segmentation reduce risk.

**Checkpoint:** Use an authorized lab to trace a DNS lookup and an HTTPS request, identify the involved ports, and explain where TLS protects data.

## 4. Security Skills and Knowledge

Start with the CIA triad, authentication, authorization, accounting, risk, threats, vulnerabilities, controls, and defense in depth. Continue with secure configuration, patch management, vulnerability management, logging, monitoring, and security testing.

Continue with the existing notes:

- [Security Basics](security-basics.md)
- [OWASP Top 10](owasp-top-10.md)
- [Common Vulnerabilities](common-vulnerabilities.md)

**Checkpoint:** Threat-model a small web application, identify its assets and trust boundaries, and choose preventive, detective, and corrective controls.

## 5. Attack Types and Differences

Learn the purpose and indicators of phishing, credential stuffing, malware, ransomware, denial-of-service, SQL injection, cross-site scripting, CSRF, SSRF, privilege escalation, man-in-the-middle attacks, and supply-chain attacks.

Study each attack with four questions: What is the prerequisite? What is the impact? What evidence does it leave? Which control prevents or limits it?

**Checkpoint:** In a deliberately vulnerable lab, reproduce only an approved exercise, document the request and impact, then apply and retest the mitigation.

## 6. Tools, Frameworks, and Incident Response

Become comfortable with tools such as Wireshark, Nmap, OWASP ZAP, Burp Suite, vulnerability scanners, SIEM platforms, and endpoint security tools. Use frameworks to make decisions consistent:

- **MITRE ATT&CK:** Describe adversary tactics and techniques.
- **NIST Cybersecurity Framework:** Organize identify, protect, detect, respond, and recover activities.
- **Incident response:** Prepare, detect, analyze, contain, eradicate, recover, and learn.

**Checkpoint:** Build a small incident timeline from sample logs, state the evidence collected, and explain containment without destroying forensic data.

## 7. Cloud Skills and Knowledge

Learn shared responsibility, identity and access management, network security groups, virtual networks, object storage, key management, secrets, monitoring, backups, containers, serverless functions, and infrastructure as code.

Practice least privilege, separation of environments, secure defaults, centralized logging, policy-as-code, and cost-aware security controls across AWS, Azure, or GCP.

**Checkpoint:** Deploy a small lab resource with no public access by default, grant only the permissions it needs, enable logging, and remove it after testing.

## 8. Programming, Certifications, and CTFs

Use Python, Bash, PowerShell, and basic SQL to automate investigation and testing tasks. Learn secure coding, regular expressions, JSON, HTTP clients, parsing, and error handling. Keep scripts small, logged, tested, and safe to rerun.

Certifications can provide structure, but projects and evidence matter too. Possible paths include Security+, Network+, cloud security certifications, eJPT, PNPT, OSCP, and role-specific credentials. Choose based on your target role and experience rather than collecting certificates without practice.

Capture The Flag challenges are useful for learning enumeration, web security, cryptography, forensics, and privilege escalation in authorized environments.

**Checkpoint:** Publish a sanitized lab write-up with the problem, commands or code, evidence, remediation, and lessons learned. Never include secrets or unauthorized data.

## 9. CISO Career Advice and Industry Insights

Security careers include security engineering, application security, cloud security, detection engineering, penetration testing, governance risk and compliance, digital forensics, and security leadership. Build depth in one area while maintaining enough breadth to collaborate across teams.

At senior levels, communicate risk in business terms: likelihood, impact, control effectiveness, residual risk, ownership, and investment. A strong security strategy connects people, process, and technology and measures outcomes rather than tool counts.

**Checkpoint:** Write a one-page risk recommendation for a non-technical stakeholder with the risk, evidence, options, cost, owner, and target date.

## 10. Cloud Security: Complete Focus Area

Bring the roadmap together with these cloud security themes:

- Identity-first architecture and just-in-time access
- Secure network segmentation and private service connectivity
- Container and Kubernetes security
- Secure CI/CD and software supply chains
- Infrastructure-as-code scanning and policy enforcement
- Data classification, encryption, and key lifecycle management
- Centralized logging, detection, and incident response
- Backup, recovery, resilience, and disaster planning
- Cloud security posture management and continuous improvement

**Final checkpoint:** Design a small cloud application architecture, mark trust boundaries, list threats, assign controls, define monitoring signals, and describe how the team would respond to a compromise.

## Practical Weekly Study Plan

| Week | Focus | Practice |
|---|---|---|
| 1 | IT and operating systems | Build a local Linux lab and document users, services, and logs |
| 2 | Networking | Capture traffic in an authorized lab and map protocols to the OSI model |
| 3 | Security foundations | Threat-model a sample application and create a control checklist |
| 4 | Web attacks | Complete safe OWASP lab exercises and document remediations |
| 5 | Tools and response | Analyze sample logs and create an incident timeline |
| 6 | Cloud security | Deploy and secure a small non-production cloud resource |
| 7 | Automation | Write a tested script that parses logs or checks configuration |
| 8 | Portfolio and career | Publish a sanitized write-up and review the next specialization |

## Safe Learning Rules

- Test only systems you own or have explicit permission to assess.
- Use intentionally vulnerable labs for offensive exercises.
- Keep credentials, tokens, personal data, and internal addresses out of notes and repositories.
- Confirm scope and rate limits before scanning.
- Prefer reversible changes and keep evidence for authorized investigations.
- Remove temporary cloud resources when the lab is complete.

**Next:** Begin with [Security Basics](security-basics.md), then continue to [OWASP Top 10](owasp-top-10.md).