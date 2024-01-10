
module "cloud_storage" {
  source  = "terraform-google-modules/cloud-storage/google"
  #version = "5.0.0"
  project_id = var.project_id

  for_each = toset(var.environment_list)
  names     = ["${lower(each.key)}_${var.project_name}"]
  location = "US"
}