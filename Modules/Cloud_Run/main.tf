resource "google_cloud_run_v2_service" "service" {
name = "batch-processor"
location = var.region


template {
service_account = var.service_account


containers {
image = var.container_image


env { name = "PROJECT_ID" value = var.project_id }
env { name = "REGION" value = var.region }
env { name = "RAW_BUCKET" value = var.raw_bucket }
env { name = "OUT_BUCKET" value = var.out_bucket }
}
}
}