module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 12.0.0"

  project_id   = var.project_id
  network_name = var.network_name

  subnets = [
    {
      subnet_name   = var.subnet1_name
      subnet_ip     = var.subnet1_cidr
      subnet_region = var.subnet1_region
    },
    {
      subnet_name   = var.subnet2_name
      subnet_ip     = var.subnet2_cidr
      subnet_region = var.subnet2_region
    }
  ]

  secondary_ranges = {
    "subnet1" = [
      {
        range_name    = "pods-range"
        ip_cidr_range = "10.48.0.0/14"
      },
      {
        range_name    = "services-range"
        ip_cidr_range = "10.52.0.0/20"
      }
    ]
  }
  firewall_rules = [
    {
      name      = "allow-all-internal"
      direction = "INGRESS"
      ranges    = ["10.0.0.0/8"]
      allow = [
        { protocol = "tcp", ports = ["22", "80", "443"] },
        { protocol = "icmp" }
      ]
    },
    {
      name      = "allow-external-ssh"
      direction = "INGRESS"
      ranges    = ["0.0.0.0/0"]
      allow = [
        { protocol = "tcp", ports = ["22"] }
      ]
  }]
}

# Peering VPC to Google's service VPC, where cloud SQL lives
# Allocate IP ranges for peering
resource "google_compute_global_address" "private_ip_address" {
  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = module.vpc.network_id
  project       = var.project_id
}

# Create private connection between VPC and Google's service VPC
# Which is cloud SQL
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = module.vpc.network_id # To where we are peering Google service VPC
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}
