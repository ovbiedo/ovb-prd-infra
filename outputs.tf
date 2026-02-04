output "cluster_name" {
  value = google_container_cluster.autopilot.name
}

output "cluster_location" {
  value = google_container_cluster.autopilot.location
}

output "artifact_registry_repo" {
  value = google_artifact_registry_repository.repo.repository_id
}

output "media_bucket" {
  value = google_storage_bucket.media.name
}

output "cloud_sql_instance_connection_name" {
  value = google_sql_database_instance.postgres.connection_name
}

output "db_password_secret" {
  value = google_secret_manager_secret.db_password.id
}

output "lb_ip" {
  value = google_compute_global_address.lb_ip.address
}
