# Compromised Server Incident Response Playbook

---

# 🎯 Purpose

This document defines generalized incident response procedures for identifying, containing, investigating, and remediating potentially compromised Linux or cloud-based servers.

The objective is to:
- minimize operational impact
- contain malicious activity
- preserve forensic evidence
- restore system integrity
- reduce lateral movement risk

This playbook applies to:
- Linux servers
- cloud virtual machines
- production infrastructure
- container hosts
- internet-facing systems

---

# 🚨 Common Indicators of Compromise

Indicators may include:
- unusual outbound traffic
- unauthorized processes
- unexpected user accounts
- privilege escalation attempts
- modified system binaries
- suspicious cron jobs
- cryptocurrency mining activity
- unexpected listening ports
- antivirus or EDR alerts
- abnormal CPU or memory utilization

---

# 🔍 Detection Sources

Compromise indicators may originate from:
- SIEM alerts
- EDR detections
- monitoring systems
- authentication logs
- IDS/IPS platforms
- threat intelligence feeds
- firewall alerts
- user reports
- unusual infrastructure behavior

---

# 🛑 Initial Containment Procedures

## Immediate Actions

### 1. Isolate the System

Recommended:
- remove public access
- isolate from production networks
- restrict outbound traffic
- disable VPN access if necessary

Avoid:
- immediate shutdown without evidence preservation
- deleting suspicious files prematurely

---

### 2. Preserve Evidence

Collect:
- running processes
- active network connections
- authentication logs
- memory captures if possible
- cron jobs
- active sessions
- recent commands

Useful commands:
```bash
ps aux
ss -tulpn
who
last
journalctl
crontab -l
```

---

### 3. Identify Scope

Determine:
- affected systems
- compromised accounts
- privilege level obtained
- lateral movement indicators
- exposed services

---

# 🔬 Investigation Procedures

## Authentication Review

Review:
- failed login attempts
- unusual geographic access
- SSH key modifications
- sudo activity
- new administrative users

---

## File Integrity Review

Investigate:
- modified binaries
- unauthorized scripts
- suspicious startup entries
- persistence mechanisms
- altered configurations

---

## Network Activity Review

Analyze:
- outbound connections
- DNS requests
- VPN sessions
- unusual ports
- external communication patterns

---

# 🧹 Remediation Procedures

## Credential Security

Recommended:
- rotate passwords
- revoke SSH keys
- invalidate tokens
- enforce MFA
- review privileged access

---

## Malware Removal

Actions may include:
- removing malicious binaries
- disabling persistence mechanisms
- patching vulnerabilities
- updating packages
- reimaging systems where appropriate

---

## Infrastructure Review

Validate:
- firewall rules
- exposed services
- monitoring visibility
- segmentation controls
- cloud security groups

---

# 📋 Recovery Procedures

Before restoring systems:
- validate integrity
- confirm malicious activity removal
- patch vulnerabilities
- verify monitoring functionality
- confirm backups are clean

---

# 📢 Communication Procedures

Notify:
- security teams
- infrastructure operations
- management
- affected stakeholders

Document:
- timeline
- indicators of compromise
- remediation actions
- operational impact

---

# 📈 Recommended Security Controls

- EDR deployment
- centralized logging
- MFA enforcement
- vulnerability management
- infrastructure segmentation
- least privilege access
- patch management
- backup validation

---

# ⚠️ Disclaimer

This document is intended for educational and operational reference purposes.

Actual incident response procedures may vary depending on:
- organizational policies
- compliance obligations
- infrastructure design
- forensic requirements
- business operations
