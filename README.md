# Kali-Linux-for-Android — Kali Magic 🎩🔐

> Transform your Android device into a **portable cybersecurity playground** — run Kali / NetHunter tools on Android (Termux / LinuxDroid integration).

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Releases](https://img.shields.io/github/v/release/AryanVBW/Kali-Linux-for-Android)](https://github.com/AryanVBW/Kali-Linux-for-Android/releases)
[![Downloads](https://img.shields.io/github/downloads/AryanVBW/Kali-Linux-for-Android/total)](https://github.com/AryanVBW/Kali-Linux-for-Android/releases)

<p align="center">
  <a href="https://github.com/AryanVBW/LinuxDroid">
    <img src="https://github.com/AryanVBW/ParrotSecurityOsForAndroid/releases/download/Gif/visithere.gif" alt="Visit LinuxDroid" width="520">
  </a>
</p>

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
- [Security and Legal Notice](#security-and-legal-notice)
- [Contributing and Support](#contributing-and-support)
- [Credits and License](#credits-and-license)

---

## 🧠 About

**Kali Magic** lets you experience **Kali Linux / Parrot OS / NetHunter** tools right on Android — perfect for **students, researchers, and ethical hackers** learning on the go.

Run full penetration-testing environments inside **Termux + LinuxDroid**. It is portable, rootless, and documented with clear install paths and usage examples.

---

## 🐧 Supported Operating Systems

| OS | Version | Description | Logo |
|----|---------|-------------|------|
| **Kali Linux** | Rolling | Advanced penetration testing and security distro. | <img src="assets/gifs/kali-logo.svg" alt="Kali Logo" width="48"> |
| **Parrot Security OS** | Rolling | Forensics, pen-testing, privacy, and developer tools. | <img src="assets/gifs/parrot-logo.svg" alt="Parrot Logo" width="48"> |
| **Ubuntu** | 20.04+ | General-purpose Linux for development and scripting. | <img src="assets/gifs/ubuntu-logo.svg" alt="Ubuntu Logo" width="48"> |
| **Debian** | 11+ | Stable, server-ready Linux distribution. | <img src="assets/gifs/debian-logo.svg" alt="Debian Logo" width="48"> |

---

## 🌟 Features

- Mobile-optimized environment for Kali / NetHunter tools
- Run powerful pentest tools inside Termux / proot (rootless)
- Quick installer with two clear install paths
- Copy-paste-ready commands for common tools
- Safe for educational and ethical security labs

---

## ⚙️ Prerequisites

- Android 7.0+
- [Termux](https://f-droid.org/packages/com.termux/) (from F-Droid)
- `termux-setup-storage` permission granted
- Disk: ~3–8 GB free space
- (Optional) Root access for Wi-Fi injection or OTG tools

> Always inspect scripts before running:
> ```bash
> cat install-nethunter-termux
> ```

---

## 🚀 Quick Install

Choose **one** path below — do not run both.

### Option A: Direct Termux (NetHunter Rootless)

Best for a quick Kali NetHunter rootless setup inside Termux.

```bash
pkg update && pkg upgrade -y
pkg install wget curl proot -y

# Download and run Kali NetHunter installer
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux
./install-nethunter-termux

# Optional: LinuxDroid menu helpers
wget https://raw.githubusercontent.com/AryanVBW/LinuxDroid/main/Scripts/menu.sh
chmod +x menu.sh

# Optional: bash presets
cp ~/.bashrc ~/.bashrc.backup 2>/dev/null || true
wget https://raw.githubusercontent.com/AryanVBW/LinuxDroid/main/Scripts/default.bashrc -O ~/.bashrc

# Start GUI (after install completes)
nethunter kex &
./menu.sh
```

### Option B: Debian via proot-distro

Best if you want a full Debian container, then install Kali tools inside it.

```bash
pkg update && pkg upgrade -y
pkg install wget curl proot-distro -y

proot-distro list
proot-distro install debian
proot-distro login debian
```

Inside the Debian container:

```bash
apt update && apt upgrade -y
apt install kali-tools-top10 -y

# Optional: NetHunter-style tooling inside the container
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux
./install-nethunter-termux
```

---

## 🛠️ Manual Installation

1. Install Termux from F-Droid (not Play Store).
2. Open Termux and grant storage access:
   ```bash
   termux-setup-storage
   ```
3. Follow **Option A** or **Option B** in [Quick Install](#quick-install).
4. For a multi-distro Android Linux experience, use [LinuxDroid](https://github.com/AryanVBW/LinuxDroid).

---

## 🐉 Kali NetHunter (Rootless)

Kali NetHunter Rootless runs on stock, unrooted Android via Termux. It is based on Kali Linux and provides a mobile penetration-testing platform for learning and research.

With NetHunter Rootless you can:

- Practice ethical hacking and security research on Android
- Use common Kali tools in a portable environment
- Learn without requiring a rooted device

After installation:

```bash
nethunter          # enter NetHunter CLI
nethunter kex &    # start KeX GUI session (if configured)
```

Official guide: [Kali NetHunter Rootless](https://www.kali.org/docs/nethunter/nethunter-rootless/)

---

## 🎬 Visual Demos

### Nmap

Scan a local subnet (replace with a network you own or have permission to test):

```bash
nmap -sS 192.168.1.0/24
nmap -A 192.168.1.1
```

### Metasploit

```bash
msfconsole
```

### Wireshark

On devices with GUI / KeX support:

```bash
wireshark
# or capture from CLI
tshark -i any -c 50
```

### Installer Walkthrough

1. Update Termux packages
2. Run the NetHunter installer (**Option A**) or set up Debian (**Option B**)
3. Launch `nethunter` / `menu.sh`
4. Install tools as needed (`nmap`, `metasploit-framework`, etc.)

<p align="center">
  <a href="https://github.com/AryanVBW/LinuxDroid">
    <img src="https://github.com/AryanVBW/ParrotSecurityOsForAndroid/releases/download/Gif/visithere.gif" alt="Installer walkthrough" width="480">
  </a>
</p>

---

## 💡 Usage Examples

```bash
# List tools (Debian / Kali container)
ls /usr/share/

# Network discovery (authorized networks only)
nmap -sn 192.168.1.0/24

# Start Metasploit
msfconsole

# LinuxDroid helper menu (if installed)
./menu.sh
```

---

## 🔗 Installation Link

Primary project for multi-OS Android Linux installs:

**[LinuxDroid](https://github.com/AryanVBW/LinuxDroid)** — install Kali, Parrot, Ubuntu, Debian, and more on Android.

This repository focuses on the Kali / NetHunter experience. For the full LinuxDroid installer and OS list, use the link above.

---

## ⚠️ Security and Legal Notice

Use these tools **only** on systems and networks you own or have explicit permission to test.

Unauthorized access, scanning, or exploitation of systems is illegal. The authors and contributors are not responsible for misuse. This project is intended for education, research, and ethical security practice.

---

## 🤝 Contributing and Support

- Report issues, suggest enhancements, or open pull requests
- Keep documentation clear and commands copy-paste ready
- For maintainer GIF optimization:

```bash
./scripts/optimize_gifs.sh 640 15
```

See [`scripts/optimize_gifs.sh`](scripts/optimize_gifs.sh) for details.

---

## 📜 Credits and License

- [Kali Linux / Offensive Security](https://www.kali.org/)
- [LinuxDroid](https://github.com/AryanVBW/LinuxDroid) by [AryanVBW](https://github.com/AryanVBW)
- Community contributors

Licensed under the terms of this repository. See the project license for details.
