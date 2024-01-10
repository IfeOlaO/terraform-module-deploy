    variable "zone" {
  type    = string
  default = "northamerica-northeast2-b"
}

variable "target_environment" {
  default = "DEV"
}

variable "environment_map" {
  type = map(string)
  default = {
    "DEV"   = "dev",
    "STAGE" = "stage",
    "PROD"  = "prod"
  }
}

variable "number" {
  default = 3
}

variable "region" {
  type    = string
  default = "northamerica-northeast2"
}

variable "project_id" {
  type = string
  #default = "th-ifegcplab-lab-e04779"
}

variable "server_settings" {
    type = map(object({machine_type=string, labels=map(string)}))
}

variable "prefix" {
    type = string
    default = "web"
}

variable "network_interface" {
    type = object({network=string, subnetwork=string})
}

