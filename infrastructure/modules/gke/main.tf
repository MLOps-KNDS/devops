resource "google_container_cluster" "gke" {
  name = var.name

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.network
  subnetwork = var.subnet

  private_cluster_config {
    master_ipv4_cidr_block  = "172.16.0.0/28"
    enable_private_endpoint = true
    enable_private_nodes    = true
  }
  ip_allocation_policy {
  }
  master_authorized_networks_config {
  }
}

resource "google_container_node_pool" "gke_nodes" {
  name       = "gke-cluster-node-pool"
  cluster    = google_container_cluster.gke.name
  node_count = var.node_count

  node_config {
    machine_type = var.node_size

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]
  }
}

resource "google_compute_firewall" "rules" {
  name    = "allow-ssh"
  network = var.network
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"]
}

resource "google_compute_router" "router" {
  name    = "nat-router"
  network = var.network
}

module "cloud-nat" {
  source                             = "terraform-google-modules/cloud-nat/google"
  version                            = "~> 4.0"
  router                             = google_compute_router.router.name
  name                               = "nat-config"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
