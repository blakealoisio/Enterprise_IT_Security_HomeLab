# Enterprise Security, Automation & AI Lab

A hands-on lab focused on security investigation, detection, workflow automation, and AI-assisted operations within an enterprise-style environment.

## Purpose

This lab is a practical environment for building and applying skills in security monitoring, investigation, automation, and AI-enabled workflows.

The goal is to better understand how enterprise systems generate security-relevant data, how that data can be investigated and analyzed, and how repetitive security and operational processes can be improved through automation.

The lab also provides the Windows, Active Directory, networking, and systems administration foundation needed to understand the systems and activity being monitored.

## Areas of Focus

### Security Investigation & KQL

- Kusto Query Language (KQL)
- Security event analysis
- Windows and identity telemetry
- Threat hunting
- Alert investigation and triage
- Detection development
- Microsoft security platforms

### Automation & Workflow Engineering

- Microsoft Power Automate
- Microsoft Power Apps
- PowerShell
- API integrations
- Automated enrichment and data processing
- Human-in-the-loop workflows
- Operational process improvement

### AI & Agent-Based Solutions

- AI-assisted investigation
- Security workflow automation
- Agent-based solutions
- Data analysis and summarization
- Human validation and approval
- Applying AI to security and operational workflows

### Enterprise Infrastructure

The lab includes the supporting infrastructure needed to generate realistic activity and telemetry, including:

- Active Directory Domain Services
- Windows Server
- Windows endpoints
- DNS and networking
- Identity and access management
- Group Policy
- File and resource permissions
- Windows event logging
- Virtualization with Hyper-V

Infrastructure administration and troubleshooting are used throughout the lab to build, maintain, and expand the environment as needed.

## Projects

Projects will focus on applying these technologies to practical security and operational problems.

Project documentation will generally include:

- Problem or objective
- Environment and architecture
- Implementation
- Investigation or development process
- Challenges and troubleshooting
- Results
- Lessons learned
- Potential improvements

### Current Projects


## Projects

### 001 — Windows Authentication Investigation Using KQL

**Focus:** Security monitoring, Windows Event Logs, KQL, Azure Log Analytics, and troubleshooting.

Investigated controlled Windows authentication failures in an Active Directory homelab. Identified incorrect-password and expired-password events, resolved a workstation telemetry coverage gap, and used KQL to analyze centralized security logs.

**Key skills demonstrated:**
- Windows Security Event ID 4625 analysis
- KQL investigation and field extraction
- Azure Arc and Azure Monitor Agent configuration
- Log Analytics telemetry validation
- PowerShell event log verification
- Troubleshooting and evidence documentation

[**View Project 001 — Full Investigation**](projects/001-windows-authentication-investigation/README.md)

## Lab Environment

Current environment:

- Windows 11 Hyper-V host
- Windows Server Active Directory domain controller
- Windows 11 domain-joined endpoint
- Linux security workstation
- Isolated lab users, groups, permissions, and enterprise-style resources
