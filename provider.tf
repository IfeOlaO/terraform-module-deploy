### PROVIDER
provider "google" {
  project = var.project_id
  #project = "th-ifegcplab-lab-e04779" #replace this with your project-id
  credentials = var.credentials_file
  region      = var.region
  zone        = var.zone
}
