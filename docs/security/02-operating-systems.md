# Section 2: Operating Systems

> **Difficulty:** Beginner | **Prerequisite:** [Section 1: Fundamental IT Skills](01-fundamental-it-skills.md)

You must understand operating systems deeply because many attacks target operating-system services, permissions, processes, and vulnerabilities.

## 2.1 What Is an Operating System?

An operating system (OS) is software that manages hardware and provides services for applications.

### Hotel Manager Analogy

- **Building:** Hardware
- **Manager:** The OS, which manages rooms, staff, and guests
- **Guests:** Applications using system resources
- **Room service, keys, and rules:** OS services such as memory, files, networking, and security

### The Three Major Operating Systems

| OS | Creator | Primary use | Approximate desktop share |
|---|---|---|---|
| **Windows** | Microsoft | Enterprise, gaming, general use | About 72% |
| **Linux** | Open-source community | Servers, development, security | About 3% desktop; common on servers |
| **macOS** | Apple | Creative work and development | About 15% |

Market share changes over time and varies by source. The security lesson is that every platform needs patching, hardening, monitoring, and least-privilege access.

## 2.2 Windows

### Key Versions

| Version | Release | Support status | Key feature or note |
|---|---:|---|---|
| Windows 7 | 2009 | End of life | Still found in some legacy systems |
| Windows 8/8.1 | 2012 | End of life | Introduced the Metro interface |
| Windows 10 | 2015 | Check current support lifecycle | Widely deployed in existing environments |
| Windows 11 | 2021 | Current supported client release | TPM 2.0, Secure Boot, modern security features |
| Windows Server 2022 | 2021 | Supported server release | Enterprise server workloads |
| Windows Server 2025 | 2024 | Supported server release | Latest server release in this study set |

Always verify support dates with Microsoft's current lifecycle documentation before planning upgrades.

### Windows Architecture

```text
+------------------------------------------------------+
|                    USER MODE (Ring 3)                |
|   Applications | Services | System processes         |
|   Chrome, Word  | Print, DHCP | csrss.exe, svchost   |
+------------------------------------------------------+
|                    KERNEL MODE (Ring 0)              |
|   Windows kernel | Device drivers | Hardware access |
|   ntoskrnl.exe  | Network, disk, USB drivers         |
+------------------------------------------------------+
|          HAL (Hardware Abstraction Layer)            |
+------------------------------------------------------+
|                       HARDWARE                       |
+------------------------------------------------------+
```

User-mode applications have restricted access. Kernel-mode code, including the kernel and drivers, has much greater privilege. A vulnerable driver or kernel component can therefore have serious security impact.

### Essential Windows Commands

Run administrative commands only when required and in an authorized environment.

| Command | What it does | Example |
|---|---|---|
| `ipconfig` | Shows network configuration | `ipconfig /all` |
| `ping` | Tests connectivity | `ping 8.8.8.8` |
| `tracert` | Traces a route | `tracert example.com` |
| `nslookup` | Performs a DNS lookup | `nslookup example.com` |
| `netstat` | Shows connections and ports | `netstat -an` |
| `tasklist` | Lists running processes | `tasklist` |
| `taskkill` | Stops a process | `taskkill /PID 1234 /F` |
| `systeminfo` | Shows system details | `systeminfo` |
| `sfc /scannow` | Checks and repairs system files | `sfc /scannow` |
| `net user` | Manages local user accounts | `net user` |
| `whoami` | Shows the current user and privileges | `whoami /priv` |
| `dir` | Lists directory contents | `dir /a` |
| `cls` | Clears the console | `cls` |
| `gpupdate /force` | Refreshes Group Policy | `gpupdate /force` |

### Windows File Permissions

| Permission | Common abbreviation | Meaning |
|---|---|---|
| Full Control | F | Read, write, execute, delete, and change permissions |
| Modify | M | Read, write, execute, and delete |
| Read & Execute | RX | Open and run files |
| Read | R | View files only |
| Write | W | Create or modify files |

Effective Windows permissions can be affected by both NTFS permissions and share permissions. When troubleshooting access, evaluate group membership and inherited permissions rather than granting broad access immediately.

### Important Windows Locations

| Location | Path or tool | Purpose |
|---|---|---|
| System root | `C:\Windows\` | Core operating-system files |
| System32 | `C:\Windows\System32\` | Critical system binaries and libraries |
| Hosts file | `C:\Windows\System32\drivers\etc\hosts` | Local hostname overrides |
| Temporary files | `%TEMP%` | Temporary user files |
| User profiles | `C:\Users\` | User home directories |
| Program Files | `C:\Program Files\` | Installed applications |
| Registry | `regedit` | System and application configuration database |
| Event logs | `eventvwr.msc` | System, security, and application events |

Protect administrative tools and sensitive locations with least privilege, application control, endpoint protection, and centralized monitoring.

## 2.3 Linux

### Why Linux Matters for Cybersecurity

1. Linux is widely used for servers and cloud infrastructure.
2. Many security tools are developed for Linux environments.
3. Kali Linux and Parrot OS provide security-focused distributions.
4. Understanding Linux helps with server and container security.
5. AWS, Azure, and GCP all commonly host Linux workloads.

### Common Linux Distributions

| Distribution | Based on | Primary use | Package manager |
|---|---|---|---|
| **Ubuntu** | Debian | Desktop, servers, beginners | `apt` |
| **Kali Linux** | Debian | Authorized penetration testing | `apt` |
| **Parrot OS** | Debian | Security, forensics, privacy | `apt` |
| **CentOS / Rocky Linux** | Red Hat | Enterprise servers | `yum`/`dnf` |
| **Fedora** | Red Hat | Modern desktop and development | `dnf` |
| **Arch Linux** | Independent | Advanced users and customization | `pacman` |
| **SUSE** | Independent | Enterprise servers | `zypper` |

### Linux File-System Structure

```text
/                 Root: everything starts here
|-- /bin           Essential user binaries
|-- /sbin          System binaries
|-- /etc           Configuration files
|-- /home          User home directories
|-- /root          Root user's home directory
|-- /var           Variable data, including logs
|-- /tmp           Temporary files
|-- /usr           User programs and utilities
|-- /opt           Optional or third-party software
|-- /dev           Device files
|-- /proc          Process and kernel information
|-- /boot          Boot loader files and kernel
`-- /mnt           Mount points for external drives
```

### Essential Linux Commands

| Command | What it does | Example |
|---|---|---|
| `ls` | Lists files | `ls -la` |
| `cd` | Changes directory | `cd /etc` |
| `pwd` | Prints the working directory | `pwd` |
| `cat` | Displays file content | `cat /etc/passwd` |
| `grep` | Searches text patterns | `grep "root" /etc/passwd` |
| `find` | Finds files | `find . -name "*.log"` |
| `chmod` | Changes permissions | `chmod 755 script.sh` |
| `chown` | Changes ownership | `sudo chown root:root file.txt` |
| `sudo` | Runs a command with elevated privileges | `sudo apt update` |
| `apt` | Manages Debian packages | `sudo apt install nmap` |
| `ps` | Lists processes | `ps aux` |
| `kill` | Sends a signal to a process | `kill -TERM 1234` |
| `top` / `htop` | Monitors processes | `top` |
| `ip` | Shows network configuration | `ip addr show` |
| `ss` | Shows network connections | `ss -tulnp` |
| `tail` | Shows the last lines of a file | `tail -f /var/log/syslog` |
| `head` | Shows the first lines of a file | `head -20 file.txt` |
| `nano` / `vim` | Edits text files | `nano /etc/hosts` |
| `wget` / `curl` | Transfers data over a network | `curl https://example.com` |
| `tar` | Archives and extracts files | `tar -xvf file.tar.gz` |
| `ssh` | Connects securely to a remote host | `ssh user@192.0.2.10` |
| `scp` | Copies files over SSH | `scp file.txt user@host:/path` |

Avoid running commands copied from untrusted sources. Inspect scripts before execution and use test systems for security exercises.

### Linux Permissions

Linux permissions are commonly represented as `rwxrwxrwx` for owner, group, and others.

```text
rwx rwx rwx
||| ||| |||
||| ||| +++-- Others: read, write, execute
||| +++----- Group: read, write, execute
+++--------- Owner: read, write, execute

r = 4, w = 2, x = 1
```

| Mode | Symbolic form | Meaning |
|---|---|---|
| `755` | `rwxr-xr-x` | Owner can modify; group and others can read and execute |
| `644` | `rw-r--r--` | Owner can read and write; group and others can read |
| `777` | `rwxrwxrwx` | Everyone has full access; generally dangerous |
| `600` | `rw-------` | Owner only; appropriate for many private files |

Use groups and narrowly scoped permissions instead of making files world-writable. For private keys, also protect the parent directory and verify ownership.

### Important Linux Security Files

| File | Purpose | Security relevance |
|---|---|---|
| `/etc/passwd` | User account list | Usernames are generally readable |
| `/etc/shadow` | Password hashes | Restrict to privileged access |
| `/etc/group` | Group membership | Shows access group relationships |
| `/etc/sudoers` | Sudo policy | Defines commands users may run as root |
| `/etc/ssh/sshd_config` | SSH server configuration | Controls remote access and hardening |
| `/var/log/auth.log` | Authentication events | Useful for detecting brute-force attempts |
| `/var/log/syslog` | General system events | Supports troubleshooting and investigation |
| `/etc/hosts` | Local name resolution | Unauthorized changes can redirect traffic |

## 2.4 macOS

### Key Facts

| Feature | Detail |
|---|---|
| Base | Darwin, with BSD and Unix foundations |
| Shell | zsh by default on modern macOS |
| File system | APFS (Apple File System) |
| Security | Gatekeeper, XProtect, and FileVault |
| Terminal | Unix command line with many familiar tools |

### macOS Security Features

| Feature | What it does |
|---|---|
| **Gatekeeper** | Helps control which applications can run |
| **XProtect** | Provides built-in malware protection for known threats |
| **FileVault** | Encrypts the startup disk |
| **SIP** (System Integrity Protection) | Restricts modification of protected system files |
| **Keychain** | Stores passwords, keys, and certificates securely |

macOS security features reduce risk but do not replace updates, MFA, least privilege, backups, or user awareness.

## 2.5 CRUD Operations on Files

CRUD means **Create, Read, Update, Delete**. The commands below should be used carefully, especially commands that recursively delete directories.

| Operation | Windows CMD | Linux/macOS terminal |
|---|---|---|
| Create file | `echo Hello > file.txt` | `touch file.txt` |
| Read file | `type file.txt` | `cat file.txt` |
| Update file | `echo More >> file.txt` | `echo "More" >> file.txt` |
| Delete file | `del file.txt` | `rm file.txt` |
| Create folder | `mkdir myfolder` | `mkdir myfolder` |
| Delete folder | `rmdir /s myfolder` | `rm -rf myfolder` |
| Copy file | `copy file.txt backup.txt` | `cp file.txt backup.txt` |
| Move or rename | `move old.txt new.txt` | `mv old.txt new.txt` |

Before deleting or overwriting data, confirm the path, create a backup when appropriate, and use a lab directory for practice.

## 2.6 Software Installation

| Method | Windows | Linux | macOS |
|---|---|---|---|
| GUI | `.exe` or `.msi` installer | Software Center | `.dmg` or App Store |
| CLI | `winget install <app>` | `apt install <app>` | `brew install <app>` |
| Package manager | `winget`, Chocolatey | `apt`, `yum`, `dnf`, `pacman` | Homebrew |
| From source | Less common | `make` and package-specific steps | Similar to Linux |

Install software from trusted sources, verify signatures or checksums when available, keep an inventory, and remove unsupported versions.

## 2.7 Operating-System Security Checklist

- [ ] Apply operating-system and application updates.
- [ ] Use standard accounts for routine work and elevate only when needed.
- [ ] Enable host firewall and endpoint protection controls.
- [ ] Remove unused services, applications, accounts, and network listeners.
- [ ] Review authentication, process, application, and system logs.
- [ ] Protect sensitive files with appropriate ownership and permissions.
- [ ] Enable disk encryption where supported.
- [ ] Back up important data and test restoration.
- [ ] Restrict remote administration and use secure protocols.
- [ ] Document configuration changes and retain a rollback plan.

## 2.8 Key Takeaways

- Windows is common on desktops and is a frequent malware target.
- Linux is essential for server, cloud, container, and security work.
- macOS has strong built-in protections but is not immune to attacks.
- Command-line skills are important across all three platforms.
- Misconfigured permissions can expose data or enable privilege escalation.
- Know where sensitive accounts, logs, configuration, and name-resolution files live.
- Use Kali Linux or Parrot OS only for authorized security testing.

**Next:** Continue to [Security Roadmap](security-roadmap.md), then study networking as the next roadmap stage.