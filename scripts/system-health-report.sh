#!/bin/bash

# =========================================================
# System Health Report Script
# =========================================================
# Description:
# Generates a basic operational health report for Linux systems.
#
# Features:
# - Hostname information
# - Uptime
# - CPU load
# - Memory usage
# - Disk usage
# - Top memory-consuming processes
# - Listening ports
# - Failed login attempts
#
# Intended for:
# - Operational monitoring
# - Infrastructure reviews
# - Linux administration
# - Security visibility
#
# Author:
# Bladimir Fernández López
# =========================================================

clear

echo "========================================================="
echo "           SYSTEM HEALTH REPORT"
echo "========================================================="
echo ""

# ---------------------------------------------------------
# Hostname & System Information
# ---------------------------------------------------------

echo "[+] Host Information"
echo "---------------------------------------------------------"
hostnamectl
echo ""

# ---------------------------------------------------------
# Uptime
# ---------------------------------------------------------

echo "[+] System Uptime"
echo "---------------------------------------------------------"
uptime
echo ""

# ---------------------------------------------------------
# CPU Load
# ---------------------------------------------------------

echo "[+] CPU Load"
echo "---------------------------------------------------------"
cat /proc/loadavg
echo ""

# ---------------------------------------------------------
# Memory Usage
# ---------------------------------------------------------

echo "[+] Memory Usage"
echo "---------------------------------------------------------"
free -h
echo ""

# ---------------------------------------------------------
# Disk Usage
# ---------------------------------------------------------

echo "[+] Disk Usage"
echo "---------------------------------------------------------"
df -h
echo ""

# ---------------------------------------------------------
# Top Memory Consuming Processes
# ---------------------------------------------------------

echo "[+] Top Memory Consuming Processes"
echo "---------------------------------------------------------"
ps aux --sort=-%mem | head -10
echo ""

# ---------------------------------------------------------
# Listening Ports
# ---------------------------------------------------------

echo "[+] Listening Ports"
echo "---------------------------------------------------------"
ss -tulpn
echo ""

# ---------------------------------------------------------
# Failed Login Attempts
# ---------------------------------------------------------

echo "[+] Failed Login Attempts"
echo "---------------------------------------------------------"

if command -v lastb >/dev/null 2>&1; then
    lastb | head
else
    echo "lastb command not available."
fi

echo ""

# ---------------------------------------------------------
# Logged In Users
# ---------------------------------------------------------

echo "[+] Currently Logged In Users"
echo "---------------------------------------------------------"
who
echo ""

# ---------------------------------------------------------
# Recent Reboots
# ---------------------------------------------------------

echo "[+] Recent Reboots"
echo "---------------------------------------------------------"
last reboot | head
echo ""

# ---------------------------------------------------------
# System Updates Available
# ---------------------------------------------------------

echo "[+] Available Updates"
echo "---------------------------------------------------------"

if command -v apt >/dev/null 2>&1; then
    apt list --upgradable 2>/dev/null
elif command -v dnf >/dev/null 2>&1; then
    dnf check-update
else
    echo "Unsupported package manager."
fi

echo ""

# ---------------------------------------------------------
# End Report
# ---------------------------------------------------------

echo "========================================================="
echo "        END OF SYSTEM HEALTH REPORT"
echo "========================================================="
