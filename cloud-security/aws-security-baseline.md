# AWS Security Baseline

---

# 🎯 Purpose

This document defines generalized AWS security recommendations and operational baselines intended to improve cloud security posture and infrastructure protection.

The objective is to:
- reduce cloud exposure risks
- improve identity security
- enforce operational controls
- improve monitoring visibility
- support secure cloud operations

---

# ☁️ Identity & Access Management (IAM)

## Recommended Practices

Use:
- least privilege access
- role-based permissions
- temporary credentials
- MFA enforcement
- separate administrative accounts

Avoid:
- shared accounts
- long-lived credentials
- excessive IAM permissions
- root account usage for daily operations

---

# 🔐 Multi-Factor Authentication (MFA)

Strongly recommended for:
- administrative accounts
- privileged users
- billing access
- infrastructure operations

The root account should always:
- have MFA enabled
- use strong credentials
- remain restricted

---

# 🌐 Network Security

Recommended:
- private subnets where possible
- restricted security groups
- VPN-secured administrative access
- segmented environments
- limited public exposure

Avoid:
- unrestricted SSH exposure
- public databases
- overly permissive security groups

---

# 🔥 Security Groups

Security groups should:
- restrict inbound traffic
- limit administrative access
- follow least privilege principles
- be reviewed periodically

Avoid:
```text
0.0.0.0/0
```

for administrative services whenever possible.

---

# 📊 Logging & Monitoring

Enable:
- CloudTrail
- VPC Flow Logs
- CloudWatch monitoring
- GuardDuty
- centralized logging

Monitor:
- IAM changes
- unusual API activity
- failed login attempts
- public exposure changes
- infrastructure anomalies

---

# 💾 Backup & Recovery

Recommended:
- automated backups
- snapshot retention policies
- backup validation
- disaster recovery testing

Protect:
- databases
- EBS volumes
- configuration backups
- infrastructure templates

---

# 🧪 Vulnerability Management

Recommended:
- recurring patch cycles
- vulnerability scanning
- container image scanning
- dependency monitoring
- infrastructure auditing

---

# 🔍 Storage Security

For S3:
- block public access where possible
- enable encryption
- review bucket policies
- enable logging
- restrict object permissions

Avoid:
- public sensitive data exposure
- unrestricted bucket policies

---

# 🛡️ Infrastructure Protection

Recommended:
- WAF deployment
- DDoS protections
- EDR solutions
- centralized monitoring
- infrastructure segmentation

Examples:
- AWS WAF
- AWS Shield
- CrowdStrike
- SIEM integrations

---

# 📋 Operational Best Practices

Recommended:
- infrastructure as code
- configuration management
- change management procedures
- centralized visibility
- regular access reviews
- periodic architecture reviews

---

# 🚫 Common AWS Security Mistakes

Avoid:
- unused access keys
- unrestricted IAM policies
- missing MFA
- public management exposure
- disabled logging
- stale security groups
- unmonitored cloud assets

---

# 📈 Recommended Monitoring Areas

Track:
- IAM activity
- API calls
- unusual geographic access
- public exposure changes
- failed authentication attempts
- backup failures
- infrastructure anomalies

---

# ⚠️ Disclaimer

This document is intended for educational and operational reference purposes.

AWS security requirements may vary depending on:
- organizational policies
- compliance requirements
- cloud architecture
- operational maturity
- business requirements

All configurations should be validated before production deployment.
