resource "tls_private_key" "pk-rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "hcloud_ssh_key" "ssh_key"{
  name   = "new_key"       
  public_key = tls_private_key.pk-rsa.public_key_openssh
}

resource "local_sensitive_file" "pem_file" {
  filename = pathexpand("~/.ssh/new_key.pem")
  file_permission = "400"
  content = tls_private_key.pk-rsa.private_key_pem
}