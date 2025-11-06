module "gke" {
  source              = "terraform-google-modules/kubernetes-engine/google"
  project_id          = var.project_id
  region              = var.region
  name                = var.name
  network             = var.network
  subnetwork          = var.subnetwork
  ip_range_pods       = "pods-range"
  ip_range_services   = "services-range"
  regional            = false
  zones               = ["us-central1-a"]
  deletion_protection = false

  node_pools = [
    {
      name         = "alchemy-node-pool"
      machine_type = "e2-medium"
      # One node per zone
      min_count    = 1
      max_count    = 1
      disk_size_gb = 50
      # If VM node unhealthy recreate it
      auto_repair = true
      # Upgrage node version
      auto_upgrade    = true
      service_account = var.node_sa

    }
  ]
}