output "vpc_id" {
  value = google_compute_network.main.id
}
output "self_link" {
  value = google_compute_network.main.self_link
}

output "subnetwork-id" {
  value = google_compute_subnetwork.private.id
}

output "subnetwork-self_link" {
  value = google_compute_subnetwork.private.self_link
}