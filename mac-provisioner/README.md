# 🛠️ mac-provisioner

[![CI](https://github.com/MeerzahK?tab=repositories/actions/workflows/main.yml/badge.svg)](https://github.com/Meerzahk/cpe-projects/mac-provisioner/actions)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![macOS](https://img.shields.io/badge/platform-macOS-lightgrey.svg)](https://apple.com/macos)

**mac-provisioner** is a CLI tool and learning track to automate macOS provisioning and become proficient in client platform engineering with real-world tools.

---

## 📥 Installation

Clone this repository:

```bash
git clone https://github.com/<your-username>/mac-provisioner.git
cd mac-provisioner
```

(Optional) Create a virtual environment:

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

---

## 🧪 Usage

Run the provisioning script:

```bash
python3 provision.py --install-apps --check-health
```

### Available Flags

| Flag             | Description                         |
|------------------|-------------------------------------|
| `--install-apps` | Installs all apps defined in config |
| `--check-health` | Runs system diagnostic checks       |

---

## 🧠 Phase 2: MDM, Config Management & Packaging (Weeks 9–20)

> Dive into real-world client platform tools like FleetDM, Ansible, Munki

### 🎯 Goals

- Learn how FleetDM manages devices
- Manage software using Munki & Chocolatey
- Deploy configs using Ansible
- Create install packages (.pkg/.msi)

### 📁 Projects

#### Project 4: FleetDM Device Dashboard

- Install and configure FleetDM
- Enroll a Mac and Windows system
- Query device data and build custom queries

#### Project 5: Build Your Munki Repo

- Host a Munki repo locally or on AWS/GCP
- Upload `.pkg` files like Zoom
- Deploy them via manifests

#### Project 6: Mac Security Baseline with Ansible

- Write Ansible playbooks to:
  - Set password policies
  - Disable guest account
  - Enable FileVault and Firewall

#### Project 7: Windows Config-as-Code with Puppet or Chocolatey

- Automate Windows settings and app installs
- Export system logs and inventory

---

## 🧠 Phase 3: Enterprise Engineering & Automation (Weeks 21–36)

> Bring it all together into enterprise-ready projects

### 🎯 Goals

- Understand Zero Trust and real-time monitoring
- Create self-healing scripts
- Build IT bots using Slack APIs

### 📁 Projects

#### Project 8: Zero Trust Lab

- Set up Firezone as VPN gateway
- Block apps/services based on role
- Use FleetDM to audit compliance

#### Project 9: Endpoint Health Dashboard

- Use FleetDM queries to extract metrics
- Store data in Prometheus
- Visualize with Grafana
- Send Slack alerts when systems are unhealthy

#### Project 10: SlackBot for IT Automation

- Create a Python SlackBot that:
  - Installs apps via Munki/Fleet
  - Responds to “Help” commands
  - Pulls device info from FleetDM

#### Project 11: Self-Healing Agent (macOS & Windows)

- Python script or service that:
  - Detects broken services
  - Restarts or reinstalls automatically
  - Reports issues to Slack

---

## 🛠️ Core Tools You’ll Learn

- **FleetDM** – Open-source endpoint visibility
- **Munki** – macOS package manager
- **Chocolatey** – Windows package manager
- **Ansible** – Config management tool
- **Python + Bash** – Automation
- **Grafana + Prometheus** – Monitoring
- **Slack API** – Build IT bots
- **GitHub Actions** – CI/CD for automation

---

## ⚙️ CI/CD – GitHub Actions

A basic GitHub Actions workflow to validate the provisioning script.

### `.github/workflows/main.yml`

```yaml
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  lint-and-test:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: 3.11

      - name: Install dependencies
        run: |
          python3 -m pip install --upgrade pip
          pip install -r requirements.txt

      - name: Run health check
        run: |
          python3 provision.py --check-health
```

---

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙋‍♂️ Maintainer

Built with ❤️ by [@MeerzahK](https://github.com/MeerzahK)
