variable "project_id" {
  type        = string
  description = "The GCP project ID."
}

variable "zone" {
  type        = string
  description = "The GCP zone where resources will be created."
}

variable "source_image_family" {
  type        = string
  description = "The source image family for the new image."
}

variable "source_image_project_id" {
  type        = string
  description = "The project ID where the source image resides."
}

variable "machine_type" {
  type        = string
  description = "The machine type to use for the build."
}

variable "ssh_username" {
  type        = string
  description = "Username for SSH access."
}



variable "disk_size" {
  type        = number
  description = "The size of the disk for the instance."
}

variable "disk_type" {
  type        = string
  description = "The type of disk to attach to the instance."
}

variable "credentials_file" {
  type        = string
  description = "The file path to the GCP credentials."
}

variable "image_name" {
  type        = string
  description = "The name of the resulting image that will be created."
}

variable "webapp_zip_source" {
  type        = string
  description = "The local path to the webapp zip file."
}

variable "webapp_service_source" {
  type        = string
  description = "The local path to the webapp service file."
}

variable "run_script" {
  type        = string
  description = "The local path to the run script."
}
