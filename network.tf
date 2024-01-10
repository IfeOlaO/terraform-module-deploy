####VPC
module "vpc" {
  source = "terraform-google-modules/network/google"
  #version = "~> 2.0.0"

  project_id   = var.project_id
  network_name = var.network_name




  ####SUBNET

  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = var.region
    },
    {
      subnet_name           = "subnet-02"
      subnet_ip             = "10.20.10.0/24"
      subnet_region         = var.region
      subnet_private_access = "true"
      description           = "This subnet is private"
    }


  ]

}

###FIREWALL
module "network_firewall-rules" {
  source = "terraform-google-modules/network/google//modules/firewall-rules"
  #version = "9.0.0"

  project_id   = var.project_id
  network_name = module.vpc.network_name
  rules = [{
    name                    = "allow-ssh-ingress"
    description             = null
    direction               = "INGRESS"
    priority                = null
    destination_ranges      = ["10.0.0.0/8"]
    source_ranges           = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
    },
    {
      name        = "allow-icmp"
      description = null
      allow = [{
        protocol = "icmp"
        }
      ]
    },
    {
      name        = "allow-tcp"
      description = null
      allow = [{
        protocol = "tcp"
        ports    = ["8080", "1000-2000"]
        }
      ]
    }
  ]
}