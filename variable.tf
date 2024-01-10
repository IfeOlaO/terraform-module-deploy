variable "project_id" {
  type = string
  #default = "th-ifegcplab-lab-e04779"
}

variable "project_name" {
  type = string
  default = "th-ifegcplab"
}

variable "credentials_file" {
  default = "th-ifegcplab-lab-e04779-da857f85c2c4.json"
}

variable "region" {
  type    = string
  default = "northamerica-northeast2"
}

variable "zone" {
  type    = string
  default = "northamerica-northeast2-b"
}

variable "network_name" {
  type    = string
  default = "my-vpc-network-mod"
}

variable "cidr_range" {
  type    = string
  default = "10.10.0.0/20"
}

variable "target_environment" {
  default = "DEV"
}

variable "environment_list" {
  type    = list(string)
  default = ["DEV", "STAGE", "PROD"]
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

variable "environment_instance_settings" {
  type = map(object({ machine_type = string, labels = map(string) }))
  default = {
    "DEV" = {
      machine_type = "f1-micro"
      labels = {
        environment = "dev"
      }
    },
    "QA" = {
      machine_type = "e2-micro"
      labels = {
        environment = "qa"
      }
    },
    "STAGE" = {
      machine_type = "e2-micro"
      labels = {
        environment = "stage"
      }
    },
    "PROD" = {
      machine_type = "e2-medium"
      labels = {
        environment = "prod"
      }
    }
  }
}