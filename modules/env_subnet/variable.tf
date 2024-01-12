variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "environment_list" {
  description = "List of environments"
  type        = list(string)
}

variable "network" {
  #default = google_compute_network.vpc_network.self_link
}      