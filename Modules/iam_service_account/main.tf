resource "google_service_account" "batch" {
account_id = "batch-processor-sa"
display_name = "Batch Processor"
}


resource "google_project_iam_member" "sa_storage" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${google_service_account.batch.email}"
}

resource "google_project_iam_member" "sa_vertex" {
  project = var.project_id
  role    = "roles/aiplatform.user"
  member  = "serviceAccount:${google_service_account.batch.email}"
}

resource "google_project_iam_member" "vertex_user" {
  project = var.project_id
  role    = "roles/aiplatform.user"
  member  = "serviceAccount:${google_service_account.batch.email}"
}

