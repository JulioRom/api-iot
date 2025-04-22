##############################################
# main.tf - Infraestructura VM DEV completa #
##############################################

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "iot_vm_dev" {
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
      # Provisión de IP externa para acceso SSH y despliegue
    }
  }

  # Script que se ejecuta al iniciar la VM
  metadata_startup_script = file("${path.module}/startup.sh")

  # Inyección de clave pública SSH para acceso por terminal
  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_pub_key_path)}"
  }
  labels = {
    env = "dev"
  }

  # Asignación de Service Account con permisos y scopes necesarios
  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }

  # Etiquetas útiles para reglas de firewall o segmentación
  tags = ["dev","allow-tcp-6000","http-server", "https-server"]
}

resource "google_compute_firewall" "allow_tcp_6000" {
  name    = "allow-tcp-6000"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["6000"]
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"] # Acceso desde cualquier IP

  target_tags = ["allow-tcp-6000"]

  description = "Permitir tráfico TCP en el puerto 6000 desde cualquier IP"
}
