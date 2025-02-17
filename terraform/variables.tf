variable "project_id" {
  description = "GCP Project ID"
}

variable "region" {
  description = "GCP Region"
  default     = "us-central1"
}

variable "cluster_name" {
  description = "Name of GKE Cluster"
  default     = "simple-app-cluster"
}

variable "artifact_repo_name" {
  description = "Artifact Registry repository name"
  default     = "simple-app-repo"
}
