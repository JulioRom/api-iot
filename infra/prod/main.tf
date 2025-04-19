##############################################
# main.tf - Infraestructura VM PROD completa #
##############################################

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "iot_vm_prod" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # IP pública para acceso SSH y despliegue remoto
    }
  }

  # Script de inicio automático
  metadata_startup_script = file("${path.module}/startup.sh")

  # Clave pública SSH para conexión manual segura
  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_pub_key_path)}"
  }

  # Asignación de Service Account y alcance completo a APIs
  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }

  # Etiquetas de ambiente para futuras reglas de red o monitoreo
  tags = ["prod"]
}