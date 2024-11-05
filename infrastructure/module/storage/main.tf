# resource "random_id" "default" {
#   byte_length = 8
# }

# resource "google_storage_bucket" "my_bucket" {
#   name                        = "${random_id.default.hex}-backend-bucket"
#   location                    = "US"
#   force_destroy               = false
#   public_access_prevention    = "enforced"
#   uniform_bucket_level_access = true
#   // Object Versioning must be enabled 
#   versioning {
#     enabled = true
#   }
# }

# resource "google_storage_bucket_iam_member" "member" {
#   bucket = google_storage_bucket.my_bucket.name
#   role   = "roles/storage.admin"
#   member = var.serviceAccount
# }

# resource "local_file" "default" {
#   file_permission = "0644"
#   # filename        = "${path.module}/backend.tf"
#   filename = "${path.root}/provider.tf"

#   # You can store the template in a file and use the templatefile function for
#   # more modularity, if you prefer, instead of storing the template inline as
#   # we do here.
#   content = <<-EOT
#   terraform {
#     backend "gcs" {
#       bucket = "${google_storage_bucket.my_bucket.name}"
#     }
#   }
#   EOT
# }