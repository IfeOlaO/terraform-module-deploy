output "network_self_link" {
  value       = module.vpc.network_self_link
  description = "The URI of the VPC being created"
}

output "subnets_self_links" {
  value       = module.vpc.subnets_self_links
  description = "The self-links of subnets being created"
}

output "server-ips" {
  value = [for instance in google_compute_instance.env-vm : instance.network_interface[0].network_ip]
}

output "publicserver-ips" {
  value = [for instance in google_compute_instance.public-vm : instance.network_interface[0].network_ip]
}

output "webserver-ips" {
  value = module.webservers.webserver-ips
}
