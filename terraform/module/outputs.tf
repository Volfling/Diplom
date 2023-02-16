output "internal_ip_address_vm" {
  value = compute_instance.vm.network_interface.0.ip_address
}

output "external_ip_address_vm" {
  value = compute_instance.vm.network_interface.0.nat_ip_address
}