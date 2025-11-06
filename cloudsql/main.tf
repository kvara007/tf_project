data "google_compute_network" "vpc" {
  name    = var.network_name
  project = var.project_id
}

module "pg" {
  source  = "terraform-google-modules/sql-db/google//modules/postgresql"
  version = "~> 26.2"

  name             = var.db_name
  db_name          = var.db_name
  project_id       = var.project_id
  database_version = var.database_version
  region           = var.region
  zone             = var.zone
  ip_configuration = {
    private_network = data.google_compute_network.vpc.self_link
    ipv4_enabled    = false
  }
  # by default cloud sql protects data deletion, with deletion_protection you can delete instance when you run terraform destroy
  deletion_protection = false
}