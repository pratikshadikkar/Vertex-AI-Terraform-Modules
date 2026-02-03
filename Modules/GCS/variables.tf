variable "project_id" {
description = "GCP Project ID"
type = string
}


variable "region" {
description = "Bucket region"
type = string
}


variable "raw_bucket" {
description = "Raw input bucket name"
type = string
}


variable "out_bucket" {
description = "Output bucket name"
type = string
}