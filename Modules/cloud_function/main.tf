#################################
# Source bucket for function code
#################################
resource "google_storage_bucket" "src" {
  name     = "${var.project_id}-fn-src-${terraform.workspace}"
  location = var.region
  project  = var.project_id

  uniform_bucket_level_access = true
}

#################################
# Upload function zip
#################################
resource "google_storage_bucket_object" "code" {
  bucket = google_storage_bucket.src.name
  name   = "function.zip"
  source = "${path.root}/../../function_src/function.zip"
}

#################################
# Cloud Function Gen2
#################################
resource "google_cloudfunctions2_function" "function" {
  name     = var.function_name
  location = var.region
  project  = var.project_id

  build_config {
    runtime     = "python310"
    entry_point = "ingest"

    source {
      storage_source {
        bucket = google_storage_bucket.src.name
        object = google_storage_bucket_object.code.name
      }
    }
  }

  service_config {
    service_account_email = var.service_account_email

    environment_variables = {
      PROJECT_ID = var.project_id
      REGION     = var.region
      RAW_BUCKET = var.raw_bucket
      OUT_BUCKET = var.out_bucket
    }
  }

  event_trigger {
    trigger_region = var.region
    event_type     = "google.cloud.pubsub.topic.v1.messagePublished"
    pubsub_topic   = var.pubsub_topic
  }

  depends_on = [
    google_storage_bucket_object.code
  ]
}