variable "GCP_CREDENTIALS_JSON" {
  type        = string
  description = "GCP Service Account Credentials in JSON format"
  sensitive   = true
}

variable "GCP_KUB_REGION" {
  type        = string
  description = "GCP kubernetes region"
  default = "us-central1"
}