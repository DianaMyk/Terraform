resource "hcloud_server" "server" {
  name        = "terraform-server"
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
    compose = base64encode(file(var.docker_compose_file))
    vector  = base64encode(file(var.vector_config_file))
    nginx_homer   = base64encode(file(var.nginx_homer_conf))
    nginx_logs   = base64encode(file(var.nginx_logs_conf))
    ssh_pub_key = tls_private_key.pk-rsa.public_key_openssh
    CF_API_TOKEN = var.cloudflare_api_token
    domain_homer  = var.domain_homer
    domain_logs  = var.domain_logs
    ssl_email     = var.ssl_email
  })
}