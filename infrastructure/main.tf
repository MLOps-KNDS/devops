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

module "vpc-network" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 7.0"
  project_id   = var.PROJECT_ID 
  network_name = "main-cluster-network"
  mtu          = 1460

  subnets = [
    {
      subnet_name   = "subnet-${var.DEFAULT_REGION}"
      subnet_ip     = "192.168.1.0/24"
      subnet_region = var.DEFAULT_REGION
    }
  ]
}

module "gke" {
  source = "./modules/gke"

  name       = "main-cluster"
  node_count = 3
  node_size  = "e2-standard-4"
  network    = module.vpc-network.network_name
  subnet     = module.vpc-network.subnets[0].subnet_name
}
