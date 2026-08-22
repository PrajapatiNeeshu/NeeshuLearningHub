# Section 10: End-to-End Career Roadmap

> **Track:** CCNA, IT Support, Ethical Hacking, and SOC Analyst
>
> **Created:** August 11, 2026

This combined track develops practical IT support, networking, security, ethical-hacking, and SOC skills. Follow the phases in order, complete hands-on labs each week, and maintain the progress tracker as a living checklist.

## What You Will Learn

- **CCNA and networking:** TCP/IP, routing, switching, VLANs, subnetting, and troubleshooting.
- **IT support:** Hardware, software, Windows, Linux, tickets, and technical troubleshooting.
- **Ethical hacking:** Reconnaissance, vulnerability assessment, web security, and network security.
- **SOC analysis:** SIEM, log analysis, threat detection, incident response, and monitoring.

## How to Use This Roadmap

1. Follow Phase 0 through Phase 4 in order.
2. Complete the topics, labs, tools, checkpoints, and optional certification targets in each phase.
3. Update the progress tracker after each skill block.
4. Keep all offensive exercises inside isolated, authorized labs.

| Pace | Expected duration | Approach |
|---|---|---|
| Intensive | 6-8 months | Full-time study and daily labs |
| Part-time | 10-14 months | Evenings and weekends |
| Experienced IT fast track | 4-6 months | Review Phase 0-1 gaps, then specialize |

## Career Outcomes

| Track | Typical roles | Employer expectations |
|---|---|---|
| IT support | Help Desk L1/L2, Desktop Support | Tickets, Windows/Linux, hardware, basic networking |
| Networking | Network Technician, Junior NOC | Routing, switching, VLANs, subnetting, troubleshooting |
| Ethical hacking | Junior Pentester, VAPT Analyst | Recon, vulnerability assessment, web/network testing, reports |
| SOC | SOC L1/L2, Security Monitor | SIEM, logs, alert triage, playbooks, incident response |

## Phase 0: IT Support Foundations

**Goal:** Resolve common user and system issues end to end.

### Topics

- PC components, laptops, desktops, servers, peripherals, displays, printers, and cables.
- HDD, SSD, NVMe, SMART health, BIOS/UEFI, boot order, and Secure Boot.
- Operating-system installation, recovery, drivers, Device Manager, applications, package managers, accounts, permissions, backups, patching, and malware triage.
- Windows 10/11, NTFS shares, Event Viewer, services, Task Manager, Resource Monitor, PowerShell, Active Directory basics, RDP, DNS, proxies, profiles, and disk space.
- Linux distributions, `/etc`, `/var`, `/home`, `/tmp`, users, groups, `sudo`, `chmod`, `chown`, packages, processes, services, `journalctl`, logs, `ip`, `ss`, `dig`, and SSH.

### Troubleshooting Method

```text
1. Identify  -> What is broken, for whom, and since when?
2. Reproduce -> Can the failure be observed again?
3. Isolate   -> Hardware, software, network, account, or recent change?
4. Hypothesize -> Start with the most likely cause.
5. Test fix  -> Make one controlled change at a time.
6. Verify    -> Confirm the user and system are working.
7. Document  -> Record cause, fix, evidence, and prevention.
```

### Labs and Tools

1. Rebuild a Windows VM, then create standard and administrator accounts.
2. Break DNS in a lab and repair it using configuration checks and `ipconfig /flushdns`.
3. Create Linux users, set permissions, install a package, and inspect authentication logs.
4. Resolve a simulated no-internet ticket from cable and NIC through IP, gateway, DNS, and application.
5. Write ten clear ticket resolutions.

Use Event Viewer, `journalctl`, PowerShell, Bash, remote-support tools, SSH, ticketing concepts, and imaging concepts.

**Checkpoint:** Resolve common Windows, Linux, and hardware tickets, document them clearly, and escalate security-sensitive cases correctly.

**Optional targets:** CompTIA A+, Google IT Support, or Microsoft MD-102.

## Phase 1: CCNA and Networking

**Goal:** Understand how packets move and troubleshoot at a CCNA level.

### Topics

- OSI and TCP/IP models, encapsulation, MAC and IP addressing, ARP, ICMP, Ethernet, duplex, speed, cabling, and topologies.
- IPv4, RFC1918 private addresses, NAT, TCP/UDP, the TCP handshake, common ports, DNS, DHCP DORA, HTTP/HTTPS, TLS, and IPv6.
- CIDR, network/broadcast/usable hosts, binary masks, VLSM, and route summarization.
- Switches, hubs, routers, MAC tables, access/trunk VLANs, 802.1Q, inter-VLAN routing, STP, port security, and EtherChannel.
- Default routes, routing tables, static routes, OSPF concepts, ACLs, NAT/PAT, WAN, VPN, Wi-Fi, controllers, WPA2/WPA3, and roaming.

### Troubleshooting Flow

```text
Physical -> Link -> IP -> Gateway -> DNS -> Routing -> Application/Port/Firewall
```

Know `ipconfig /all`, `ip a`, `ip route`, `ping`, `tracert`/`traceroute`, `nslookup`/`dig`, `netstat`/`ss`, `arp`/`ip neigh`, and `Get-NetAdapter`. Learn Wireshark capture filters and display filters.

### CCNA Labs

1. Build two VLANs with a trunk and inter-VLAN routing.
2. Configure static routing across three routers.
3. Build a single-area OSPF lab.
4. Configure an ACL that allows web traffic and denies other traffic from a subnet.
5. Build DHCP and DNS in a small topology.
6. Break and repair a wrong gateway, VLAN, duplex setting, or ACL rule.

Use Cisco Packet Tracer, GNS3, EVE-NG, Wireshark, `iperf`, and daily troubleshooting commands.

**Checkpoint:** Design and subnet a small routed/switched network, configure VLANs, and troubleshoot with command and packet evidence.

**Cert target:** Cisco CCNA 200-301. CompTIA Network+ is an optional foundation.

## Phase 2: Security Foundations

**Goal:** Build the bridge from networking to offensive and defensive security.

- CIA triad, AAA, least privilege, Zero Trust, defense in depth, risk, threats, vulnerabilities, controls, policies, and attack surface.
- Hashing, encryption, encoding, symmetric and asymmetric cryptography, TLS certificates, MFA, SSO, and identity basics.
- Phishing, malware, credential attacks, MITM, spoofing, DoS/DDoS, XSS, SQL injection, CSRF, lateral movement, and privilege escalation.
- MITRE ATT&CK, Cyber Kill Chain, NIST CSF, incident response, and CVSS awareness.

### Labs

1. Map five public incident reports to MITRE ATT&CK techniques.
2. Compare cleartext and TLS traffic in an authorized capture.
3. Harden a Windows and Linux VM against a documented baseline.

**Checkpoint:** Explain attacks in business language and connect them to preventive and detective controls.

## Phase 3A: Ethical Hacking

**Goal:** Perform authorized assessments and write useful findings.

### Rules and Method

- Obtain written permission, scope, rules of engagement, test windows, emergency contacts, and data-handling requirements.
- Perform passive OSINT before active discovery.
- Enumerate approved hosts, ports, services, technologies, APIs, and authentication paths.
- Distinguish vulnerability scanning from penetration testing and validate scanner findings manually.
- Prioritize exploitability, business impact, exposure, and compensating controls.
- Report evidence without fearmongering and retest remediation.

### Focus Areas and Tools

- **Reconnaissance:** `whois`, `dig`, asset inventory, subdomain concepts, Nmap, and technology fingerprinting.
- **Assessment:** Nessus, OpenVAS, Qualys concepts, Nmap NSE, Nikto, CVE interpretation, and false-positive review.
- **Network testing:** SMB, SSH, RDP, FTP, SNMP, default accounts, open shares, and configuration review.
- **Web testing:** OWASP Top 10, Burp Suite, browser tools, OWASP ZAP, API authorization, rate limits, BOLA/IDOR, sessions, and security headers.

### Finding Template

1. Title and severity.
2. Affected asset or endpoint.
3. Description and impact.
4. Reproduction steps and evidence.
5. Business consequence.
6. Remediation and references.

### Progressive Labs

Use TryHackMe, OverTheWire, Hack The Box Starting Point, DVWA, OWASP Juice Shop, and isolated Metasploitable systems. Use Metasploit, Gobuster/ffuf, Nuclei, Hashcat, or John only inside authorized labs.

**Checkpoint:** Recon a lab target, identify and safely validate vulnerabilities, and write a clear remediation-focused report.

**Cert targets:** Security+, PenTest+, eJPT, PNPT, and later OSCP.

## Phase 3B: SOC Analyst

**Goal:** Detect, triage, escalate, and help contain real incidents.

### SOC Skills

- Understand L1, L2, and L3 responsibilities, shifts, ticketing, escalation, alert fatigue, and playbooks.
- Collect Windows Security and Sysmon events, Linux auth/syslog, firewall/proxy/DNS, EDR, cloud identity, VPN, and email-security logs.
- Understand SIEM ingestion, normalization, correlation, dashboards, and searches using KQL, SPL, or the selected platform's language.
- Build use cases for brute force, password spray, malware beaconing, suspicious PowerShell, impossible travel, MFA fatigue, and exfiltration.
- Learn IOC/IOA, Sigma, YARA awareness, MITRE mapping, threat hunting, C2 patterns, and living-off-the-land behavior.

### Alert Investigation

```text
Alert -> Scope who/what/when/where -> Build timeline -> Relate hosts/users
      -> Enrich with threat intelligence and asset criticality
      -> Close, monitor, escalate, or contain -> Document evidence
```

Ask whether activity is expected, who initiated it, which process or URL was involved, whether it succeeded, what happened before and after, and which control should prevent recurrence.

### Incident Response

1. Preparation.
2. Identification and detection.
3. Containment, short term and long term.
4. Eradication.
5. Recovery.
6. Lessons learned.

### SOC Labs and Tools

1. Stand up Wazuh, Elastic, Splunk, Sentinel, or Security Onion in a home lab.
2. Generate failed-login events and write a detection.
3. Investigate a phishing case study end to end.
4. Build a ransomware tabletop playbook.
5. Complete blue-team paths on TryHackMe.
6. Practice KQL or SPL with sample data.

Use SIEM and EDR concepts, Wireshark, tcpdump, VirusTotal without uploading confidential samples, URLScan, AbuseIPDB, ticketing tools, ATT&CK Navigator, and case-note templates.

**Checkpoint:** Investigate an alert with logs, make a defensible decision, escalate with evidence, and write a clean case summary.

**Cert targets:** Security+, CySA+, Microsoft SC-200, or a relevant Splunk certification.

## Phase 4: Capstone, Portfolio, and Job Readiness

### Home Lab Blueprint

```text
[Internet]
    |
[Router/firewall VM]
    |
    +-- Windows client
    +-- Windows Server or directory lab
    +-- Ubuntu server with web and logs
    +-- Isolated vulnerable lab VM
    +-- SIEM or Wazuh collector
```

Keep vulnerable VMs on host-only or isolated NAT networks. Never expose them to the public internet. Snapshot before experiments and remove temporary accounts and services afterward.

### Portfolio Projects

Complete at least three:

1. Network design packet with topology, IP plan, VLANs, and troubleshooting notes.
2. IT support runbook pack with ten common incidents.
3. Authorized pentest lab write-up from recon to remediation.
4. SOC detection pack with five detections and false-positive tuning notes.
5. Incident-response case study with timeline, ATT&CK mapping, and lessons learned.

### Interview Themes

| Track | Practice themes |
|---|---|
| IT support | Fix no internet; handle a difficult user; document and escalate |
| Networking | Switch versus router; subnet a `/26`; explain VLAN trunking |
| Ethical hacking | Scope a test; compare XSS and SQL injection; reduce false positives |
| SOC | Triage brute force; identify required logs; walk through ransomware response |

Use skill keywords honestly: TCP/IP, VLAN, subnetting, routing, switching, Wireshark, Windows, Linux, Active Directory, troubleshooting, Nmap, Burp Suite, OWASP, vulnerability assessment, SIEM, log analysis, threat detection, incident response, MITRE ATT&CK, and security monitoring.

## Suggested Eight-Month Part-Time Plan

| Month | Focus | Weekly outcome |
|---:|---|---|
| 1 | IT support and Windows/Linux | Ticket drills, OS labs, troubleshooting |
| 2 | Networking and subnetting | Daily subnetting and OSI/TCP labs |
| 3 | Switching and routing | VLAN and Packet Tracer labs |
| 4 | Troubleshooting and security foundations | Wireshark and security concepts |
| 5 | Ethical-hacking basics | Recon, Nmap, and OWASP labs |
| 6 | Web and network assessment | Burp, scans, and report writing |
| 7 | SOC, SIEM, and logs | Alert triage and detection labs |
| 8 | Incident response and job readiness | Capstone, portfolio, and interviews |

## Suggested Certification Ladder

```text
A+ or ITF+ (optional)
    -> Network+ or CCNA
        -> Security+
            -> CySA+ or SC-200 (SOC path)
            -> eJPT or PenTest+ -> OSCP (ethical-hacking path)
```

Certifications should support a target role, not replace practice. Pair every certificate with a lab, project, or documented work sample.

## Master Tools Map

| Category | Tools and skills |
|---|---|
| Support | PowerShell, Bash, Event Viewer, `journalctl`, remote tools |
| Networking | Packet Tracer/GNS3, Wireshark, ping, traceroute, dig |
| Offensive | Nmap, Burp Suite, Metasploit in labs, Gobuster/ffuf |
| Defensive | Wazuh, Splunk, Elastic, Sentinel, Sysmon, EDR concepts |
| Shared | MITRE ATT&CK, Git, Markdown notes, ticketing, documentation |

## Progress Tracker

| Phase | Area | Status | Notes |
|---:|---|---|---|
| 0 | Hardware and desktop support | Not started | |
| 0 | Windows and Linux support | Not started | |
| 0 | Troubleshooting method | Not started | |
| 1 | TCP/IP, ports, and subnetting | Not started | |
| 1 | Switching, VLANs, routing, and ACLs | Not started | |
| 1 | Network troubleshooting | Not started | |
| 2 | Security foundations | Not started | |
| 3A | Reconnaissance and assessment | Not started | |
| 3A | Web and network security testing | Not started | |
| 3A | Report writing | Not started | |
| 3B | SOC fundamentals and SIEM | Not started | |
| 3B | Log analysis and threat detection | Not started | |
| 3B | Incident response and monitoring | Not started | |
| 4 | Home lab and portfolio | Not started | |
| 4 | Certifications and interview preparation | Not started | |

Use `Not started`, `In progress`, or `Done`, and record the lab, project, or evidence that supports the status.

## Start This Week

1. Install VirtualBox or VMware and create one Windows and one Ubuntu VM.
2. Complete ten subnetting problems each day.
3. Create a private notes repository such as `cyber-e2e-lab`.
4. Choose a primary six-month target: SOC or IT/NOC, then deepen ethical-hacking skills.
5. Schedule Phase 0 and Phase 1 study blocks on the calendar.

## Safety Rules

- Test only systems you own or have explicit written permission to assess.
- Keep vulnerable machines isolated from the public internet.
- Define scope, rate limits, rules of engagement, and data handling before testing.
- Do not upload confidential samples to public analysis services.
- Remove secrets and personal data from reports and repositories.
- Snapshot before experiments and keep a rollback plan.

**Next:** Return to the [Security Roadmap](security-roadmap.md) and continue with the cloud-security focus area.