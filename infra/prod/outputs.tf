##############################################
# outputs.tf - Datos expuestos de la VM PROD #
##############################################

output "vm_external_ip" {
  description = "IP pública de la VM PROD"
  value       = google_compute_instance.iot_vm_prod.network_interface[0].access_config[0].nat_ip
}

output "ssh_connection_hint" {
  description = "Comando SSH sugerido"
  value       = "ssh ${var.ssh_user}@${google_compute_instance.iot_vm_prod.network_interface[0].access_config[0].nat_ip}"
}