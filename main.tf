terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 4.0"
    }
  }
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "ashokr"
    workspaces {
      name = "dev-apps"
    }
  }
}

provider "google" {
  project = "turing-zone-449023-g3"
  region = "us-central1"
  credentials = var.GCP_CREDENTIALS_JSON
}

resource "google_storage_bucket" "static" {
 name          = "dev-data-bucket"
 location      = "US"
 storage_class = "STANDARD"
 uniform_bucket_level_access = true
}
