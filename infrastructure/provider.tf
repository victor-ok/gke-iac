terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.4.0"
    }
     kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.3"
     }
  }
  # backend "gcs" {
  #   bucket = "488b3dabc36d0b46-backend-bucket"
  # }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

data "google_client_config" "default" {
}

resource "google_container_cluster" "datetime-deploy" {
  name = var.cluster_name
  location = var.region
}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.datetime-deploy.endpoint}"
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.datetime-deploy.master_auth[0].cluster_ca_certificate,
  )
}