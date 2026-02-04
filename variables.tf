variable "project_id" {
  type        = string
  description = "GCP project id"
  default     = "uat-oviedo"
}

variable "name" {
  type = string
  description = "Project Name"
  default = "ovb"
}

variable "env" {
  type = string
  description = "Project Environment"
  default = "prd"
}

variable "region" {
  type        = string
  description = "Primary region"
  default     = "northamerica-northeast2"
}

variable "network_name" {
  type        = string
  description = "VPC name"
  default     = "ovb-prd-vpc"
}

variable "db_name" {
  type        = string
  description = "Database name"
  default     = "ovbiedo"
}

variable "db_user" {
  type        = string
  description = "Database user"
  default     = "ovbiedo"
}

variable "artifact_repo_name" {
  type        = string
  description = "Artifact Registry repo name"
  default     = "ovbiedo"
}

variable "media_bucket_name" {
  type        = string
  description = "GCS bucket for media"
  default     = "ovbiedo-media"
}

variable "domain_name" {
  type        = string
  description = "Public domain for HTTPS"
  default     = "ovbiedoapp.ca"
}
