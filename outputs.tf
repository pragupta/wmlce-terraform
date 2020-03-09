output "In order to login to the VM created, save the following ssh key to a file with `chmod 600` permissions to the file" {
  value = "\n${tls_private_key.ssh_key_keypair.private_key_pem}"
}

output "ssh into the VM using root useer and the following IP address:" {
  value = "${ibm_is_floating_ip.fip1.address}"
}
