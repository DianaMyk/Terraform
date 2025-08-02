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