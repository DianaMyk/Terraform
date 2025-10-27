# Terraform Infrastructure: Victoria Metrics + Homer

## Project Overview
This project provides a **one-click deployment** solution for provisioning a hardened Linux server on **Hetzner Cloud**, configuring DNS via **Cloudflare**, and automatically deploying a full containerized stack with:

-  **Nginx + Certbot** – Reverse proxy with automated HTTPS certificates  
-  **Homer** – Web dashboard for service links  
-  **VictoriaLogs + Vector** – Log collection and visualization  
-  **UFW + Fail2ban** – Basic server hardening and SSH protection  
-  **Docker Compose** – Service orchestration managed automatically at boot  
-  **Cloud-init + Terraform** – Infrastructure as code with reproducible configuration

---

## Server Setup
Automated with **cloud-init** and handles:

- Creating a non-root `deployer` user with SSH key access  
- Disabling root SSH login and password authentication  
- Installing Docker, UFW, and Fail2ban  
- Setting up system locale, timezone, and NTP  
- Creating all Docker directories (`homer`, `victoria-logs`, `vector`, `nginx`)  
- Writing base64-decoded configuration files from Terraform templates  
- Running `docker compose` to bootstrap services  
- Rebooting automatically after setup   

---

## SSL & Domain Automation

The deployment uses **Certbot** with the **Cloudflare DNS API** for automatic certificate issuance and renewal.

### Flow

1. **Cloud-init** installs and starts a temporary `certbot-init` container.  
2. **Certbot** requests certificates for:
   - `homer.<domain>`
   - `logs.<domain>`
3. Certificates are stored in `/home/deployer/docker/nginx/certbot/conf/`.  
4. The **nginx** container automatically uses them on startup.

---

## Configuring Access, Firewall Rules, SSH, Outputs, and Vector

### Access & SSH
- SSH keys are provisioned via **`ssh.tf`**.  
- Firewall restricts SSH access to a specific IP (`allowed_ip` variable).  

### Firewall
- Managed by **`firewall.tf`**, allowing only essential ports:  
  - `22` → SSH  
  - `8080` → Homer  
  - `8428` → Victoria Metrics  

### Outputs
- Defined in **`outputs.tf`** for quick access to:  
  - Server IP  
  - SSH command  
  - Service URLs  

### Vector Logging
- Configured with **`vector.yaml`** to provide secure, centralized logging.  

---

## Provisioning

1. **Clone the repository:**
   ```bash
   git clone https://github.com/DianaMyk/Terraform.git
   cd Terraform

2. **Initialize Terraform:**
    ```bash
    terraform init

2. **Initialize Terraform:**
    ```bash
    terraform init

3. **Adjust variables:**
    directly in terraform.tfvars or via CLI -var flags

4. **Deploy:**
    ```bash 
    terraform plan 
    terraform apply
