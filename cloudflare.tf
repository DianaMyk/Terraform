resource "cloudflare_dns_record" "root" {
  zone_id = var.cloudflare_zone_id
  name = "@"
  ttl = 1
  type = "A"
  content = hcloud_server.server.ipv4_address
  proxied = true
}

resource "cloudflare_dns_record" "homer" {
  zone_id = var.cloudflare_zone_id
  name = "homer"
  ttl = 1
  type = "A"
  comment = "Domain record"
  content = hcloud_server.server.ipv4_address
  proxied = true
}

resource "cloudflare_dns_record" "logs" {
  zone_id = var.cloudflare_zone_id
  name = "logs"
  ttl = 1
  type = "A"
  content = hcloud_server.server.ipv4_address
  proxied = true
}