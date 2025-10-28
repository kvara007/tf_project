module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 12.0"

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
}