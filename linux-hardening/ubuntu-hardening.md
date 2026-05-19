# Ubuntu Server Hardening Baseline

---

# 🎯 Purpose

This document defines a generalized Ubuntu Linux hardening baseline intended to improve security, operational consistency, and infrastructure resilience.

The objective is to:
- Reduce attack surface
- Improve access security
- Strengthen authentication controls
- Improve monitoring visibility
- Support compliance-oriented operational practices

This baseline is intended for:
- Ubuntu production servers
- Cloud infrastructure
- Virtual machines
- Bare-metal systems
- Administrative environments

---

# 🛡️ Operating System Baseline

## Supported Versions

Recommended:
- Ubuntu 22.04 LTS
- Ubuntu 24.04 LTS

Legacy environments should receive:
- security updates
- limited package exposure
- increased monitoring

---

# 👤 User & Access Management

## Root Login

Disable direct root SSH access.

Recommended:
```bash
PermitRootLogin no
```

---

## Password Policies

Recommended:
- Minimum 14 characters
- Password expiration policies
- Complexity enforcement
- Password reuse prevention

Recommended packages:
```bash
libpam-pwquality
```

---

## Sudo Access

Restrict sudo access to authorized administrative groups only.

Review regularly:
```bash
sudo -l
```

---

## Multi-Factor Authentication (MFA)

Recommended for:
- VPN access
- Administrative systems
- Bastion hosts
- Cloud administrative access

---

# 🔐 SSH Hardening

## Recommended SSH Configuration

File:
```bash
/etc/ssh/sshd_config
```

Recommended settings:
```bash
PermitRootLogin no
PasswordAuthentication no
X11Forwarding no
MaxAuthTries 3
ClientAliveInterval 300
AllowUsers adminuser
```

---

## SSH Key Authentication

Use:
- ED25519 keys
- Strong passphrases
- Limited authorized users

Avoid:
- shared accounts
- password-only authentication

---

# 🔥 Firewall Configuration

Recommended:
```bash
ufw
```

Example baseline:
```bash
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp
ufw enable
```

Only expose required services.

---

# 🧱 Service Minimization

Disable unnecessary services.

Review active services:
```bash
systemctl list-units --type=service
```

Remove:
- unused packages
- legacy services
- insecure protocols

---

# 📦 Patch Management

## Recommended Update Frequency

Critical systems:
- Immediate security patching

Standard systems:
- Weekly patch cycles

Recommended commands:
```bash
apt update
apt upgrade
```

Enable unattended security updates where appropriate.

Package:
```bash
unattended-upgrades
```

---

# 🧰 Fail2ban Deployment

Recommended for:
- SSH protection
- Web services
- Administrative interfaces

Install:
```bash
apt install fail2ban
```

Verify status:
```bash
fail2ban-client status
```

---

# 📊 Logging & Monitoring

## Recommended Logging

Monitor:
- authentication events
- sudo activity
- failed logins
- service failures
- firewall events

Recommended integrations:
- Graylog
- SIEM platforms
- Zabbix
- Syslog collectors

---

# 🔍 System Auditing

## Recommended Audit Areas

Review:
- privileged accounts
- active services
- listening ports
- scheduled tasks
- package integrity
- firewall rules
- SSH access logs

Useful commands:
```bash
ss -tulpn
last
lastb
crontab -l
journalctl
```

---

# 🧪 Malware & Integrity Monitoring

Recommended:
- antivirus scanning
- file integrity monitoring
- EDR deployment
- suspicious process monitoring

Examples:
- CrowdStrike
- Microsoft Defender
- Wazuh
- ClamAV

---

# ☁️ Cloud Security Considerations

For cloud deployments:
- restrict security groups
- avoid public administrative access
- use private networking where possible
- enforce MFA
- rotate credentials regularly

---

# 🚫 Common Hardening Mistakes

Avoid:
- exposing SSH publicly without restrictions
- shared administrative accounts
- disabled logging
- outdated packages
- weak passwords
- excessive sudo permissions
- unnecessary internet-facing services

---

# 📋 Recommended Operational Controls

- Principle of least privilege
- Centralized logging
- Routine patch management
- Backup validation
- MFA enforcement
- Configuration management
- Vulnerability scanning
- Change management procedures

---

# ⚠️ Disclaimer

This document is a generalized operational hardening baseline.

Security requirements may vary depending on:
- organizational policies
- compliance frameworks
- infrastructure design
- threat models
- operational requirements

All hardening procedures should be validated before production deployment.
