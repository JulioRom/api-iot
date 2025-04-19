##############################################
# outputs.tf - Valores expuestos al aplicar  #
##############################################

output "vm_external_ip" {
  description = "IP pública de la VM creada"
  value       = google_compute_instance.iot_vm_dev.network_interface[0].access_config[0].nat_ip
}

output "ssh_connection_hint" {
  description = "Comando de conexión SSH"
  value       = "ssh ${var.ssh_user}@${google_compute_instance.iot_vm_dev.network_interface[0].access_config[0].nat_ip}"
}