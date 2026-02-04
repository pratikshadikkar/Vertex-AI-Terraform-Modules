## Module: Pub/Sub + GCS Notifications

### modules/pubsub_gcs/variables.tf

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Region (used for consistency)"
  type        = string
}

variable "raw_bucket" {
  description = "Raw GCS bucket name"
  type        = string
}

variable "cloud_run_uri" {
  description = "Cloud Run service URI"
  type        = string
}

variable "service_account" {
  description = "Service account email for Pub/Sub push"
  type        = string
}