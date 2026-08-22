# Section 5: Attack Types and Differences

> **Difficulty:** Intermediate | **Prerequisite:** [Sections 1-4](04-security-skills-and-knowledge.md)

Understanding attack patterns helps defenders choose controls, recognize indicators, and respond quickly. Practice only in systems you own or are explicitly authorized to assess.

## 5.1 Social Engineering Attacks

Social engineering manipulates people rather than relying only on a technical vulnerability.

| Attack | How it works | Defensive focus |
|---|---|---|
| **Phishing** | Fake email imitates a trusted sender to steal information or deliver malware | Filtering, MFA, reporting, awareness |
| **Spear phishing** | Targeted phishing uses personal or organizational details | Verify requests through another channel |
| **Whaling** | Targets executives or high-value decision makers | Approval and payment verification |
| **Vishing** | Fraudulent voice call impersonates support or a bank | Never share secrets during an unsolicited call |
| **Smishing** | Malicious SMS or messaging-app link | Do not use unexpected links; report them |
| **Spam/SPIM** | Unsolicited bulk email or instant messages | Filtering and blocking |
| **Shoulder surfing** | Observes passwords or screens in person | Privacy screens and awareness |
| **Dumpster diving** | Searches discarded material for sensitive information | Secure disposal and shredding |
| **Tailgating** | Follows an authorized person through a secure door | Badge checks and visitor procedures |
| **Impersonation** | Pretends to be a colleague, vendor, or support agent | Identity and request verification |
| **Watering hole** | Compromises a site visited by a target group | Browser security and patching |
| **Reconnaissance** | Collects information before an attack | Asset inventory and reduced public exposure |

## 5.2 Web-Based Attacks and OWASP Risks

| Risk | What happens | Prevention |
|---|---|---|
| Broken access control | A user reaches another user's or an admin's resource | Server-side authorization on every request |
| Cryptographic failure | Sensitive data is exposed through weak protection | TLS, approved algorithms, key management |
| Injection | Input changes an interpreter's command | Parameterized queries and validation |
| Insecure design | Security controls were absent from the design | Threat modeling and abuse cases |
| Misconfiguration | Unsafe defaults or unnecessary features remain enabled | Hardened baselines and reviews |
| Vulnerable components | An outdated dependency contains a known flaw | Inventory, scanning, and patching |
| Authentication failure | Login or session controls can be bypassed | MFA, secure sessions, rate limiting |
| Integrity failure | Untrusted code enters a build or release | Signed artifacts and protected CI/CD |
| Logging failure | Security events are not recorded or investigated | Centralized actionable logs |
| SSRF | A server is tricked into making unintended requests | Egress controls and URL allowlists |

See the existing [OWASP Top 10](owasp-top-10.md) notes for additional examples.

### SQL Injection

SQL injection occurs when untrusted input is concatenated into a database query. Use prepared statements, parameterized queries, safe ORM APIs, least-privilege database accounts, and generic error messages. Test payloads only against authorized labs.

### Cross-Site Scripting (XSS)

XSS causes attacker-controlled script content to execute in another user's browser.

- **Stored XSS:** Malicious content is saved and later displayed.
- **Reflected XSS:** Input is immediately reflected in a response.
- **DOM-based XSS:** Client-side code unsafely modifies the DOM.

Use context-aware output encoding, safe templating, input validation, Content Security Policy, and secure cookie settings.

### Cross-Site Request Forgery (CSRF)

CSRF tricks a browser with an active session into submitting an unwanted state-changing request. Use CSRF tokens, SameSite cookies, origin checks, and re-authentication for sensitive actions.

### Directory Traversal

Directory traversal attempts to access files outside an intended directory through path manipulation such as `../`. Use canonicalized paths, file allowlists, safe file APIs, and isolated service accounts.

## 5.3 Network Attacks

| Attack | How it works | Defensive controls |
|---|---|---|
| **DoS** | One source overwhelms a service | Rate limiting, capacity, filtering |
| **DDoS** | Many distributed sources overwhelm a service | DDoS protection, CDN, upstream coordination |
| **MITM** | Intercepts communication between parties | TLS validation and secure Wi-Fi |
| **Spoofing** | Fakes an IP, MAC, email, or other identity | Authentication and ingress filtering |
| **DNS poisoning** | Causes a name to resolve to a wrong address | DNSSEC and protected resolvers |
| **ARP spoofing** | Sends false local IP-to-MAC mappings | Switch protections and encryption |
| **Evil twin** | Fake access point imitates trusted Wi-Fi | Enterprise Wi-Fi and certificate validation |
| **Deauthentication** | Forces wireless clients off an access point | Protected management frames and monitoring |
| **VLAN hopping** | Attempts to cross VLAN boundaries | Secure switch and trunk configuration |
| **Rogue access point** | Unauthorized wireless device joins a network | Wireless monitoring and port controls |
| **Replay** | Reuses captured valid transaction data | Nonces, timestamps, and short-lived tokens |
| **Pass the hash** | Uses a stolen password hash to authenticate | Credential protection, MFA, endpoint detection |

DoS is usually one source; DDoS is distributed across many sources, often a botnet. Both affect availability, but DDoS requires distributed detection and upstream mitigation.

## 5.4 Password Attacks

| Attack | Method | Defense |
|---|---|---|
| **Brute force** | Tries many passwords against one account | Long unique passwords, MFA, throttling |
| **Dictionary attack** | Tries likely words and common passwords | Password screening and a password manager |
| **Password spray** | Tries one common password against many accounts | MFA, smart lockout, identity monitoring |
| **Credential stuffing** | Reuses breached username/password pairs | Unique passwords, MFA, breach detection |
| **Rainbow table** | Looks up precomputed password hashes | Unique salts and slow password hashing |

Brute force concentrates attempts on one account. Password spraying distributes a few attempts across many accounts to avoid per-account lockouts. Monitor both account and source-based patterns.

## 5.5 Other Attack Types

| Attack | Description | Defensive focus |
|---|---|---|
| **Buffer overflow** | Excess input overwrites adjacent memory | Memory-safe languages, bounds checks, mitigations |
| **Memory leak** | Unreleased memory grows until performance suffers | Testing, monitoring, and process limits |
| **Drive-by attack** | A compromised site causes an unwanted download or exploit | Patching, browser isolation, endpoint protection |
| **Typosquatting** | Similar-looking domain catches a typing mistake | Domain monitoring and web filtering |
| **Zero-day** | Exploits a vulnerability before a fix is available | Defense in depth and behavior detection |

## 5.6 Malware Types

| Malware | Behavior | Typical impact |
|---|---|---|
| **Virus** | Attaches to files and usually needs user action | Modified files and infection |
| **Worm** | Self-replicates across systems | Rapid network spread |
| **Trojan** | Disguises itself as legitimate software | Unexpected installation or process |
| **Ransomware** | Encrypts or steals data for extortion | Unavailable files and downtime |
| **Spyware** | Secretly collects information | Data exposure and surveillance |
| **Adware** | Displays unwanted advertising | Pop-ups and browser changes |
| **Rootkit** | Hides activity and maintains persistence | Stealthy privileged access |
| **Keylogger** | Records keystrokes | Credential and message exposure |
| **Botnet agent** | Enrolls a device in remote control | Command-and-control traffic |
| **Logic bomb** | Activates after a condition or date | Delayed destructive behavior |
| **RAT** | Provides unauthorized remote control | Remote commands and data theft |
| **Fileless malware** | Runs mainly in memory or trusted tools | Harder file-based detection |

Use layered endpoint controls, application allowlisting, least privilege, patching, backups, and network monitoring. Handle live malware only in an isolated professional lab.

## 5.7 Threat Classification

| Term | Meaning |
|---|---|
| Zero-day | Vulnerability without an available vendor fix or widely known mitigation |
| Known threat | Threat with established indicators, signatures, or patches |
| Unknown threat | New or modified threat requiring behavioral detection |
| APT | Sophisticated, targeted, and persistent campaign |

APT campaigns may remain hidden for long periods and pursue espionage, theft, or disruption. Defend with asset visibility, identity controls, segmentation, threat hunting, and tested response.

## 5.8 Wireless Security

| Protocol | Security status | Guidance |
|---|---|---|
| WEP | Broken | Never use |
| WPA with TKIP | Deprecated and weak | Replace |
| WPA2 with AES/CCMP | Widely supported and generally strong when configured well | Use with a strong passphrase or enterprise authentication |
| WPA3 | Newer protection with stronger authentication | Prefer when supported |

| Term | Meaning and guidance |
|---|---|
| WPS | Push-button or PIN setup; disable PIN-based WPS and follow vendor guidance |
| EAP | Framework for enterprise authentication methods |
| PEAP | EAP method using a TLS-protected tunnel |

Use strong Wi-Fi encryption, update access points, change default credentials, separate guest networks, validate enterprise certificates, and enable protected management frames where supported.

## 5.9 Defensive Investigation Workflow

1. Confirm the alert and preserve relevant evidence.
2. Identify affected users, assets, time range, and initial access path.
3. Contain activity while preserving evidence and limiting harm.
4. Eradicate the cause, such as malware, vulnerable software, or stolen credentials.
5. Recover from trusted backups or known-good images.
6. Review controls, update detections, and document lessons learned.

## 5.10 Key Takeaways

- Social engineering targets people, so verification and awareness matter.
- Web attacks require secure design, validation, encoding, access control, and patching.
- DDoS is distributed; DoS may come from one source.
- Password spraying tests one password across many accounts; credential stuffing reuses breached pairs.
- Zero-days require layered controls because a patch may not exist yet.
- APTs are persistent campaigns requiring visibility and long-term detection.
- Never use WEP or legacy WPA; prefer WPA2-AES or WPA3.
- Ransomware resilience depends on tested, protected backups and practiced response.

**Next:** Continue to [Security Roadmap](security-roadmap.md), then study tools, frameworks, and incident response.