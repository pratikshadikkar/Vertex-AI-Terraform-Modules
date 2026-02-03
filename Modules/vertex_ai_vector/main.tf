resource "google_vertex_ai_index" "index" {
project = var.project_id
region = var.region
display_name = "doc-embeddings-index"


metadata {
contents_delta_uri = "gs://${var.out_bucket}/"


config {
dimensions = var.embedding_dimensions
distance_measure_type = "DOT_PRODUCT_DISTANCE"
}
}


index_update_method = "STREAM_UPDATE"
}