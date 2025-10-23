# Kali-Linux-for-Android — Kali Magic 🎩🔐

> Transform your Android device into a **portable cybersecurity playground** — run Kali / NetHunter tools on Android (Termux / LinuxDroid integration). 🚀💻📱

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Releases](https://img.shields.io/github/v/release/AryanVBW/ParrotSecurityOsForAndroid)](https://github.com/AryanVBW/ParrotSecurityOsForAndroid/releases)
[![Downloads](https://img.shields.io/github/downloads/AryanVBW/ParrotSecurityOsForAndroid/total)]()

---

> **Before you paste (optional but recommended):**  
> Create `assets/gifs/` and add demo GIFs & logos so README images load reliably. Example:
>
> ```bash
> mkdir -p assets/gifs
> wget -O assets/gifs/nmap-scan.gif "https://upload.wikimedia.org/wikipedia/commons/3/3b/Terminal_demo.gif"
> wget -O assets/gifs/metasploit-demo.gif "https://upload.wikimedia.org/wikipedia/commons/5/5f/Metasploit_Console.gif"
> wget -O assets/gifs/wireshark-capture.gif "https://upload.wikimedia.org/wikipedia/commons/6/6d/Wireshark_capture.gif"
> wget -O assets/gifs/linuxdroid-install.gif "https://upload.wikimedia.org/wikipedia/commons/1/1a/Installer_demo.gif"
> wget -O assets/gifs/kali-logo.png "https://upload.wikimedia.org/wikipedia/commons/2/2b/Kali-dragon-icon.png"
> wget -O assets/gifs/parrot-logo.png "https://upload.wikimedia.org/wikipedia/commons/8/8b/Parrot-logo.png"
> wget -O assets/gifs/ubuntu-logo.png "https://upload.wikimedia.org/wikipedia/commons/a/ab/Logo-ubuntu_cof-orange-hex.svg"
> wget -O assets/gifs/debian-logo.png "https://upload.wikimedia.org/wikipedia/commons/0/0d/Debian-logo.svg"
> git add assets/gifs/*
> git commit -m "Add README demo assets"
> git push origin main
> ```

---

## 📖 Table of Contents

- [About](#about)  
- [Supported Operating Systems](#supported-operating-systems)  
- [Features](#features)  
- [Prerequisites](#prerequisites)  
- [Quick Install](#quick-install)  
- [Manual Installation](#manual-installation)  
- [Kali NetHunter (Rootless)](#kali-nethunter-rootless)  
- [Visual Demos](#visual-demos)  
  - [Nmap](#nmap)  
  - [Metasploit](#metasploit)  
  - [Wireshark](#wireshark)  
  - [Installer Walkthrough](#installer-walkthrough)  
- [Usage Examples](#usage-examples)  
- [Installation Link](#installation-link)  
- [Security & Legal Notice](#security--legal-notice)  
- [Contributing & Support](#contributing--support)  
- [Credits & License](#credits--license)

---

## 🧠 About

**Kali Magic** lets you experience **Kali Linux / Parrot OS / NetHunter** tools right on Android — perfect for **students, researchers, and ethical hackers** learning on the go.  

Run full penetration-testing environments inside **Termux + LinuxDroid**.  
It’s portable, rootless, and visually documented with live demos.

[![Visit LinuxDroid](assets/gifs/linuxdroid-install.gif)](https://github.com/AryanVBW/LinuxDroid)

---

## 🐧 Supported Operating Systems

| OS | Version | Description | Logo |
|----|---------|-------------|------|
| **Kali Linux** | Rolling | Advanced penetration testing & security distro. | ![Kali Logo](assets/gifs/kali-logo.png) |
| **Parrot Security OS** | Rolling | Forensics, pen-testing, privacy & dev tools. | ![Parrot Logo](assets/gifs/parrot-logo.png) |
| **Ubuntu** | 20.04+ | General-purpose Linux for dev & scripting. | ![Ubuntu Logo](assets/gifs/ubuntu-logo.png) |
| **Debian** | 11+ | Stable, server-ready Linux distribution. | ![Debian Logo](assets/gifs/debian-logo.png) |

---

## 🌟 Features

- Mobile-optimized environment for Kali / NetHunter tools.  
- Run powerful pentest tools inside Termux/proot (rootless).  
- Quick installer + visual setup walkthrough.  
- Lightweight GIF demos and prebuilt commands.  
- Safe for educational / ethical security labs.

---

## ⚙️ Prerequisites

- Android 7.0+  
- Termux (from F-Droid)  
- `termux-setup-storage` permission granted  
- Disk: ~3-8 GB free space  
- (Optional) Root access for Wi-Fi injection or OTG tools  

> 💡 Always inspect scripts before running:  
> ```bash
> cat install.sh
> ```

---

## 🚀 Quick Install

```bash
pkg update && pkg upgrade -y
pkg install wget curl proot -y

# Download & run Kali NetHunter installer
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux
./install-nethunter-termux

# Optional extras (LinuxDroid)
wget https://raw.githubusercontent.com/AryanVBW/LinuxDroid/main/Scripts/menu.sh && chmod +x menu.sh

# Optional bash presets
cp ~/.bashrc ~/.bashrc.backup || true
wget https://raw.githubusercontent.com/AryanVBW/LinuxDroid/main/Scripts/default.bashrc -O ~/.bashrc

# Start GUI
nethunter kex &
./menu.sh

pkg install proot-distro
proot-distro list
proot-distro install debian
proot-distro login debian

# Inside Debian
apt update && apt upgrade -y
apt install kali-tools-top10 -y
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux
./install-nethunter-termux
nethunter kex &
nmap -A 192.168.1.1/24
msfconsole
use exploit/android/browser/webview_addjavascriptinterface
# List installed tools
ls /usr/share/

# Start Metasploit
msfconsole

# Network Scan
nmap -sS 192.168.1.0/24
mkdir -p scripts
cat > scripts/optimize_gifs.sh <<'EOF'
#!/usr/bin/env bash
# optimize_gifs.sh
# Example: ./optimize_gifs.sh 640 15

set -e
MAX_WIDTH="${1:-640}"
FPS="${2:-15}"
SRC_DIR="assets/gifs"
OUT_DIR="${SRC_DIR}/optimized"

mkdir -p "$OUT_DIR"

if ! command -v ffmpeg >/dev/null 2>&1; then
  pkg install -y ffmpeg || apt install -y ffmpeg
fi

if ! command -v gifsicle >/dev/null 2>&1; then
  pkg install -y gifsicle || apt install -y gifsicle || true
fi

for gif in "$SRC_DIR"/*.gif; do
  fname="$(basename "$gif")"
  tmp="${OUT_DIR}/tmp-${fname}"
  out="${OUT_DIR}/${fname%.*}-opt.gif"

  ffmpeg -y -i "$gif" -vf "scale='min(${MAX_WIDTH},iw)':'-2',fps=${FPS}" "$tmp"
  if command -v gifsicle >/dev/null 2>&1; then
    gifsicle -O3 "$tmp" -o "$out"
  else
    mv "$tmp" "$out"
  fi
  echo "Optimized: $out"
done
EOF

chmod +x scripts/optimize_gifs.sh
./scripts/optimize_gifs.sh 640 15
git add assets/gifs/optimized/*
git commit -m "Add optimized README GIFs"
git push origin main

---
  

