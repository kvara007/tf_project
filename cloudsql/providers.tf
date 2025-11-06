# In which platform to create resources
provider "google" {
    # Which region and project create resources
    project = var.project_id
    region = var.region
}

provider "google-beta" {
    project = var.project_id
    region = var.region
}