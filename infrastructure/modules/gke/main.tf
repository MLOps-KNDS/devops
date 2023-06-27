resource "google_container_cluster" "gke" {
  name = var.name

  remove_default_node_pool = true
  initial_node_count       = 1
  
  dns_config {
    cluster_dns        = "CLOUD_DNS"
    cluster_dns_scope  = "VPC_SCOPE" 
    cluster_dns_domain = var.project_id
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
