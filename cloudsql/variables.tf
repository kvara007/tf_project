variable "region" {
  description = "Region to deploy cloud sql instance"
  type        = string
}

variable "project_id" {
  description = "Project to where deploy cloud sql instance"
  type        = string
}

variable "database_version" {
  type = string
}

variable "db_name" {
  description = "Name of the cloud sql instance"
  type        = string
}

variable "network_name" {
  description = "VPC for private ip"
  type        = string
}

variable "zone" {
  description = "The zone where Cloud sql instance is deployed"
  type = string
}