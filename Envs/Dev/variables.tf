variable "project_id" {
description = "GCP Project ID"
type = string
}


variable "region" {
description = "GCP Region"
type = string
default = "us-central1"
}


variable "raw_bucket" {
description = "Raw input bucket"
type = string
}


variable "out_bucket" {
description = "Processed/embedding output bucket"
type = string
}


variable "container_image" {
description = "Cloud Run container image"
type = string
}


variable "embedding_dimensions" {
description = "Vertex AI embedding vector dimensions"
type = number
default = 768
}