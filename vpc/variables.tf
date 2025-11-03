variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet1_name" {
  description = "Name of the first subnet"
  type        = string
}

variable "subnet1_cidr" {
  description = "CIDR block for the first subnet"
  type        = string
}

variable "subnet1_region" {
  description = "Region for subnet1"
  type        = string
  default     = "us-central1"
}

variable "subnet2_name" {
  description = "Name of the second subnet"
  type        = string
}

variable "subnet2_cidr" {
  description = "CIDR block for the second subnet"
  type        = string
}

variable "subnet2_region" {
  description = "Region for subnet2"
  type        = string
  default     = "us-east1"
}

variable "project_id" {
  type = string
}

variable "region" {
  type = string
}