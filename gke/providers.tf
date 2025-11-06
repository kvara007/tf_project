# google_client_config and kubernetes provider must be explicitly specified like the following.

# The data block tells Terraform: “fetch this info dynamically
#  from Google Cloud before creating anything.
data "google_client_config" "default" {}

provider "kubernetes" {
  # Terraform connects to that endpoint and sends commands like 
  # “create pod” or “deploy service.”
  # Terraform connects to the endpoint URL, which is like Google’s “front door” to
  #   cluster. Google then handles the internal connection between that 
  #   endpoint and the real control plane.
  host = "https://${module.gke.endpoint}"

  # Fetches user credentials
  token = data.google_client_config.default.access_token

  # Checks cluster if it's real, before sending commands
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}