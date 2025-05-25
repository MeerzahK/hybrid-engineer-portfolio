# Mac Provisioning CLI

This is a Python CLI tool to automate new Mac setup:
- Install apps
- Perform system health checks

## Run
```bash
python3 provision.py --install-apps --check-health ```

---

## 🚀 Phase 2: MDM, Config Management & Packaging (Weeks 9–20)
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

Next steps:
1. Build GitHub repos for each project
2. Launch a blog (e.g. dev.to, Hashnode, GitHub Pages)
3. Track progress and write weekly posts per project
4. Ask questions whenever you get stuck!

---

Let's now break down **Project 3: Chocolatey Automation for Windows** together