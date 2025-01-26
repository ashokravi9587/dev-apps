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
}