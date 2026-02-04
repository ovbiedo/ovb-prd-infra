resource "random_password" "db" {
  length  = 24
  special = true
}

resource "google_secret_manager_secret" "db_password" {
  secret_id = "${var.name}-${var.env}-db-password"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "db_password_version" {
  secret      = google_secret_manager_secret.db_password.id
  secret_data = random_password.db.result
}

resource "google_sql_database_instance" "postgres" {
  name             = "${var.name}-${var.env}-psql"
  database_version = "POSTGRES_17"
  region           = var.region

  settings {
    tier = "db-custom-2-7680"
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc.id
    }
    backup_configuration {
      enabled = true
    }
  }

  depends_on = [google_service_networking_connection.private_vpc_connection]
}


#database for dashboard
resource "google_sql_database" "db" {
  name     = "${var.name}_${var.env}_dashboard"
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_user" "db_user" {
  name     = var.db_user
  instance = google_sql_database_instance.postgres.name
  password = random_password.db.result
}

#database for booking
resource "google_sql_database" "db" {
  name     = "${var.name}_${var.env}_booking"
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_user" "db_user" {
  name     = var.db_user
  instance = google_sql_database_instance.postgres.name
  password = random_password.db.result
}

#database for booking
resource "google_sql_database" "db" {
  name     = "${var.name}_${var.env}_event"
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_user" "db_user" {
  name     = var.db_user
  instance = google_sql_database_instance.postgres.name
  password = random_password.db.result
}