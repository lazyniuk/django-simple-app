terraform {
  backend "gcs" {
    bucket = "simple-app-storage"
    prefix = "simple-app/terraform/state"
  }
}
