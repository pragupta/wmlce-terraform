output "Access Ubuntu Apache2 Default Page" {
  value = "https://${ibm_is_floating_ip.fip1.address}/"
}

output "Instance SSH Private Key (for debug purposes)" {
  value = "\n${tls_private_key.ssh_key_keypair.private_key_pem}"
}
