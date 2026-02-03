## variables.tf — Root Environments

### envs/sbx/variables.tf

```hcl
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "raw_bucket" {
  description = "Raw input bucket"
  type        = string
}

variable "out_bucket" {
  description = "Processed/embedding output bucket"
  type        = string
}

variable "container_image" {
  description = "Cloud Run container image"
  type        = string
}

variable "embedding_dimensions" {
  description = "Vertex AI embedding vector dimensions"
  type        = number
  default     = 768
}
```

---

## Module: GCS

### modules/gcs/variables.tf

```hcl
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Bucket region"
  type        = string
}

variable "raw_bucket" {
  description = "Raw input bucket name"
  type        = string
}

variable "out_bucket" {
  description = "Output bucket name"
  type        = string
}
```

---

## Module: IAM Service Account

### modules/iam_service_account/variables.tf

```hcl
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}
```

---

## Module: Cloud Run

### modules/cloud_run/variables.tf

```hcl
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Cloud Run region"
  type        = string
}

variable "service_account" {
  description = "Service account email used by Cloud Run"
  type        = string
}

variable "container_image" {
  description = "Container image URI"
  type        = string
}

variable "raw_bucket" {
  description = "Raw bucket name"
  type        = string
}

variable "out_bucket" {
  description = "Output bucket name"
  type        = string
}
```

---

## Module: Pub/Sub + GCS Notifications

### modules/pubsub_gcs/variables.tf

```hcl
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Region (used for consistency)"
  type        = string
}

variable "raw_bucket" {
  description = "Raw GCS bucket name"
  type        = string
}

variable "cloud_run_uri" {
  description = "Cloud Run service URI"
  type        = string
}

variable "service_account" {
  description = "Service account email for Pub/Sub push"
  type        = string
}
```

---

## Module: Vertex AI Vector Search

### modules/vertex_ai_vector/variables.tf

```hcl
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Vertex AI region"
  type        = string
}

variable "out_bucket" {
  description = "Bucket containing embedding JSON files"
  type        = string
}

variable "embedding_dimensions" {
  description = "Embedding vector size"
  type        = number
}
```

---

## Why This Is Clean & Correct

* Every module declares **only what it needs**
* No environment leakage into modules
* Easy to add prod-specific overrides
* Matches Terraform best practices

---

## Optional Enhancements (Enterprise++)

* Add variable validation blocks
* Add naming prefixes (env, app)
* Add labels/tags variables

If you want, next I can:

* Add **outputs.tf** for every module
* Add **terraform.tfvars** for sbx/prod
* Add **variable validation & defaults**
* Add **naming standards (env-app-resource)**
