# Terraform Infrastructure: Victoria Metrics + Homer

## Project Overview
This project provisions and hardens a cloud server, then deploys **Victoria Metrics** (time-series database) and **Homer** (dashboard) using **Terraform** and **Docker**.  

---

## Server Setup
- Automated with **cloud-init**.  
- Prepares the server with required packages, Docker, and initial security configuration.  

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

## Deploying with Docker Compose
- The **`compose.yaml`** file orchestrates **Victoria Metrics** and **Homer**.  
- Ensures services start automatically on server boot.  

---

## Provisioning

1. **Clone the repository:**
   ```bash
   git clone https://github.com/DianaMyk/Terraform.git
   cd Terraform

2. **Initialize Terraform:**
    ```bash
    terraform init

3. **Adjust variables:**
    directly in terraform.tfvars or via CLI -var flags

4. **Deploy:**
    ```bash 
    terraform plan 
    terraform apply
