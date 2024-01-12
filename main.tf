####ENV_SUBNET
module "env_subnet" {
  source = "./modules/env_subnet"
  #subnet_name= "subnet-${each.key}"
  project_id       = var.project_id
  region           = var.region
  network_name     = var.network_name
  network          = module.env_subnet.subnets_self_links
  environment_list = var.environment_list
}


# ###COMPUTE

####CREATE COMPUTE INSTANCE - PUBLIC
resource "google_compute_instance" "public-vm" {
  name         = "server-${count.index}"
  count        = 3
  machine_type = "e2-micro"
  zone         = var.zone
  labels = {
    environment = var.environment_map[var.target_environment]
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = module.env_subnet.subnets_self_links[0]
    access_config {
      // Ephemeral IP
    }

  }

  tags = ["http-server"]
}


resource "google_compute_instance" "env-vm" {
  for_each     = toset(var.environment_list)
  name         = "server-${lower(each.key)}"
  machine_type = "e2-micro"
  zone         = var.zone
  labels       = { environment = lower(each.key) }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = module.env_subnet.subnets_self_links[0]
    access_config {
      // Ephemeral IP
    }

  }

  tags = ["http-server"]
}

###WEBSERVERS
module "webservers" {
  source          = "./modules/webservers"
  project_id      = var.project_id
  server_settings = var.environment_instance_settings
  region          = var.region
  zone            = var.zone
  network_interface = {
    network    = module.env_subnet.network_self_link,
    subnetwork = module.env_subnet.subnets_self_links[0]
  }
}