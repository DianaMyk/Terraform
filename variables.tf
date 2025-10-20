# Declare the hcloud_token variable from .tfvars
variable "hcloud_token" {
  sensitive = true
}
 
variable "location" {
  default = "hel1"
}

variable "http_protocol" {
  default = "http"
}

variable "http_port" {
  default = "80"
}

variable "server_type" {
  default = "cpx11"
}

variable "os_type" {
  default = "ubuntu-24.04"
}

variable "docker_compose_file" {
  default = "./compose.yaml"
}

variable "vector_config_file" {
  default = "./vector.yaml"
}

variable "cloudflare_api_token" {
  sensitive = true
}

variable "cloudflare_zone_id" {
  sensitive = true
}

variable "domain_homer" {
  description = "Domain for Homer dashboard"
  type        = string
  default     = "homer.dimykytyn.win"
}

variable "domain_logs" {
  description = "Domain for Victoria Logs"
  type        = string
  default     = "logs.dimykytyn.win"
}

variable "ssl_email" {
  description = "Email for Let's Encrypt certificates"
  type        = string
  default     = "mykytyn.di@gmail.com"
}

variable "nginx_homer_conf" {
  description = "Path to nginx homer configuration file"
  type        = string
  default     = "./nginx/conf/homer.conf"
}

variable "nginx_logs_conf" {
  description = "Path to nginx logs configuration file"
  type        = string
  default     = "./nginx/conf/logs.conf"
}

variable "cloudflare_ini" {
  description = "Path to ini file"
  type        = string
  default     = "./cloudflare.ini"
}