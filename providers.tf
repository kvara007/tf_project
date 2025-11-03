# Tells terraform to download the google provider from the hashicorp registry
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0.0"
    }

  }
}

# Tells terraform on which platform, project and region to work with
provider "google" {
  project = var.project_id
  region  = var.region
}

# Tells terraform to use bucket for state file
terraform {
  backend "gcs" {
    bucket = "tf-state-bucket-01abc"
    prefix = "project1/state"
  }
}