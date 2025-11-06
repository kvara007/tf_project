# Common variables
project_id = "tf-project-476106"
region     = "us-central1"

# VPC variables
network_name   = "vpc-network1"
subnet1_name   = "subnet1"
subnet1_cidr   = "10.0.1.0/24"
subnet1_region = "us-central1"
subnet2_name   = "subnet2"
subnet2_cidr   = "10.0.2.0/24"
subnet2_region = "us-east1"

# Gke variables
name          = "alchemy-cluster"
ip_range_pods = "pods-range"
node_sa       = "tf-gke-alchemy-cluster-0fu2@tf-project-476106.iam.gserviceaccount.com"

# Cloud sql variables
db_name          = "alchemy-db"
database_version = "POSTGRES_15"

