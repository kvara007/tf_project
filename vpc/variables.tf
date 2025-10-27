variable "project_id" {
    description = "GCP project ID"
    type       = string
}

variable "network_name" {
    description = "Name of the VPC network"
    type = string
}

variable "region" {
    description = "GCP region"
    type   = string
}

variable "subnet1_name" {
    description = "Name of the first subnet"
    type = string
}

variable "subnet1_cidr" {
    description = "CIDR block for the first subnet"
    type = string
}

variable "subnet2_name" {
    description = "Name of the second subnet"
    type = string
}

variable "subnet2_cidr" {
    description = "CIDR block for the second subnet"
    type = string
}

variable "bucket_name" {
    description = "Name of the GCS bucket for Terraform state"
    type = string
}

Continue from here!!!!