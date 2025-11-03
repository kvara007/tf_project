variable "project_id" {
  description = "Project id to host the cluster"
  type        = string
}

variable "region" {
  description = "Region for GKE cluster"
  type = string
}

variable "network" {
  description = "VPC network to host the cluster"
  type        = string
}


variable "subnetwork" {
  description = "Subnet to host the cluster"
  type        = string
}

variable "name" {
  description = "Name of the cluster"
  type        = string
}

variable "ip_range_pods" {
  description = "IP range for pods"
  type        = string
}

variable "node_sa" {
  description = "Service account email used by GKE nodes"
  type = string
}