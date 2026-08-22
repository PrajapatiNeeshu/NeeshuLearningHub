# Section 6: Tools, Frameworks, and Incident Response

> **Difficulty:** Intermediate-Advanced | **Prerequisite:** [Sections 1-5](05-attack-types-and-differences.md)

Security professionals use tools to discover assets, analyze evidence, detect threats, and respond consistently. Use scanning, packet capture, malware analysis, and penetration-testing tools only with explicit authorization.

## 6.1 Security Tools for Discovery and Response

### Network and Discovery Tools

| Tool | What it does | Category | Example |
|---|---|---|---|
| **Nmap** | Discovers hosts, ports, services, and versions | Scanning | `nmap -sV 192.0.2.10` |
| **Wireshark** | Captures and analyzes packets graphically | Packet analysis | Inspect an authorized capture |
| **tcpdump** | Captures packets from the command line | Packet analysis | `tcpdump -i eth0 port 443` |
| **ping** | Tests reachability with ICMP | Connectivity | `ping 192.0.2.10` |
| **traceroute/tracert** | Shows the path to a destination | Routing | `tracert example.com` |
| **nslookup/dig** | Queries DNS | DNS | `dig example.com MX` |
| **arp** | Displays the ARP cache | Network | `arp -a` |
| **ipconfig/ifconfig** | Shows local network configuration | Network | `ipconfig /all` |
| **netstat/ss** | Shows active connections and listeners | Network | `ss -tulnp` |
| **curl** | Sends and inspects HTTP requests | HTTP/API | `curl -v https://api.example.com` |
| **hping3** | Crafts packets for authorized testing | Advanced testing | Use only in a controlled lab |

### Forensics Tools

| Tool | Purpose |
|---|---|
| FTK Imager | Creates forensic disk images while preserving evidence |
| Autopsy | Analyzes disk images, files, deleted data, and browser history |
| Wireshark | Investigates suspicious network communications |
| Memory acquisition tools | Capture volatile RAM evidence |
| WinHex | Performs low-level disk and file examination |
| Volatility | Analyzes memory images for processes and malware artifacts |

### Linux Text and Log Tools

| Tool | Use | Example |
|---|---|---|
| `cat` | Displays content | `cat /var/log/syslog` |
| `head` | Shows the first lines | `head -50 access.log` |
| `tail` | Shows or follows the last lines | `tail -f /var/log/auth.log` |
| `grep` | Searches for patterns | `grep "FAILED" auth.log` |
| `dd` | Makes a low-level copy | Use only with verified evidence procedures |

Preserve the original evidence, calculate hashes, record who handled it, and work from copies wherever possible.

## 6.2 Security Frameworks

### MITRE ATT&CK

MITRE ATT&CK is a knowledge base of adversary tactics and techniques based on observed activity.

- **Tactics:** The adversary's goal, such as Initial Access or Persistence.
- **Techniques:** How the goal is achieved, such as Phishing or Scheduled Task.
- **Procedures:** Specific real-world implementations of a technique.

Use ATT&CK to map detections to behavior, identify coverage gaps, threat-model an environment, and organize threat-hunting hypotheses.

### Cyber Kill Chain

The seven stages are Reconnaissance, Weaponization, Delivery, Exploitation, Installation, Command and Control, and Actions on Objectives. Section 4 covers the model in detail. Use it to identify where preventive or detective controls can break an intrusion.

### Diamond Model

The Diamond Model analyzes an intrusion event through four connected features:

| Feature | Question |
|---|---|
| Adversary | Who is conducting the activity? |
| Capability | What tools or techniques are being used? |
| Infrastructure | What domains, servers, or communication paths are involved? |
| Victim | Who or what is being targeted? |

Finding one point can reveal relationships to the other three and support better intelligence analysis.

## 6.3 Security Standards and Compliance

| Standard or framework | Purpose |
|---|---|
| NIST | Security standards and guidelines |
| ISO/IEC 27001 | Information security management system standard |
| CIS Controls and Benchmarks | Prioritized safeguards and hardening guidance |
| NIST CSF | Organizes Identify, Protect, Detect, Respond, and Recover |
| NIST RMF | Manages risk in information systems |
| PCI DSS | Protects payment-card data |
| HIPAA | Protects regulated healthcare information in the US |
| GDPR | Protects personal data under EU law |
| SOC 2 | Reports on service-provider trust principles |

### NIST Cybersecurity Framework Functions

1. **Identify:** Understand assets, risks, and vulnerabilities.
2. **Protect:** Implement safeguards such as access controls, training, and encryption.
3. **Detect:** Monitor for events with SIEM, IDS, and endpoint telemetry.
4. **Respond:** Analyze, contain, communicate, and mitigate incidents.
5. **Recover:** Restore services, communicate status, and improve resilience.

Compliance is not the same as security. Map requirements to real controls, evidence, owners, and review dates.

## 6.4 SIEM and SOAR

### SIEM

A Security Information and Event Management platform collects, normalizes, correlates, searches, and alerts on events from servers, firewalls, endpoints, applications, identities, and cloud services.

Common SIEM capabilities include log collection, correlation, alerting, dashboards, historical investigation, and retention. Examples include Splunk, Microsoft Sentinel, IBM QRadar, Elastic Security, and Wazuh.

### SOAR

Security Orchestration, Automation, and Response coordinates tools and automates repeatable playbooks. For example, a verified phishing alert might create a case, block the sender, search mailboxes, and isolate an endpoint subject to approval controls.

| SIEM | SOAR |
|---|---|
| Collects and analyzes evidence | Automates and coordinates response |
| The eyes | The hands |
| Detects and alerts | Executes controlled playbooks |

Automation should include approvals, logging, rollback, and safe failure behavior.

## 6.5 Incident Response Process

1. **Preparation:** Maintain the plan, team, contacts, tools, training, backups, and legal guidance.
2. **Identification:** Validate alerts and reports, determine scope, and decide whether an incident exists.
3. **Containment:** Isolate affected systems or accounts and limit spread while preserving evidence.
4. **Eradication:** Remove malware, close the exploited weakness, patch systems, and reset compromised credentials.
5. **Recovery:** Restore from trusted sources, validate controls, return systems gradually, and monitor for recurrence.
6. **Lessons learned:** Produce a timeline, root-cause analysis, control improvements, and updated detections.

### Incident Response Questions

- What happened, when did it start, and how was it detected?
- Which accounts, hosts, applications, data, and suppliers are affected?
- What evidence is preserved, and who has handled it?
- What is the safest containment action and its business impact?
- Which notifications, approvals, and legal requirements apply?
- How will recovery be validated and recurrence detected?

## 6.6 Runbooks

A runbook is a step-by-step procedure for a known operational or security scenario.

Examples include ransomware, phishing, DDoS, lost device, compromised account, and data-breach runbooks.

Each runbook should include:

1. Trigger conditions and severity.
2. Required roles, contacts, and approvals.
3. Evidence to collect and how to preserve it.
4. Step-by-step containment, eradication, and recovery actions.
5. Escalation and communication criteria.
6. Validation, closure, and lessons-learned steps.

Exercise runbooks with realistic but safe scenarios and update them after every incident or major environment change.

## 6.7 Hardening Concepts

| Concept | What it does |
|---|---|
| ACLs | Define who or what can access resources |
| Group Policy | Centrally manages Windows settings and controls |
| Port blocking | Closes unnecessary network paths |
| Patching | Fixes known software vulnerabilities |
| MAC filtering | Allows or denies devices by hardware address; not a replacement for authentication |
| NAC | Checks device posture before network access |
| Jump server/bastion host | Provides a hardened controlled entry point to sensitive systems |
| Endpoint security | Protects devices with AV, EDR, DLP, and policy controls |
| Sinkhole | Redirects known malicious traffic to a controlled analysis destination |

Hardening should follow a tested baseline, least privilege, change control, monitoring, and a documented rollback plan.

## 6.8 Endpoint Security Tools

| Tool | Purpose |
|---|---|
| Antivirus/antimalware | Detects and blocks known and common malicious activity |
| EDR | Records endpoint behavior and supports investigation and response |
| DLP | Detects or prevents unauthorized movement of sensitive data |
| Host firewall | Filters traffic according to local policy |
| NGFW | Combines firewalling with application awareness, IPS, and inspection |
| Sandboxing | Runs suspicious content in an isolated environment |

## 6.9 Common Analysis Services

| Service | Use | Caution |
|---|---|---|
| VirusTotal | Checks files and URLs against multiple engines | Do not upload confidential files |
| Joe Sandbox | Behavioral malware analysis | Use approved accounts and data |
| ANY.RUN | Interactive analysis sandbox | Avoid sensitive samples |
| URLVoid | Checks URL reputation | Treat results as signals, not proof |
| URLScan | Analyzes web requests and pages | Consider submitted data visibility |
| WHOIS | Looks up domain registration data | Data may be private or outdated |
| Shodan | Searches indexed internet-connected services | Use only for authorized asset management |

## 6.10 Log Types and Locations

| Log type | Contains | Typical location |
|---|---|---|
| Windows Event Logs | System, security, and application events | Event Viewer, `eventvwr.msc` |
| Syslog | Linux system, kernel, and service events | `/var/log/syslog`, `/var/log/messages` |
| Authentication logs | Successful and failed logins | `/var/log/auth.log` or Windows Security log |
| Firewall logs | Allowed and denied connections | Firewall console or SIEM |
| NetFlow | Source, destination, bytes, and duration metadata | Network monitoring platform |
| Packet captures | Detailed network traffic | Wireshark or tcpdump files |
| Application logs | Application-specific actions and errors | Application-defined location |

Centralize important logs, synchronize clocks, restrict access, define retention, protect integrity, and alert on high-value events.

## 6.11 Security Testing Distributions and Concepts

| Distribution or concept | Purpose |
|---|---|
| Kali Linux | Authorized penetration testing and security assessment |
| Parrot OS | Security, privacy, and forensics work |
| LOLBAS | Reference for legitimate Windows tools that can be abused |
| GTFOBins | Reference for Unix binaries with security-relevant behavior |
| WADComs | Windows and Active Directory assessment reference |
| Penetration testing | Authorized simulated attack to identify weaknesses |
| Rules of engagement | Written scope, methods, limits, schedule, and safety controls |

Security distributions are toolboxes, not permission to scan or attack systems. Obtain written authorization and define scope before testing.

## 6.12 Practical Checklist

- [ ] Maintain an authorized asset and service inventory.
- [ ] Use Nmap, packet capture, and discovery tools only within approved scope.
- [ ] Map detections and response coverage to MITRE ATT&CK.
- [ ] Centralize high-value logs and synchronize system time.
- [ ] Tune SIEM alerts and measure false positives and missed detections.
- [ ] Automate only repeatable, approved SOAR actions with rollback.
- [ ] Keep incident runbooks current and exercise them regularly.
- [ ] Preserve evidence, document access, and protect sensitive samples.
- [ ] Patch and harden hosts, network devices, endpoints, and cloud services.
- [ ] Test restoration and recovery after a simulated incident.

## 6.13 Key Takeaways

- Nmap, Wireshark, and tcpdump support authorized network discovery and analysis.
- MITRE ATT&CK maps real-world adversary behavior and detection coverage.
- Incident response has six phases: preparation, identification, containment, eradication, recovery, and lessons learned.
- SIEM detects and correlates; SOAR coordinates and automates response.
- NIST CSF functions are Identify, Protect, Detect, Respond, and Recover.
- Runbooks make response consistent and reduce decision time.
- Know where Windows, Linux, firewall, network, and application logs are stored.
- LOLBAS and GTFOBins describe how legitimate tools can be abused, so monitor their use.

**Next:** Continue to [Security Roadmap](security-roadmap.md), then study cloud skills and knowledge.