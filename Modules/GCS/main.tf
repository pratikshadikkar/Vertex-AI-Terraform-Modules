resource "google_storage_bucket" "raw" {
name = var.raw_bucket
location = var.region
uniform_bucket_level_access = true
}


resource "google_storage_bucket" "out" {
name = var.out_bucket
location = var.region
uniform_bucket_level_access = true
}