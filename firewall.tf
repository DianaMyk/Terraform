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
    port       = "443"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
     ]
  }
 }