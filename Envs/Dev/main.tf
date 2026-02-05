module "gcs" {
  source   = "../../modules/gcs"
  project  = var.project_id
  region   = local.region

  raw_bucket_name = local.raw_bucket
  out_bucket_name = local.out_bucket
}

module "pubsub" {
  source  = "../../modules/pubsub"
  project = var.project_id

  topic_name        = local.pubsub_topic_name
  subscription_name = local.pubsub_subscription_name
}

module "iam" {
  source  = "../../modules/iam"
  project = var.project_id

  service_account_id = local.sa_account_id
  pubsub_topic_name  = module.pubsub.topic_name
  raw_bucket_name    = local.raw_bucket
}

module "cloudfunction" {
  source  = "../../modules/cloudfunction"
  project = var.project_id
  region  = local.region

  function_name = "doc-ingest-fn-${local.env}"

  source_bucket = "cf-source-${local.env}"
  source_object = "function.zip"

  raw_bucket = local.raw_bucket
  out_bucket = local.out_bucket

  pubsub_topic            = module.pubsub.topic_id
  service_account_email  = module.iam.sa_email
}