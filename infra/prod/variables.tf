##############################################
# variables.tf - Variables para entorno PROD #
##############################################

variable "project" {
  description = "ID del proyecto de GCP"
  type        = string
}

variable "region" {
  description = "Región de GCP"
  type        = string
}

variable "zone" {
  description = "Zona de GCP"
  type        = string
}

variable "instance_name" {
  description = "Nombre de la instancia VM"
  type        = string
}

variable "machine_type" {
  description = "Tipo de máquina de la VM"
  type        = string
}

variable "ssh_user" {
  description = "Usuario SSH para acceso a la instancia"
  type        = string
}

variable "ssh_pub_key_path" {
  description = "Ruta local a la clave pública SSH"
  type        = string
}

variable "service_account_email" {
  description = "Email de la Service Account usada por la instancia"
  type        = string
}
