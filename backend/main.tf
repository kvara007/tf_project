provider "google" {
  project     = "tf-project-476106"
  region      = "us-central1"
  credentials = file("../terraform_key.json")
}

resource "google_storage_bucket" "tf_state_bucket" {
  name     = "tf-state-bucket_01"
  location = "US"
  versioning {
    enabled = true
  }
}