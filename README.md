<div align="center">
  <img src="https://raw.githubusercontent.com/Jaypph/pi-apps-amd64/master/logo.svg" width="200">
  <h1>Pi-Apps AMD64</h1>
</div>

<p align="center">A lightweight app store for AMD64 Linux</p>

<p align="center">
  <a href="https://github.com/Jaypph/pi-apps-amd64/blob/master/CHANGELOG.md">View changelog</a> |
  <a href="https://github.com/Jaypph/pi-apps-amd64/issues/">Report a bug</a> |
  <a href="https://github.com/Botspot/pi-apps/issues/new?template=suggestion.yml">Make a suggestion</a> |
  <a href="https://github.com/Jaypph/pi-apps-amd64/issues/new">Suggest new app</a>
</p>

<p align="center">
  <!-- GitHub Stars -->
  <a href="https://github.com/Jaypph/pi-apps-amd64/stargazers">
    <img src="https://img.shields.io/github/stars/Jaypph/pi-apps-amd64?style=social" alt="GitHub Stars">
  </a>
  <!-- GitHub Forks -->
  <a href="https://github.com/Jaypph/pi-apps-amd64/network/members">
    <img src="https://img.shields.io/github/forks/Jaypph/pi-apps-amd64?style=social" alt="GitHub Forks">
  </a>
  <!-- Open Issues / Bugs -->
  <a href="https://github.com/Jaypph/pi-apps-amd64/issues">
    <img src="https://img.shields.io/github/issues/Jaypph/pi-apps-amd64?label=bugs&color=red" alt="Open Issues">
  </a>
  <!-- Repo Views -->
  <a href="https://github.com/Jaypph/pi-apps-amd64">
    <img src="https://visitor-badge.laobi.icu/badge?page_id=Jaypph.pi-apps-amd64" alt="Repo Views">
  </a>
  <!-- License -->
  <a href="https://www.gnu.org/licenses/gpl-3.0">
    <img src="https://img.shields.io/badge/License-GPLv3-blue.svg" alt="GPL-3.0 License">
  </a>
  <!-- Open Source Love -->
  <a href="https://opensource.org/">
    <img src="https://badges.frapsoft.com/os/v1/open-source.svg?v=103" alt="Open Source Love">
  </a>
  <!-- Last Commit -->
  <a href="https://github.com/Jaypph/pi-apps-amd64/commits">
    <img src="https://img.shields.io/github/last-commit/Jaypph/pi-apps-amd64" alt="Last Commit">
  </a>
  <!-- Downloads -->
  <a href="https://github.com/Jaypph/pi-apps-amd64/releases">
    <img src="https://img.shields.io/github/downloads/Jaypph/pi-apps-amd64/total?style=flat" alt="Downloads">
  </a>
</p>
---

## Introduction

Installing software on AMD64 Linux can be tricky. Many popular apps don’t appear in `apt` repositories, and manual installation can break your system.

**Pi-Apps AMD64** solves this by providing well-maintained scripts that automatically install hard-to-install apps.

Scripts download apps from their original sources, offering maximum flexibility. If you can manually install it, Pi-Apps AMD64 can automate it.

---

## Install Pi-Apps AMD64

Open a terminal and run:

```bash
curl -L https://raw.githubusercontent.com/Jaypph/pi-apps-amd64/master/install.sh | bash
```

---

## Supported systems

Pi-Apps AMD64 supports **all modern AMD64 Linux distributions**:

* Debian (Bookworm/Trixie)
* Ubuntu (Jammy/Noble)
* Fedora, Arch, OpenSUSE, and other popular AMD64 distros

> If your system can run standard AMD64 binaries, Pi-Apps AMD64 should work.

---

## Unsupported systems

* Non-AMD64 architectures (ARM, ARM64, i386 32-bit)
* Non-Linux OS (Windows, macOS, Android, ChromeOS)

---

## Usage

* Launch from the start menu: **Accessories → Pi-Apps AMD64**
* Terminal command: `pi-apps-amd64`
* Run directly: `~/pi-apps-amd64/gui`

---

## Update

* Automatic: Pi-Apps AMD64 checks for updates at startup.
* Manual: `~/pi-apps-amd64/updater gui` or `~/pi-apps-amd64/updater cli`

---

## Contributing

* Star the repository to help others find it.
* Suggest apps, report bugs, or submit your own scripts.

---



## FAQ

**Why Pi-Apps AMD64?**
Installing software on Linux can be slow and confusing. Pi-Apps AMD64 automates installation of some apps, saving time.

**Is it free?**
Yes!
