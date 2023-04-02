resource "google_container_registry" "gcr" {
  project  = var.project_id
  location = "EU"
}
