module "vpc" {
  source         = "./vpc"
  project_id     = var.project_id
  region         = var.region
  network_name   = var.network_name
  subnet1_name   = var.subnet1_name
  subnet1_cidr   = var.subnet1_cidr
  subnet1_region = var.subnet1_region
  subnet2_name   = var.subnet2_name
  subnet2_cidr   = var.subnet2_cidr
  subnet2_region = var.subnet2_region
}

module "gke" {
  source        = "./gke"
  project_id    = var.project_id
  region        = var.region
  name          = var.name
  network       = var.network_name
  subnetwork    = var.subnet1_name
  ip_range_pods = var.ip_range_pods
  node_sa       = var.node_sa
}

module "pg" {
  source           = "./cloudsql"
  db_name          = var.db_name
  project_id       = var.project_id
  region           = var.region
  database_version = var.database_version
  network_name     = var.network_name
}