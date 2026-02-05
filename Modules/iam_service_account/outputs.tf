# output "email" {
#   value = google_service_account.batch.email
# }

output "email" {
  value = google_service_account.fn.email
}