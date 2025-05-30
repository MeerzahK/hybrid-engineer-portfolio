# 🛠️ DevOps Infrastructure

This directory focuses on automating the backend infrastructure and deployment processes required to support endpoint management at scale.

### ⚙️ Goals
- Provision FleetDM, MicroMDM, NanoDM using Terraform on AWS
- Use Docker for local testing and service orchestration
- Automate CI/CD with GitHub Actions
- Optionally, explore Ansible for remote endpoint setup

### 📁 Subdirectories
- `terraform/` – Infrastructure-as-code modules (FleetDM, MDM)
- `github-actions/` – Deployment pipelines using GitHub Actions
- `docker/` – Docker Compose files for local testing
- `ansible/` – (Optional) Endpoint bootstrapping scripts