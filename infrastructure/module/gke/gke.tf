# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
resource "google_container_cluster" "time-cluster" {
  name                     = var.cluster_name
  location                 = var.zone
  remove_default_node_pool = true
  initial_node_count       = 1
  # network                  = self_link
  # subnetwork               = subnetwork-self_link
  logging_service          = "none"
  monitoring_service       = "none"
  networking_mode          = "VPC_NATIVE"

  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  release_channel {
    channel = "REGULAR"
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.google"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pods-ip-range"
    services_secondary_range_name = "k8s-services-ip-range"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
}

resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool
resource "google_container_node_pool" "example-node-pool" {
  name       = var.node_pool_name
  cluster    = google_container_cluster.time-cluster.id
  node_count = 2

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count  = 1
    max_node_count  = 2
    location_policy = "BALANCED"
  }

  node_config {
    preemptible  = false
    machine_type = "e2-standard-4"

    labels = {
      role = "general"
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}