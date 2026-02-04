project_id = "project-908c61b1-26ec-4b3e-8b9"
region = "us-central1"


# GCS Buckets (prod naming)
raw_bucket = "doc-raw-input-prod-module"
out_bucket = "doc-embedding-output-prod-module"


# Cloud Run (prod image – immutable tag recommended)
container_image = "us-central1-docker.pkg.dev/project-908c61b1-26ec-4b3e-8b9/batch-repo/batch-processor:latest"


# Vertex AI
embedding_dimensions = 768