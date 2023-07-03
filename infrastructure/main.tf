terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.72.0"
    }
  }

  backend "gcs" {
    bucket = "tyro-terraform-state-store"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.PROJECT_ID
  region  = var.DEFAULT_REGION
  zone    = var.DEFAULT_ZONE
}

module "gke" {
  source = "./modules/gke"

  name       = "main-cluster"
  node_count = 3
  node_size  = "e2-standard-4"
}
