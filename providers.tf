# Tells terraform to download the google provider from the hashicorp registry
terraform{
    required_providers{
        google={
            source= "hashicorp/google"
            version= "~> 7.0.0"
        }
        
    }
}

# Tells terraform on which project and region to work
provider "google"{
    project = "tf-project"
    region="us-central1"
}