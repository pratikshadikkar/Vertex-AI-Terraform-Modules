resource "google_cloud_run_v2_service" "batch" {
  name     = "batch-processor"
  location = var.region

  template {
    service_account = var.service_account_email

    containers {
      image = var.container_image

      env {
        name  = "RAW_BUCKET"
        value = var.raw_bucket
      }

      env {
        name  = "OUT_BUCKET"
        value = var.out_bucket
      }

      env {
        name  = "PROJECT_ID"
        value = var.project_id
      }

      env {
        name  = "REGION"
        value = var.region
      }
    }
  }
}