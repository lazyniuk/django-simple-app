terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_artifact_registry_repository" "repo" {
  location      = var.region
  repository_id = var.artifact_repo_name
  format        = "DOCKER"
  description   = "Docker repository for Simple App"
}

resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = 1
  networking_mode    = "VPC_NATIVE"

  ip_allocation_policy {}

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 50  # Reduced disk size per node.
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}


# resource "google_container_node_pool" "primary_nodes" {
#   name       = "${var.cluster_name}-node-pool"
#   location   = var.region
#   cluster    = google_container_cluster.primary.name
#   node_count = 1

#   node_config {
#     machine_type = "e2-medium"
#     disk_size_gb = 50
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]
#   }
# }


data "google_container_cluster" "cluster_data" {
  name     = google_container_cluster.primary.name
  location = var.region
}
