# Section 1: Fundamental IT Skills

> **Difficulty:** Beginner | **Prerequisite:** None

Before diving into cybersecurity, build a solid foundation in IT basics.

## 1.1 Computer Hardware Components

Hardware is the physical part of a computer that you can touch.

| Component | What It Does | Analogy |
|---|---|---|
| **CPU** (Central Processing Unit) | Executes instructions and performs calculations | The chef doing the actual cooking |
| **RAM** (Random Access Memory) | Temporary, fast memory for running programs | The chef's counter holding ingredients in use |
| **Hard Drive (HDD/SSD)** | Permanently stores files, the OS, and programs | The pantry storing everything long-term |
| **Motherboard** | Connects all computer components | The kitchen floor plan |
| **GPU** (Graphics Processing Unit) | Processes visual output and graphics-heavy tasks | A specialist assistant chef for graphics |
| **PSU** (Power Supply Unit) | Converts wall power into usable power | The kitchen's electrical panel |
| **NIC** (Network Interface Card) | Connects the computer to a network | The restaurant's phone line to the outside world |
| **ROM** (Read-Only Memory) | Stores permanent firmware such as BIOS or UEFI | A recipe book that rarely changes |

### HDD vs SSD

| Feature | HDD (Hard Disk Drive) | SSD (Solid State Drive) |
|---|---|---|
| Speed | Slower, commonly 100-200 MB/s | Faster, commonly 500-7000 MB/s |
| Moving parts | Yes, spinning disk | No, flash memory chips |
| Durability | More fragile if dropped | More durable |
| Cost | Cheaper per GB | More expensive per GB |
| Noise | Audible spinning or clicking | Silent |
| Best for | Bulk storage, backups, and archives | Operating system and daily use |

### BIOS vs UEFI

| Feature | BIOS (Basic Input/Output System) | UEFI (Unified Extensible Firmware Interface) |
|---|---|---|
| Age | Legacy standard | Modern standard |
| Boot speed | Slower | Faster |
| Drive support | Commonly limited by MBR to 2 TB | GPT supports much larger drives |
| Interface | Primarily text and keyboard | Can provide a graphical interface |
| Security | No Secure Boot | Supports Secure Boot |

> **Why this matters for cybersecurity:** Understanding hardware helps you identify physical attack paths such as malicious USB devices, hardware keyloggers, and firmware attacks, and helps you protect physical access.

## 1.2 Connection Types and Their Functions

Devices connect to one another and to networks through wired and wireless technologies.

### Wired Connections

| Type | Typical speed | Typical range | Use case |
|---|---|---|---|
| **Ethernet (RJ-45)** | 100 Mbps-10 Gbps | Up to 100 m per cable | Office networks, servers, desktops |
| **USB** | USB 2.0: 480 Mbps; USB 3.0: 5 Gbps; USB4: up to 40 Gbps | Up to 5 m | Peripherals, storage, charging |
| **Fiber optic** | Up to 100 Gbps | Up to 100 km | Data centers, ISP backbones, long-distance links |
| **Thunderbolt** | Up to 40 Gbps | Up to 2 m | High-speed data and displays |

### Wireless Connections

| Type | Range | Speed | Use case | Security risk |
|---|---|---|---|---|
| **Wi-Fi** | 30-100 m | Up to 9.6 Gbps for Wi-Fi 6 | Internet access and LANs | Eavesdropping and evil-twin attacks |
| **Bluetooth** | 10-100 m | 1-3 Mbps | Headphones, keyboards, file transfer | Bluejacking and bluesnarfing |
| **NFC** (Near Field Communication) | About 10 cm | Up to 424 Kbps | Contactless payments and access cards | Relay attacks and eavesdropping |
| **Infrared (IR)** | About 1 m, line of sight | Up to 4 Mbps | Remote controls and older devices | Limited range, but still requires physical control |
| **Cellular (4G/5G)** | Several kilometers or more | Varies by network | Mobile internet and IoT | SIM swapping and IMSI catchers |

### Wi-Fi Standards

| Standard | Common name | Maximum theoretical speed | Frequency |
|---|---|---|---|
| 802.11b | Wi-Fi 1 | 11 Mbps | 2.4 GHz |
| 802.11g | Wi-Fi 3 | 54 Mbps | 2.4 GHz |
| 802.11n | Wi-Fi 4 | 600 Mbps | 2.4/5 GHz |
| 802.11ac | Wi-Fi 5 | 3.5 Gbps | 5 GHz |
| 802.11ax | Wi-Fi 6 | 9.6 Gbps | 2.4/5/6 GHz |

> **Security note:** Every connection type is a potential attack surface. Secure Wi-Fi, Bluetooth, NFC, and cellular settings, keep firmware updated, and disable interfaces that are not needed.

## 1.3 OS-Independent Troubleshooting

The following six-step method works across operating systems and is based on the CompTIA troubleshooting model.

1. **Identify the problem:** Gather symptoms, error messages, timing, and recent changes.
2. **Establish a theory of probable cause:** Start with simple checks such as power, cables, connectivity, and permissions.
3. **Test the theory:** Apply a controlled test and check whether the symptom changes.
4. **Establish a plan of action:** Consider backups, downtime, user impact, and a rollback path.
5. **Implement the solution:** Apply the fix and verify that the system works as expected.
6. **Document everything:** Record the symptoms, investigation, change, result, and follow-up action.

### Common Troubleshooting Checks

| Problem | First checks |
|---|---|
| No internet | Cable connected, Wi-Fi enabled, router reachable, and IP address assigned |
| Slow computer | Open programs, disk space, resource usage, updates, and malware scan |
| Application crash | Application version, reinstall, configuration, and application logs |
| No display | Monitor power, display cable, input source, and graphics connection |
| Login fails | Caps Lock, username, password policy, account lockout, and identity service |
| Printer not working | Power, connection, driver, selected printer, and print queue |

## 1.4 Popular Software Suites

### Cloud Suites

| Suite | Provider | Key apps | Storage example |
|---|---|---|---|
| **Google Workspace** | Google | Gmail, Docs, Sheets, Slides, Drive, Meet | Google Drive |
| **Microsoft 365** | Microsoft | Outlook, Word, Excel, PowerPoint, Teams, OneDrive | OneDrive |
| **iCloud** | Apple | Mail, Pages, Numbers, Keynote, Drive | iCloud Drive |

### Microsoft 365 Applications

| Application | Purpose | Common file types |
|---|---|---|
| **Word** | Document creation | `.docx`, `.doc`, `.pdf` |
| **Excel** | Spreadsheets and data analysis | `.xlsx`, `.csv` |
| **PowerPoint** | Presentations | `.pptx`, `.ppt` |
| **Outlook** | Email and calendar | `.pst`, `.ost` |
| **Teams** | Communication and collaboration | Varies |
| **Access** | Database management | `.accdb`, `.mdb` |
| **OneNote** | Note-taking | `.one` |

### Google Workspace Applications

| Application | Microsoft 365 equivalent | Key feature |
|---|---|---|
| **Google Docs** | Word | Real-time collaboration |
| **Google Sheets** | Excel | Browser-based spreadsheets |
| **Google Slides** | PowerPoint | Sharing through links |
| **Google Drive** | OneDrive | Cloud file storage |
| **Gmail** | Outlook | Email and calendar integrations |
| **Google Meet** | Teams | Video conferencing |

> **Why this matters for cybersecurity:** Enterprise cloud suites are common phishing targets. Understanding them helps you recognize fake login pages, apply access management, and think about data loss prevention.

## 1.5 Key Takeaways

- Know your hardware because physical security starts with the device.
- Understand wired and wireless connections and their different attack surfaces.
- Troubleshoot systematically with a repeatable six-step process.
- Recognize common business software because it is frequently targeted by phishing.
- Treat every connection type as a potential vulnerability that needs appropriate controls.

## Practice Checklist

- [ ] Identify the CPU, RAM, storage, motherboard, GPU, PSU, and NIC on a lab computer.
- [ ] Compare an HDD and SSD and explain the security implications of each.
- [ ] Document a six-step troubleshooting exercise for a harmless lab problem.
- [ ] Check which wireless interfaces are enabled and disable unused interfaces.
- [ ] Enable MFA and review sign-in activity for a cloud productivity account.

**Next:** Continue to [Security Roadmap](security-roadmap.md) and then study operating systems as the next roadmap stage.