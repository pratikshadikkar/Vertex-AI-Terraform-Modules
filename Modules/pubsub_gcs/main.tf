resource "google_pubsub_topic" "ingest" {
  name    = var.topic_name
  project = var.project
}

resource "google_pubsub_subscription" "push" {
  name  = var.subscription_name
  topic = google_pubsub_topic.ingest.name
  project = var.project
}