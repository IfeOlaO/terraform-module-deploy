resource "google_compute_subnetwork" "subnets" {
   for_each = toset(var.environment_list)

  name          = "subnet-${lower(each.key)}"
  ip_cidr_range = "10.${index(var.environment_list, each.key) + 1}.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.self_link

  # Other subnet configurations can be added here
}

  resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  project                 = var.project_id
  auto_create_subnetworks = false
}