output "artifact_repository_url" {
  value       = "${var.region}-docker.pkg.dev/${var.project_id}/${var.artifact_repo_name}"
  description = "URL of the Artifact Registry Docker repo"
}

output "cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE cluster name"
}

output "cluster_endpoint" {
  value       = data.google_container_cluster.cluster_data.endpoint
  description = "GKE cluster endpoint"
}

output "cluster_ca_certificate" {
  value       = data.google_container_cluster.cluster_data.master_auth[0].cluster_ca_certificate
  description = "CA cert for GKE cluster"
}
