output "raw_bucket" {
  value = google_storage_bucket.raw.name
}

output "out_bucket" {
  value = google_storage_bucket.out.name
}