terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }

  backend "gcs" {
    bucket = "mlops-knds-tf-state-store"
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

  project_id = var.PROJECT_ID
}
