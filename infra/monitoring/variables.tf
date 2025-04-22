##############################################
# variables.tf - Variables para la VM MONITORING
##############################################

# Nombre del proyecto GCP
variable "project" {
  description = "ID del proyecto de GCP"
  type        = string
}

# Región donde se desplegará la VM
variable "region" {
  description = "Región donde se desplegará la infraestructura"
  type        = string
}

# Zona específica dentro de la región
variable "zone" {
  description = "Zona específica de la región"
  type        = string
}

# Nombre de la instancia de monitoreo
variable "instance_name" {
  description = "Nombre de la instancia de monitoreo"
  type        = string
  default     = "monitoring-vm"
}

# Tipo de máquina. Se recomienda e2-medium para mayor RAM
variable "machine_type" {
  description = "Tipo de máquina (CPU y RAM)"
  type        = string
  default     = "e2-medium"
}

# Ruta al archivo de clave pública SSH
variable "ssh_pub_key_path" {
  description = "Ruta al archivo de clave pública SSH"
  type        = string
}

# Nombre del usuario SSH
variable "ssh_user" {
  description = "Usuario para acceder por SSH"
  type        = string
}

# Correo electrónico del service account con permisos suficientes
variable "service_account_email" {
  description = "Correo del Service Account con permisos para GCP"
  type        = string
}
