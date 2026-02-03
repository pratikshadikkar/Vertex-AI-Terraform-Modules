resource "google_pubsub_topic" "ingest" {
name = "doc-ingest-topic"
}


resource "google_pubsub_subscription" "push" {
name = "doc-ingest-push"
topic = google_pubsub_topic.ingest.id


push_config {
push_endpoint = var.cloud_run_uri


oidc_token {
service_account_email = var.service_account
audience = var.cloud_run_uri
}
}
}


resource "google_storage_notification" "raw_events" {
bucket = var.raw_bucket
topic = google_pubsub_topic.ingest.id
payload_format = "JSON_API_V1"
event_types = ["OBJECT_FINALIZE"]
}