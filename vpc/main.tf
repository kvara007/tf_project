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

      secondary_ip_range = [
    {
      range_name = "pods-range"
      ip_cidr_range = "10.48.0.0/14"
    },
    {
      range_name = "services-range"
      ip_cidr_range = "10.52.0.0/20"
    }
      ]
    },
    {
      subnet_name   = var.subnet2_name
      subnet_ip     = var.subnet2_cidr
      subnet_region = var.subnet2_region
    }
  ]

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