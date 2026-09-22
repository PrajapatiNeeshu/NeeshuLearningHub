# Section 4: Security Skills and Knowledge

> **Difficulty:** Intermediate | **Prerequisite:** [Sections 1-3](03-networking-knowledge.md)

This is the core of cybersecurity: the concepts, defenses, and mindset used to protect systems and data.

## 4.1 The CIA Triad

The CIA triad is the foundation of security decisions.

| Pillar | Meaning | Threat example | Protection |
|---|---|---|---|
| **Confidentiality** | Only authorized people can access data | Breach or eavesdropping | Encryption, access control, MFA |
| **Integrity** | Data has not been altered without authorization | Tampering or corruption | Hashes, signatures, checksums |
| **Availability** | Systems are accessible when needed | DDoS or hardware failure | Redundancy, backups, load balancing |

Think of a bank vault: confidentiality controls who can open it, integrity ensures the contents were not replaced, and availability ensures authorized customers can access it when the bank is open.

## 4.2 Authentication and Authorization

| Concept | Question | Example |
|---|---|---|
| **Authentication (AuthN)** | Who are you? | Sign in with a password and MFA |
| **Authorization (AuthZ)** | What may you do? | An administrator can delete; a reader can only view |
| **Accounting** | What did you do? | Audit logs record an administrative change |

The flow is: authenticate the identity, authorize the requested action, and record security-relevant activity. A user can be authenticated but not authorized to access a particular resource.

### MFA and 2FA

- **2FA:** Exactly two authentication factors.
- **MFA:** Two or more factors.

| Factor | Category | Examples |
|---|---|---|
| Something you know | Knowledge | Password, PIN |
| Something you have | Possession | Authenticator app, smart card, hardware key |
| Something you are | Biometric | Fingerprint, face, iris |

Use factors from different categories. A password plus a PIN uses two knowledge factors and is weaker than a password plus a hardware key or authenticator code.

## 4.3 Defense in Depth

Defense in depth uses several independent layers so one failed control does not expose the entire environment.

1. **Physical security:** Locks, cameras, badges, and guards.
2. **Perimeter security:** Firewalls, DMZs, and intrusion detection or prevention.
3. **Network security:** VLANs, segmentation, ACLs, and VPNs.
4. **Host security:** Patching, hardening, antivirus, and EDR.
5. **Application security:** Input validation, secure coding, and WAF controls.
6. **Data security:** Encryption, DLP, access control, and backups.

No single layer is perfect. Review how layers support one another and identify gaps where one control failing would have a large impact.

## 4.4 Zero Trust

Zero Trust follows the principle **never trust, always verify**. No user, device, or network location is trusted automatically, including an internal network.

| Traditional approach | Zero Trust approach |
|---|---|
| Trust users inside the perimeter | Verify every request |
| Castle-and-moat defense | Identity- and policy-based access |
| Broad network access | Least-privilege, resource-specific access |
| Periodic checks | Continuous evaluation and monitoring |

Core principles:

1. **Verify explicitly:** Authenticate and authorize using available context.
2. **Use least privilege:** Grant only the access required for the task and time.
3. **Assume breach:** Design so a compromised account or device has limited reach.
4. **Micro-segment:** Divide systems into small, controlled zones.
5. **Monitor continuously:** Reassess identity, device health, and behavior.

## 4.5 IDS and IPS

| Feature | IDS (Intrusion Detection System) | IPS (Intrusion Prevention System) |
|---|---|---|
| Function | Detects and alerts | Detects and can block |
| Action | Passive | Active and inline in many deployments |
| Analogy | Camera with an alarm | Camera with an automatic lock |
| Main risk | Missed threats remain unblocked | False positives can block valid traffic |

| Type | Monitors |
|---|---|
| NIDS | Network traffic |
| HIDS | Activity on one host |
| NIPS | Network traffic and blocking decisions |
| HIPS | Host processes and activity |

Tune detection rules using authorized baseline traffic, document exceptions, and monitor both alert quality and coverage.

## 4.6 Cyber Kill Chain

The Cyber Kill Chain describes common stages in an intrusion:

1. **Reconnaissance:** Research the target and exposed assets.
2. **Weaponization:** Prepare an exploit or malicious payload.
3. **Delivery:** Send it through a channel such as email or a website.
4. **Exploitation:** Trigger a vulnerability or persuade a user to execute it.
5. **Installation:** Establish persistence.
6. **Command and control:** Communicate with the compromised system.
7. **Actions on objectives:** Steal data, disrupt services, or pursue another goal.

Defenders should break the chain at every possible stage with asset inventory, email filtering, patching, endpoint controls, network egress restrictions, detection, and response. Use this model only for authorized analysis and exercises.

## 4.7 Blue, Red, and Purple Teams

| Team | Role |
|---|---|
| **Blue team** | Defends, monitors, detects, and responds |
| **Red team** | Simulates an authorized adversary to find weaknesses |
| **Purple team** | Combines red and blue learning to improve detection and defense |

Red-team activity requires written scope, approvals, rules of engagement, emergency contacts, and safe handling of evidence.

## 4.8 Detection Outcomes

| Result | Meaning | Example |
|---|---|---|
| True positive | Alert fired for a real attack | IDS detects known malware traffic |
| True negative | No alert and no attack exists | Normal traffic produces no alert |
| False positive | Alert fired for benign activity | Normal administration is flagged |
| False negative | Attack occurred without an alert | Malware passes undetected |

False negatives are especially dangerous because they hide real threats. Reduce both error types with quality telemetry, tuned rules, threat-informed testing, and regular review.

## 4.9 Cryptography Basics

### Hashing and Salting

Hashing converts input to a fixed-length digest and is designed to be one-way. Use cryptographic hashes such as SHA-256 for integrity, and dedicated password-hashing algorithms such as Argon2id, bcrypt, or scrypt for passwords.

MD5 and SHA-1 are unsuitable for modern security integrity or password-storage use cases. A one-character input change should produce a very different digest.

A **salt** is a unique random value added to each password before hashing. Salts prevent identical passwords from producing identical stored hashes and reduce the value of precomputed rainbow tables. Password salts are not secrets, but password hashes must still be protected.

### Symmetric and Asymmetric Encryption

| Feature | Symmetric | Asymmetric |
|---|---|---|
| Keys | One shared secret | Public and private key pair |
| Speed | Fast | Slower |
| Use | Bulk data encryption | Key exchange and signatures |
| Examples | AES | RSA and elliptic-curve cryptography |

Use authenticated encryption, such as AES-GCM or an approved equivalent, and manage keys separately from encrypted data.

### PKI

Public Key Infrastructure manages certificates and public keys:

- A **Certificate Authority (CA)** issues certificates.
- A **certificate** binds an identity to a public key for a validity period.
- A **public key** can be shared.
- A **private key** must remain secret and protected.

During a TLS connection, the client validates the server certificate and trust chain before the parties establish session keys. Monitor expiration, revocation, hostname matching, and private-key access.

## 4.10 Privilege Escalation

Privilege escalation occurs when an actor gains more access than intended.

- **Vertical escalation:** A standard user becomes administrator or root.
- **Horizontal escalation:** One user accesses another user's data at the same privilege level.

Common causes include vulnerable software, excessive permissions, weak administrative credentials, unpatched systems, insecure kernel components, and unsafe Windows DLL search paths. Prevent it with least privilege, patching, MFA, secure configuration, application control, and monitoring.

## 4.11 Operating-System Hardening

| Action | Security benefit |
|---|---|
| Disable unnecessary services | Reduces attack surface |
| Remove or disable default accounts | Removes known access paths |
| Apply patches regularly | Fixes known vulnerabilities |
| Configure host firewalls | Restricts unauthorized traffic |
| Enable centralized logging | Supports detection and forensics |
| Use strong authentication | Reduces credential attacks |
| Control removable media | Limits malware and data theft |
| Enable disk encryption | Protects data at rest |
| Apply least privilege | Limits damage after compromise |
| Keep applications updated | Removes vulnerable versions |

Use a documented baseline, test changes before rollout, and retain a rollback plan.

## 4.12 Honeypots

A honeypot is a decoy system designed to attract or detect unauthorized activity.

- **Low interaction:** Simulates selected services; easier to operate but provides limited intelligence.
- **High interaction:** More realistic and informative but carries greater containment and maintenance risk.

Honeypots must be isolated, monitored, legally approved, and prevented from becoming a bridge to production systems.

## 4.13 Threat Intelligence and OSINT

| Term | Definition | Examples |
|---|---|---|
| Threat intelligence | Information about current and emerging threats | Threat reports and feeds |
| OSINT | Intelligence from public sources | Public DNS, WHOIS, websites, and social media |
| IOC | Evidence associated with compromise | Malicious IP, hash, domain, or registry change |
| TTP | How an adversary operates | MITRE ATT&CK techniques |

Validate sources, record confidence and timestamps, protect personal information, and use OSINT only for legitimate authorized purposes.

## 4.14 Compliance and Risk

```text
Risk = Threat x Vulnerability x Impact
```

- **Threat:** What might cause harm.
- **Vulnerability:** A weakness that can be exploited.
- **Impact:** The consequence if exploitation succeeds.

Risk responses include:

- **Accept:** Retain the risk within approved tolerance.
- **Mitigate:** Reduce likelihood or impact with controls.
- **Transfer:** Share the risk through insurance or a supplier contract.
- **Avoid:** Stop the risky activity or remove the exposure.

| Role | Responsibility |
|---|---|
| Compliance officer | Maps controls to applicable regulations and policies |
| Auditor | Independently evaluates control effectiveness |
| Stakeholders | Own business risk decisions |
| HR | Supports awareness training and insider-risk processes |
| Legal | Advises on notification, contracts, and liability |

## 4.15 Backups and Resilience

| Type | Includes | Backup speed | Restore considerations |
|---|---|---|---|
| Full | Everything selected | Slowest and largest | Fastest single-backup restore |
| Incremental | Changes since the previous backup | Fast and smallest | Requires the full backup and every needed incremental |
| Differential | Changes since the last full backup | Medium | Requires the full backup and latest differential |

Follow the **3-2-1 rule**: keep three copies of data, on two different storage types, with one copy offsite. Also test restoration, protect backups from ransomware, define recovery objectives, and document ownership.

## 4.16 Practical Security Checklist

- [ ] Classify important data and define confidentiality, integrity, and availability requirements.
- [ ] Enforce MFA and least privilege for users, services, and administrators.
- [ ] Layer physical, network, host, application, and data controls.
- [ ] Patch operating systems, applications, devices, and dependencies.
- [ ] Centralize logs and tune IDS, IPS, endpoint, and identity detections.
- [ ] Test controls for false positives and false negatives.
- [ ] Protect keys, secrets, certificates, password hashes, and backups.
- [ ] Review privilege changes and investigate unexpected access.
- [ ] Maintain an asset, vulnerability, risk, and control inventory.
- [ ] Practice incident response and disaster recovery in an authorized environment.

## 4.17 Key Takeaways

- The CIA triad guides security decisions.
- Authentication proves identity; authorization determines permissions.
- MFA is strongest when it combines different factor categories.
- Defense in depth avoids dependence on one control.
- Zero Trust verifies every request and limits access.
- Hashing is one-way; encryption supports protected two-way data recovery.
- Privilege escalation and misconfiguration are major sources of compromise.
- Hardening removes unnecessary functionality and access.
- Backups and tested recovery protect availability and resilience.

**Next:** Continue to [Security Roadmap](security-roadmap.md), then study attack types and their differences.