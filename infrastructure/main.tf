terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }

  backend "gcs" {
    bucket = "mlops-knds-terraform-state-store"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.PROJECT_ID
  region  = var.DEFAULT_REGION
  zone    = var.DEFAULT_ZONE
}

resource "google_compute_address" "backend-static-ip-address" {
  name   = "backend-static-ip-address"
}

module "gke" {
  source = "./modules/gke"

  name       = "main-cluster"
  node_count = 3
  node_size  = "e2-standard-4"
}

output "backend-static-ip-address" {
  value     = google_compute_address.backend-static-ip-address.address
  sensitive = false
}