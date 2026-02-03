variable "project_id" {
description = "GCP Project ID"
type = string
}


variable "region" {
description = "Cloud Run region"
type = string
}


variable "service_account" {
description = "Service account email used by Cloud Run"
type = string
}


variable "container_image" {
description = "Container image URI"
type = string
}


variable "raw_bucket" {
description = "Raw bucket name"
type = string
}


variable "out_bucket" {
description = "Output bucket name"
type = string
}