resource "google_service_account" "processor" {
  account_id   = var.service_account_id
  display_name = "Batch Processor SA"
  project      = var.project
}

resource "google_pubsub_topic_iam_member" "publisher" {
  project = var.project
  topic   = var.pubsub_topic_name
  role    = "roles/pubsub.publisher"
  member  = "serviceAccount:${google_service_account.processor.email}"
}

resource "google_storage_bucket_iam_member" "raw_reader" {
  bucket = var.raw_bucket_name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.processor.email}"
}

resource "google_project_iam_member" "vertex_user" {
  project = var.project
  role    = "roles/aiplatform.user"
  member  = "serviceAccount:${google_service_account.processor.email}"
}

resource "google_project_iam_member" "logs" {
  project = var.project
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.processor.email}"
}