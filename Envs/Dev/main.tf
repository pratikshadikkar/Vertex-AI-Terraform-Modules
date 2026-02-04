# provider "google" {
# project = var.project_id
# region = var.region
# }


module "iam_service_account" {
  source     = "../../modules/iam_service_account"
  project_id = var.project_id
}

module "gcs" {
  source     = "../../modules/gcs"
  project_id = var.project_id
  region     = var.region
  raw_bucket = var.raw_bucket
  out_bucket = var.out_bucket
}

module "cloud_run" {
  source = "../../modules/cloud_run"

  project_id            = var.project_id
  region                = var.region
  container_image       = var.container_image
  service_account_email = module.iam_service_account.email
  raw_bucket            = module.gcs.raw_bucket
  out_bucket            = module.gcs.out_bucket
}

module "pubsub" {
source = "../../modules/pubsub_gcs"
project_id = var.project_id
region = var.region
raw_bucket = module.gcs.raw_bucket
cloud_run_uri = module.cloud_run.uri
service_account = module.iam_service_account.email
}


module "vertex" {
source = "../../modules/vertex_ai_vector"
project_id = var.project_id
region = var.region
out_bucket = module.gcs.out_bucket
embedding_dimensions = var.embedding_dimensions
}