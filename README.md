<div align="center">
  <img src="https://raw.githubusercontent.com/Jaypph/pi-apps-amd64/master/logo.svg" width="200">
  <h1>Pi-Apps AMD64</h1>
</div>


<p align="center">A lightweight app store for AMD64 Linux</p>

<p align="center">
  <a href="https://github.com/Jaypph/pi-apps-amd64/blob/master/CHANGELOG.md">View changelog</a> |
  <a href="https://github.com/Jaypph/pi-apps-amd64/issues/">Report an error</a> |
  <a href="https://github.com/Botspot/pi-apps/issues/new?template=suggestion.yml">Make a general suggestion</a> |
  <a href="https://github.com/Jaypph/pi-apps-amd64/issues/new">Suggest new app</a>
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
