terraform {
  backend "gcs" {
    bucket = "tf-state-doc-ingest"
    prefix = "embedding-search"
  }
}