# Section 3: Networking Knowledge

> **Difficulty:** Beginner-Intermediate | **Prerequisite:** [Sections 1-2](02-operating-systems.md)

Networking is the backbone of cybersecurity. If you understand how data moves, you can reason about where to protect it, monitor it, and investigate attacks.

## 3.1 The OSI Model

The Open Systems Interconnection model divides networking into seven layers. Data moves down the layers when sent and up the layers when received.

| Layer | Name | What it does | Protocols and technologies | Analogy |
|---:|---|---|---|---|
| 7 | Application | Provides user-facing network services | HTTP, HTTPS, FTP, DNS, SMTP, SSH, RDP | The letter you write |
| 6 | Presentation | Formats, translates, and encrypts data | TLS, JPEG, GIF, ASCII | Translating the letter |
| 5 | Session | Opens, maintains, and closes sessions | RPC, NetBIOS | A phone call |
| 4 | Transport | Delivers segments between applications | TCP, UDP, ports | The delivery service |
| 3 | Network | Routes packets between networks | IP, ICMP, IPsec, routers | The address on an envelope |
| 2 | Data Link | Delivers frames on a local network | Ethernet, Wi-Fi, MAC, ARP, switches | Local mail delivery |
| 1 | Physical | Transmits raw bits as signals | Cables, hubs, NICs, radio | The road carrying the mail |

### OSI Memory Tricks

- **Top down:** All People Seem To Need Data Processing.
- **Bottom up:** Please Do Not Throw Sausage Pizza Away.

### TCP vs UDP

| Feature | TCP (Transmission Control Protocol) | UDP (User Datagram Protocol) |
|---|---|---|
| Connection | Connection-oriented; handshake first | Connectionless |
| Reliability | Acknowledgements and retransmission | No delivery guarantee |
| Speed | More overhead and generally slower | Lower overhead and generally faster |
| Ordering | Delivers an ordered stream | Datagrams can arrive out of order |
| Use cases | Web, email, and file transfer | Streaming, gaming, DNS, and VoIP |
| Analogy | Tracked registered mail | A postcard without tracking |

### TCP Three-Way Handshake

```text
Client                         Server
  | -------- SYN -------------> |  Client requests a connection
  | <------ SYN-ACK ----------- |  Server accepts and responds
  | -------- ACK -------------> |  Client confirms
  | <====== DATA FLOW ========> |  Communication begins
  | -------- FIN -------------> |  Client starts closing
  | <--------- ACK ------------ |  Server acknowledges
```

## 3.2 Common Protocols and Their Uses

| Protocol | Port | Layer | Purpose | Safer or modern alternative |
|---|---:|---:|---|---|
| HTTP | 80 | 7 | Unencrypted web traffic | HTTPS, 443 |
| HTTPS | 443 | 7 | Web traffic protected by TLS | Current web standard |
| FTP | 21 | 7 | Unencrypted file transfer | SFTP, 22, or FTPS |
| SSH/SFTP | 22 | 7 | Secure remote access and file transfer | Current secure option |
| Telnet | 23 | 7 | Unencrypted remote terminal | SSH, 22 |
| SMTP | 25 | 7 | Sends email | SMTP with TLS, commonly 465/587 |
| DNS | 53 | 7 | Resolves names to IP addresses | DNSSEC, DoT, or DoH as appropriate |
| DHCP | 67/68 | 7 | Assigns IP configuration | Network controls and DHCP snooping |
| TFTP | 69 | 7 | Simple unauthenticated file transfer | Use an authenticated alternative |
| POP3 | 110 | 7 | Downloads email | POP3S, 995 |
| IMAP | 143 | 7 | Synchronizes email | IMAPS, 993 |
| SNMP | 161 | 7 | Monitors network devices | SNMPv3 |
| LDAP | 389 | 7 | Directory services | LDAPS, 636 |
| RDP | 3389 | 7 | Windows remote desktop | Restrict with VPN, MFA, and gateways |
| NTP | 123 | 7 | Synchronizes clocks | Authenticated time sources |

### Insecure and Secure Protocols

| Avoid when possible | Prefer | Protection added |
|---|---|---|
| HTTP | HTTPS | TLS encryption and server authentication |
| FTP | SFTP or FTPS | SSH or TLS encryption |
| Telnet | SSH | Encrypted remote access |
| Plain SMTP | SMTP with TLS | Protected email transport |
| LDAP | LDAPS | TLS-protected directory queries |
| SNMPv1/v2 | SNMPv3 | Authentication, integrity, and encryption options |
| Unsigned DNS | DNSSEC | Record integrity and origin authentication |

## 3.3 Common Ports to Know

| Port | Protocol | Reminder |
|---:|---|---|
| 20/21 | FTP | File Transfer Protocol |
| 22 | SSH/SFTP | Secure Shell |
| 23 | Telnet | Legacy remote access; insecure |
| 25 | SMTP | Sends mail |
| 53 | DNS | Domain Name System |
| 67/68 | DHCP | Dynamic IP assignment |
| 80 | HTTP | Unencrypted web |
| 110 | POP3 | Pulls email |
| 143 | IMAP | Inbox synchronization |
| 389 | LDAP | Directory services |
| 443 | HTTPS | Secure web |
| 445 | SMB | Windows file sharing |
| 636 | LDAPS | Secure directory services |
| 3389 | RDP | Remote Desktop |

## 3.4 IP Addressing

### IPv4 vs IPv6

| Feature | IPv4 | IPv6 |
|---|---|---|
| Format | `192.168.1.1` | `2001:db8:85a3::8a2e:370:7334` |
| Address size | 32 bits | 128 bits |
| Address space | About 4.3 billion addresses | Vast address space |
| Example | `10.0.0.1` | `fe80::1` |

### Public and Private Addresses

| Type | Range or example | Use |
|---|---|---|
| Private Class A | `10.0.0.0/8` | Large internal networks |
| Private Class B | `172.16.0.0/12` | Medium internal networks |
| Private Class C | `192.168.0.0/16` | Home and small-office networks |
| Public | Globally routable addresses | Internet communication |
| Loopback | `127.0.0.1` | This machine itself |
| APIPA | `169.254.0.0/16` | Automatic address when DHCP fails |

Private IPs are like room numbers inside a hotel. A public IP is the hotel's street address. NAT is the front desk translating between internal room numbers and the public address.

### Key IP Terms

| Term | Definition |
|---|---|
| Localhost | The current machine, commonly `127.0.0.1` |
| Loopback | An interface for traffic addressed back to the same machine |
| CIDR | Notation for an IP range, such as `192.168.1.0/24` |
| Subnet mask | Separates network bits from host bits, such as `255.255.255.0` |
| Default gateway | Router used to reach other networks |
| NAT | Translates private addresses to public addresses and back |

### Subnetting Basics

```text
IP address:  192.168.1.100
Mask:        255.255.255.0 (/24)
Network:     192.168.1.0
Host:        100

/8   = 255.0.0.0       About 16 million usable hosts in a traditional subnet
/16  = 255.255.0.0     65,534 usable hosts
/24  = 255.255.255.0   254 usable hosts
/32  = 255.255.255.255 One address
```

Subnetting supports segmentation: separate users, servers, management interfaces, and public-facing systems so a compromise does not automatically provide access to everything.

## 3.5 Network Services

### DHCP

The Dynamic Host Configuration Protocol assigns network settings automatically. Servers commonly listen on UDP 67 and clients use UDP 68.

The four-step exchange is **DORA**:

1. **Discover:** The device broadcasts that it needs an address.
2. **Offer:** A DHCP server proposes an address and settings.
3. **Request:** The device requests the offered configuration.
4. **Acknowledge:** The server confirms the lease.

Defensive controls include DHCP snooping, trusted switch ports, monitored scopes, and protection against unauthorized DHCP servers.

### DNS

The Domain Name System translates names into addresses. A browser may resolve `www.example.com` to an IP address before creating a connection.

| Record | Purpose |
|---|---|
| A | Name to IPv4 address |
| AAAA | Name to IPv6 address |
| CNAME | Alias to another name |
| MX | Mail server for a domain |
| NS | Authoritative name server |
| PTR | Reverse lookup from IP to name |
| TXT | Text, SPF, DKIM, and verification records |
| SOA | Start of Authority and zone metadata |

Protect DNS with controlled updates, monitoring, split-horizon design where appropriate, and DNSSEC for record integrity.

### NTP and IPAM

- **NTP (Network Time Protocol):** Synchronizes clocks, usually over UDP 123. Accurate time is essential for logs, incident timelines, certificates, and authentication.
- **IPAM (IP Address Management):** Tracks address ranges, assignments, DNS records, and DHCP information in one controlled inventory.

## 3.6 Network Topologies and Types

| Topology | Strength | Limitation |
|---|---|---|
| Star | Easy to manage; one endpoint failure is isolated | Central switch can be a single failure point |
| Bus | Simple and inexpensive | A cable failure can affect the whole segment |
| Ring | Predictable traffic flow | A break can interrupt service without redundancy |
| Mesh | Highly resilient and redundant | Expensive and complex to manage |

| Network type | Full form | Typical range | Example |
|---|---|---|---|
| LAN | Local Area Network | Building or campus | Office network |
| WAN | Wide Area Network | Cities or countries | Corporate wide-area network |
| WLAN | Wireless LAN | Local wireless coverage | Coffee-shop Wi-Fi |
| MAN | Metropolitan Area Network | A city | City fiber network |

## 3.7 Key Network Terms

| Term | Definition | Security relevance |
|---|---|---|
| Router | Connects networks and routes using IP | Enforces routing and often filtering policy |
| Switch | Connects local devices using MAC addresses | Supports VLANs and port security |
| Hub | Repeats traffic to every port | Offers no segmentation or traffic privacy |
| VLAN | Logically separates a physical network | Limits broadcast domains and lateral movement |
| DMZ | Segment between public and private networks | Isolates internet-facing services |
| ARP | Maps local IP addresses to MAC addresses | Can be abused for local traffic redirection |
| VPN | Encrypted tunnel across an untrusted network | Protects remote access when configured well |
| VM | Software-based computer on a host | Requires isolation and host security |

## 3.8 SSL/TLS Basics

SSL is deprecated. Modern systems should use supported TLS versions, commonly TLS 1.2 or TLS 1.3, according to their compatibility requirements.

Simplified TLS flow:

1. The client sends supported protocol versions and cryptographic options.
2. The server selects options and sends its certificate.
3. The client validates the certificate chain, name, and validity.
4. Both sides establish shared session keys.
5. Application data is encrypted and integrity-protected.

HTTPS indicates HTTP carried over TLS. Encryption protects data in transit, but it does not make an unsafe application, compromised endpoint, or untrusted certificate automatically safe.

## 3.9 NAS vs SAN

| Feature | NAS (Network Attached Storage) | SAN (Storage Area Network) |
|---|---|---|
| Connection | Standard IP network | Dedicated high-speed storage network |
| Access | File-level, like a shared folder | Block-level, like a raw disk |
| Speed | Good for file sharing and backups | High performance for databases and VMs |
| Cost | Usually more affordable | Usually more expensive |
| Use cases | Files, backups, and media | Mission-critical applications |

## 3.10 Virtualization Basics

| Term | Definition |
|---|---|
| Hypervisor | Software that creates and manages virtual machines |
| Virtual machine | Software-based computer running inside a physical host |
| Host OS | Operating system on the physical machine |
| Guest OS | Operating system inside a virtual machine |
| Type 1 hypervisor | Runs directly on hardware, such as ESXi or Hyper-V Server |
| Type 2 hypervisor | Runs on a host OS, such as VirtualBox or VMware Workstation |

```text
Type 1:  VMs -> Hypervisor -> Hardware
Type 2:  VMs -> Hypervisor -> Host OS -> Hardware
```

Virtualization improves isolation and utilization, but it is not a substitute for patching, access control, network segmentation, or secure configuration.

## 3.11 Troubleshooting Tools

Use scanning and packet-capture tools only on systems and networks you own or are explicitly authorized to test.

| Tool | What it does | Example |
|---|---|---|
| `ping` | Tests reachability | `ping 8.8.8.8` |
| `tracert` / `traceroute` | Shows packet path | `tracert example.com` |
| `nslookup` / `dig` | Performs DNS lookups | `nslookup example.com` |
| `ipconfig` / `ifconfig` | Shows local IP configuration | `ipconfig /all` |
| `netstat` / `ss` | Shows active connections | `ss -tulnp` |
| `arp` | Shows the ARP cache | `arp -a` |
| `nmap` | Authorized host and port discovery | `nmap -sV 192.0.2.10` |
| `tcpdump` | Captures packets from the command line | `tcpdump -i eth0 port 443` |
| Wireshark | Captures and analyzes packets graphically | Inspect a lab capture |
| `iptables` | Manages Linux firewall rules | `iptables -L` |
| `route` | Displays routing information | `route print` |

## 3.12 Authentication Methodologies

| Method | What it does | Common use |
|---|---|---|
| Kerberos | Ticket-based authentication | Windows domains and Active Directory |
| LDAP | Queries directory services | User and group lookups |
| SSO | One identity for multiple applications | Enterprise application access |
| RADIUS | Centralizes network access authentication | Wi-Fi and VPN access |
| Certificates | Proves digital identity using X.509 | HTTPS and device authentication |
| Local authentication | Stores identity data on the device | Standalone computers |

Use MFA, short-lived credentials, least privilege, certificate lifecycle management, and monitoring alongside the authentication method.

## 3.13 Network Security Checklist

- [ ] Segment users, servers, management, and public services with appropriate controls.
- [ ] Restrict inbound and outbound traffic to required ports and destinations.
- [ ] Replace Telnet, FTP, and plain HTTP with secure alternatives.
- [ ] Protect DNS, DHCP, and time services from unauthorized changes.
- [ ] Use TLS with valid certificates and supported protocol versions.
- [ ] Monitor authentication, DNS, firewall, VPN, and network-flow logs.
- [ ] Inventory IP addresses, devices, services, and owners.
- [ ] Review exposed ports and remove unnecessary listeners.
- [ ] Test firewall and segmentation rules in an authorized lab.
- [ ] Keep network devices, hypervisors, and firmware patched.

## 3.14 Key Takeaways

- Memorize the OSI model and use it to isolate failures and attack surfaces.
- TCP prioritizes reliable ordered delivery; UDP prioritizes low overhead.
- Know common ports such as 22, 25, 53, 80, 443, 445, and 3389.
- Understand DNS, DHCP DORA, NAT, private and public addresses, and subnetting.
- Use secure alternatives to Telnet, FTP, and unencrypted HTTP.
- Network segmentation limits lateral movement after a compromise.
- The TCP handshake is SYN, SYN-ACK, ACK.

**Next:** Continue to [Security Roadmap](security-roadmap.md) and then study [Security Basics](security-basics.md).