provider "google" {
project = var.project_id
region = var.region
}


module "gcs" {
source = "../../modules/gcs"
project_id = var.project_id
region = var.region
raw_bucket = var.raw_bucket
out_bucket = var.out_bucket
}


module "service_account" {
source = "../../modules/iam_service_account"
project_id = var.project_id
}


module "cloud_run" {
source = "../../modules/cloud_run"
project_id = var.project_id
region = var.region
service_account = module.service_account.email
container_image = var.container_image
raw_bucket = module.gcs.raw_bucket
out_bucket = module.gcs.out_bucket
}


module "pubsub" {
source = "../../modules/pubsub_gcs"
project_id = var.project_id
region = var.region
raw_bucket = module.gcs.raw_bucket
cloud_run_uri = module.cloud_run.uri
service_account = module.service_account.email
}


module "vertex" {
source = "../../modules/vertex_ai_vector"
project_id = var.project_id
region = var.region
out_bucket = module.gcs.out_bucket
embedding_dimensions = var.embedding_dimensions
}