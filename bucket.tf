resource "google_storage_bucket" "media" {
  name     = "${var.name}-${var.env}-medium"
  location = var.region
  uniform_bucket_level_access = true
}