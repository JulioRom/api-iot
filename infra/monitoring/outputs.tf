##############################################
# outputs.tf - Valores expuestos al aplicar  #
##############################################


output "monitoring_instance_ip" {
  value       = google_compute_instance.monitoring_vm.network_interface[0].access_config[0].nat_ip
  description = "IP pública de VM de monitoreo"
}

output "ssh_connection_hint" {
  description = "Comando de conexión SSH"
  value       = "ssh ${var.ssh_user}@${google_compute_instance.monitoring_vm.network_interface[0].access_config[0].nat_ip}"
}
