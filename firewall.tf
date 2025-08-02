resource "hcloud_firewall" "firewall_terraform" {
  name = "firewall_terraform"
  rule {
    direction = "in"
    protocol  = "icmp"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

# Allow HTTP and custom TCP ports 
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "80"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "22"
    source_ips = [
        "93.175.206.147/32",
        "2001:67c:11d4:65f4:1101:fd1c:a8ab:39ef/128"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "9428"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "8094"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "8080"
    source_ips = ["127.0.0.1", "172.0.0.0/8"]
  }
}