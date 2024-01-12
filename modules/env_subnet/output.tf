output "subnets_self_links" {
  description = "Self-links of the created subnets"
  value       = [for subnet in google_compute_subnetwork.subnets : subnet.self_link]
}

output "network_self_link" {
  description = "Self-link of the VPC network"
  value       = google_compute_network.vpc_network.self_link
}