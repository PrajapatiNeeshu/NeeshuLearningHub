# Section 1: Fundamental IT Skills – Best Resources

> **Difficulty:** Beginner | **Main Outcome:** Understand hardware, software, files, and connections

---

## 📘 Official Courses & Learning Platforms

| Resource | Provider | Link |
|---|---|---|
| IT Support Professional Certificate | Google (Coursera) | [coursera.org/google-it-support](https://www.coursera.org/professional-certificates/google-it-support) |
| CompTIA IT Fundamentals (ITF+) Study Guide | CompTIA | [comptia.org/certifications/it-fundamentals](https://www.comptia.org/certifications/it-fundamentals) |
| Computer Science 101 | Stanford (edX) | [edx.org/cs101](https://www.edx.org/learn/computer-science/stanford-university-computer-science-101) |
| Introduction to Computers and Office Productivity | Microsoft Learn | [learn.microsoft.com](https://learn.microsoft.com/en-us/training/paths/get-started-with-windows/) |
| CS50: Introduction to Computer Science | Harvard (edX) | [cs50.harvard.edu](https://cs50.harvard.edu/x/) |
| Digital Literacy Course | GCFGlobal | [gcfglobal.org/en/computerbasics](https://edu.gcfglobal.org/en/computerbasics/) |

## 🔧 Hardware & How Computers Work

| Resource | Provider | Link |
|---|---|---|
| How Computers Work | Code.org (YouTube) | [youtube.com/code.org](https://www.youtube.com/playlist?list=PLzdnOPI1iJNcsRwJhvksEo1tJqjIqWbN-) |
| Build a PC Guide | PC Part Picker | [pcpartpicker.com](https://pcpartpicker.com/guide/) |
| Computer Hardware Basics | Cisco Networking Academy | [skillsforall.com](https://skillsforall.com/course/computer-hardware-basics) |
| Inside Your Computer – TED-Ed | TED-Ed | [ed.ted.com](https://ed.ted.com/lessons/how-do-hard-drives-work-kanawat-senanan) |
# Hardware & How Computers Work - Complete Learning Guide

## Overview
This guide covers how computers work, hardware components, operating systems, storage, memory, networking, troubleshooting, and hands-on learning topics.

---

# 1. What is a Computer?

A computer is an electronic device that:
- Accepts Input
- Processes Data
- Stores Information
- Produces Output

### IPO Cycle
Input -> Processing -> Output -> Storage

Examples:
- Keyboard = Input
- CPU = Processing
- Monitor = Output
- SSD/HDD = Storage

---

# 2. Main Hardware Components

## CPU (Central Processing Unit)

The brain of the computer.

Responsibilities:
- Executes instructions
- Performs calculations
- Controls system operations

Key Concepts:
- Core
- Thread
- Clock Speed
- Cache Memory

Examples:
- Intel Core i5/i7/i9
- AMD Ryzen 5/7/9

---

## RAM (Random Access Memory)

Temporary memory used while programs are running.

Characteristics:
- Very Fast
- Volatile
- Cleared after shutdown

Typical Sizes:
- 8 GB
- 16 GB
- 32 GB
- 64 GB+

---

## Storage

### HDD
- Mechanical disk
- Slower
- Cheaper

### SSD
- Flash storage
- Faster
- More reliable

### NVMe SSD
- Extremely fast
- Uses PCIe interface

---

## Motherboard

The central board connecting all components.

Connects:
- CPU
- RAM
- Storage
- GPU
- Ports

---

## GPU (Graphics Processing Unit)

Responsible for graphics rendering.

Used for:
- Gaming
- AI
- Video Editing
- Machine Learning

Examples:
- NVIDIA RTX Series
- AMD Radeon Series

---

## Power Supply (PSU)

Converts AC power into usable DC power.

Important Factors:
- Wattage
- Efficiency Rating
- Reliability

---

# 3. How a Computer Works Internally

1. User input received.
2. OS sends instructions.
3. CPU executes instructions.
4. RAM stores temporary data.
5. Storage saves permanent data.
6. Output shown on screen.

Example:
Opening Chrome:
- Double click icon
- OS loads files from SSD
- RAM receives data
- CPU executes code
- Browser appears

---

# 4. Understanding Operating Systems

Popular OS:
- Windows
- Linux
- macOS

Responsibilities:
- Process Management
- Memory Management
- User Authentication
- Hardware Communication
- Networking

---

# 5. File System Basics

Common File Systems:
- NTFS
- FAT32
- exFAT
- EXT4

Functions:
- Store Files
- Manage Permissions
- Organize Directories

---

# 6. Boot Process

1. Power ON
2. BIOS/UEFI Starts
3. Hardware Validation
4. Bootloader Executes
5. Operating System Loads
6. Login Screen Appears

---

# 7. Networking Basics

Important Concepts:
- IP Address
- MAC Address
- DNS
- Gateway
- Router
- Firewall

Example:
www.google.com -> DNS -> IP Address -> Connection Established

---

# 8. Windows Architecture

User Mode:
- Chrome
- Notepad
- Teams

Kernel Mode:
- Drivers
- Services
- Hardware Layer

---

# 9. Windows Services

Background processes running automatically.

Examples:
- Windows Update
- Print Spooler
- VPN Services
- Security Agents

QA Validation:
- Install Service
- Start Service
- Stop Service
- Recovery Testing

---

# 10. Windows Registry

Hierarchical configuration database.

Important Hives:
- HKEY_LOCAL_MACHINE
- HKEY_CURRENT_USER
- HKEY_USERS

QA Checks:
- Install Validation
- Upgrade Validation
- Uninstall Validation

---

# 11. Software Installation Lifecycle

Installation
-> Configuration
-> Usage
-> Upgrade
-> Maintenance
-> Uninstall

Testing Areas:
- Fresh Install
- Silent Install
- Repair Install
- Upgrade
- Rollback
- Uninstall

---

# 12. Sleep, Hibernate & Restart

## Sleep
- RAM remains powered
- Quick wakeup

## Hibernate
- RAM written to disk
- Zero power consumption

## Restart
- Reloads OS completely

QA Scenarios:
- Connected Session
- Login Persistence
- Resource Recovery

---

# 13. Desktop Application Testing

Functional Testing:
- Login
- Logout
- Navigation
- Settings
- Notifications

Non Functional Testing:
- Performance
- Security
- Reliability
- Compatibility

---

# 14. OS Compatibility Testing

Platforms:
- Windows 10
- Windows 11
- Windows Server 2019
- Windows Server 2022

Validation:
- Install
- Upgrade
- Login
- Features
- Services

---

# 15. .NET Framework Understanding

Many Windows applications depend on .NET.

QA Checks:
- .NET Installed
- .NET Missing
- Unsupported Versions
- Runtime Upgrade

---

# 16. Security Fundamentals

Concepts:
- Encryption
- Authentication
- Authorization
- MFA
- Certificates

Desktop QA Focus:
- Secure Login
- Token Storage
- Password Protection

---

# 17. Logs & Troubleshooting

Common Locations:
- Application Logs
- Event Viewer
- Service Logs

Useful Commands:
- services.msc
- eventvwr.msc
- taskmgr
- msconfig

---

# 18. Resource Monitoring

Tools:
- Task Manager
- Performance Monitor
- Resource Monitor

Metrics:
- CPU Usage
- Memory Usage
- Disk Usage
- Network Usage

---

# 19. Essential Knowledge for QA Engineers

Must Learn:
- Computer Hardware
- Windows Internals
- Networking Basics
- APIs
- Databases
- Security Basics
- Cloud Fundamentals
- CI/CD Concepts

---

# 20. Learning Roadmap

Phase 1
- Computer Basics
- Hardware
- OS Concepts

Phase 2
- Networking
- Windows Internals
- Registry & Services

Phase 3
- Desktop Testing
- API Testing
- Database Testing

Phase 4
- Automation Testing
- Playwright Python
- CI/CD

Phase 5
- Security Testing
- Cloud Security
- DevSecOps

---

# Recommended Resources

- Code.org: How Computers Work
- Cisco Skills For All: Computer Hardware Basics
- PCPartPicker Build Guides
- TED-Ed Computer Science Videos
- Microsoft Learn
- AWS Skill Builder
- Playwright Documentation

---

This document is designed for SDET, QA Automation Engineers, Security Testers, and DevSecOps learners who want strong computer fundamentals before moving into advanced testing and automation.

## 📂 File Systems, Software & OS Basics

| Resource | Provider | Link |
|---|---|---|
| Operating Systems: Overview | MIT OpenCourseWare | [ocw.mit.edu](https://ocw.mit.edu/courses/6-828-operating-system-engineering-fall-2012/) |
| File Management Basics | GCFGlobal | [gcfglobal.org](https://edu.gcfglobal.org/en/windowsbasics/working-with-files/1/) |
| Introduction to Operating Systems | Georgia Tech (Udacity) | [udacity.com](https://www.udacity.com/course/introduction-to-operating-systems--ud923) |

## 🌐 Networking Fundamentals (Intro Level)

| Resource | Provider | Link |
|---|---|---|
| Networking Basics | Cisco Skills for All | [skillsforall.com](https://skillsforall.com/course/networking-basics) |
| Bits and Bytes of Computer Networking | Google (Coursera) | [coursera.org](https://www.coursera.org/learn/computer-networking) |

## 📺 YouTube Channels (Free)

| Channel | Focus | Link |
|---|---|---|
| Professor Messer | CompTIA A+, IT Fundamentals | [professormesser.com](https://www.professormesser.com/free-a-plus-training/220-1101/220-1101-video/220-1101-training-course/) |
| PowerCert Animated Videos | Visual IT concepts | [youtube.com/@PowerCertAnimatedVideos](https://www.youtube.com/@PowerCertAnimatedVideos) |
| NetworkChuck | IT + Networking (fun style) | [youtube.com/@NetworkChuck](https://www.youtube.com/@NetworkChuck) |
