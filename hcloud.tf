terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.51.0"
    }
  }
}
provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_server" "server" {
  name        = "sum"
  image       = var.os_type
  server_type = var.server_type
  location    = var.location
  ssh_keys     =[hcloud_ssh_key.ssh_key.id]
  firewall_ids = [hcloud_firewall.firewall_terraform.id]
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  user_data = templatefile("./cloud-init.yaml", {
    ssh_pub_key = tls_private_key.pk-rsa.public_key_openssh
  })
}